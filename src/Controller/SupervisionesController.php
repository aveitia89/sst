<?php

namespace App\Controller;

use App\Entity\Area;
use App\Entity\DeficienciasDetectadas;
use App\Entity\NivelSupervision;
use App\Entity\PlanDeMedidas;
use App\Entity\Probabilidad;
use App\Entity\Riesgo;
use App\Entity\Severidad;
use App\Entity\Supervision;
use App\Entity\SupervisionNivel1;
use App\Entity\Trabajador;
use App\Entity\Traza;
use App\Entity\UnidadOrganizativa;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use function Couchbase\defaultDecoder;


/**
 * SupervisionNivel1 controller.
 *
 * @Route("brigada/supervision")
 */
class SupervisionesController extends AbstractController {
    /**
     * @Route("/", name="supervision")
     */
    public function supervision() {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre' => 'ASC']);
        $tipoSupervision = $em->getRepository(NivelSupervision::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        $deficiencias = $em->getRepository(DeficienciasDetectadas::class)->findAll();
        $supervision = $em->getRepository(Supervision::class)->findBy([],['id' => 'DESC']);
        $riesgos = $em->getRepository(Riesgo::class)->findBy([],['id' => 'DESC']);
        $probalidad = $em->getRepository(Probabilidad::class)->findAll();
        $severidad = $em->getRepository(Severidad::class)->findAll();
        return $this->render('supervision/supervisiones.html.twig', array(
            'trabajadores' => $trabajadores,
            'tipoSupervision' => $tipoSupervision,
            'area' => $area,
            'deficiencias' => $deficiencias,
            'supervision' => $supervision,
            'riesgos' => $riesgos,
            'probalidad' => $probalidad,
            'severidad' => $severidad,
        ));
    }
    /**
     * @Route("/ajax", name="supervisionAjax")
     */
    public function supervisionAjax() {
        $em = $this->getDoctrine()->getManager();
        $supervision = $em->getRepository(Supervision::class)->findBy([],['id' => 'DESC']);
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre' => 'ASC']);
        $tipoSupervision = $em->getRepository(NivelSupervision::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        $deficiencias = $em->getRepository(DeficienciasDetectadas::class)->findAll();
        $riesgos = $em->getRepository(Riesgo::class)->findBy([],['id' => 'DESC']);
        $probalidad = $em->getRepository(Probabilidad::class)->findAll();
        $severidad = $em->getRepository(Severidad::class)->findAll();
        return $this->render('supervision/supervisionAjax.html.twig', array(
            'supervision' => $supervision,
            'trabajadores' => $trabajadores,
            'tipoSupervision' => $tipoSupervision,
            'area' => $area,
            'deficiencias' => $deficiencias,
            'riesgos' => $riesgos,
            'probalidad' => $probalidad,
            'severidad' => $severidad,
        ));
    }
    /**
     * @Route("/plandemedidas", name="plandemedidas")
     */
    public function plandemedidas() {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre' => 'ASC']);
        $tipoSupervision = $em->getRepository(NivelSupervision::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        return $this->render('supervision/plan.html.twig', array(
            'trabajadores' => $trabajadores,
            'tipoSupervision' => $tipoSupervision,
            'area' => $area,
        ));
    }
    /**
     * @Route("/areaUO/{id}", name="areaUO")
     */
    public function areaUO($id)
    {
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->find($id);
        $unidadOrganizativa = $area->getArea();
        $arr = array();
        for ($i = 0; $i < count($unidadOrganizativa); $i++)
        {
            $arr[] = array('id' => $unidadOrganizativa[$i]->getIdUO()->getId(), 'nombre' => $unidadOrganizativa[$i]->getIdUO()->getNombre());
        }
        $response = new Response(json_encode($arr));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }
    /**
     * @Route("/resposableUO/{idUO}/{idArea}", name="trabajadorUO")
     */
    public function trabajadorUO($idUO,$idArea)
    {
        $em = $this->getDoctrine()->getManager();
        $trabajador = $em->getRepository(Trabajador::class)->findBy(['idUnidadOrganizativa' => $idUO, 'idArea' => $idArea]);
        $arr = array();
        for ($i = 0; $i < count($trabajador); $i++)
        {
            $arr[] = array('id' => $trabajador[$i]->getId(), 'nombre' => $trabajador[$i]->getNombre()." ".$trabajador[$i]->getApellidos()." ".$trabajador[$i]->getSegundoApellido());
        }
        $response = new Response(json_encode($arr));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }
    /**
     * @Route("/insertar/{idArea}/{idUO}/{idtrabajador}/{idNivel}/{estado}/{iddeficiencia}", name="insertarSupervisionNivel1")
     */
    public function insertarSupervisionNivel1($idArea,$idUO,$idtrabajador,$idNivel,$estado,$iddeficiencia)
    {
        $em = $this->getDoctrine()->getManager();
        $supervision = new Supervision();
        $area = $em->getRepository(Area::class)->find($idArea);
        $uo = $em->getRepository(UnidadOrganizativa::class)->find($idUO);
        $trabajador = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $nivel = $em->getRepository(NivelSupervision::class)->find($idNivel);
        $deficiencia = $em->getRepository(DeficienciasDetectadas::class)->find($iddeficiencia);
        $supervision->setIdarea($area);
        $supervision->setIdUO($uo);
        $supervision->addTrabajadore($trabajador);
        $supervision->addDeficiencia($deficiencia);
        $supervision->setIdnivel($nivel);
        $supervision->setEstado($estado);

        $em->persist($supervision);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nueva supervisión:'.$nivel->getNivel(),$em);
        return $this->redirect($this->generateUrl('supervisionAjax'));
    }
    /**
     * @Route("/insertar/{idArea}/{idUO}/{idtrabajador}/{idNivel}/{estado}/{iddeficiencia}/{fecha}/{aspecto}/{observaciones}", name="insertarSupervisionNivel2")
     */
    public function insertarSupervisionNivel2($idArea,$idUO,$idtrabajador,$idNivel,$estado,$iddeficiencia,$fecha,$aspecto,$observaciones)
    {
        $em = $this->getDoctrine()->getManager();
        $supervision = new Supervision();
        $area = $em->getRepository(Area::class)->find($idArea);
        $uo = $em->getRepository(UnidadOrganizativa::class)->find($idUO);
        $trabajador = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $nivel = $em->getRepository(NivelSupervision::class)->find($idNivel);
        $deficiencia = $em->getRepository(DeficienciasDetectadas::class)->find($iddeficiencia);
        $supervision->setIdarea($area);
        $supervision->setIdUO($uo);
        $supervision->addTrabajadore($trabajador);
        $supervision->addDeficiencia($deficiencia);
        $supervision->setIdnivel($nivel);
        $supervision->setEstado($estado);
        $supervision->setFecha(new \DateTime($fecha));
        $supervision->setAspecto($aspecto);
        $supervision->setObservaciones($observaciones);

        $em->persist($supervision);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nueva supervisión:'.$nivel->getNivel(),$em);
        return $this->redirect($this->generateUrl('supervisionAjax'));
    }
    /**
     * @Route("/insertar/{idArea}/{idUO}/{idtrabajador}/{idNivel}/{estado}/{iddeficiencia}/{fecha}/{aspecto}/{observaciones}", name="insertarSupervisionNivel3")
     */
    public function insertarSupervisionNivel3($idArea,$idUO,$idtrabajador,$idNivel,$estado,$iddeficiencia,$fecha,$aspecto,$observaciones)
    {
        $em = $this->getDoctrine()->getManager();
        $supervision = new Supervision();
        $area = $em->getRepository(Area::class)->find($idArea);
        $uo = $em->getRepository(UnidadOrganizativa::class)->find($idUO);
        $trabajador = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $nivel = $em->getRepository(NivelSupervision::class)->find($idNivel);
        $deficiencia = $em->getRepository(DeficienciasDetectadas::class)->find($iddeficiencia);
        $supervision->setIdarea($area);
        $supervision->setIdUO($uo);
        $supervision->addTrabajadore($trabajador);
        $supervision->addDeficiencia($deficiencia);
        $supervision->setIdnivel($nivel);
        $supervision->setEstado($estado);
        $supervision->setFecha(new \DateTime($fecha));
        $supervision->setAspecto($aspecto);
        $supervision->setObservaciones($observaciones);
        Traza::save($this->userTraza(),'Insertó nueva supervisión:'.$nivel->getNivel(),$em);
        $em->persist($supervision);
        $em->flush();

        return $this->redirect($this->generateUrl('supervisionAjax'));
    }
    /**
     * @Route("/insertarRiesgo/{idSupervision}/{descripcion}/{idprobabilidad}/{idseveridad}", name="insertarRiesgo")
     */
    public function insertarRiesgo($idSupervision,$descripcion,$idprobabilidad,$idseveridad)
    {
        $em = $this->getDoctrine()->getManager();
        $supervision = $em->getRepository(Supervision::class)->find($idSupervision);
        $prob = $em->getRepository(Probabilidad::class)->find($idprobabilidad);
        $sev = $em->getRepository(Severidad::class)->find($idseveridad);
        $riesgo = new Riesgo();
        $riesgo->setDescripcion($descripcion);
        $riesgo->setIdsupervision($supervision);
        $riesgo->setIdprobabilidad($prob);
        $riesgo->setIdseveridad($sev);
        $em->persist($riesgo);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó riesgos de la Supervisión'.$supervision->getidSupervision(),$em);
        return $this->redirect($this->generateUrl('supervisionAjax'));
    }
    /**
     * @Route("/insertarMedidas/{idSupervision}/{idRiesgo}/{peligro}/{clasificacion}/{fechaCumplimiento}/{estado}/{medida}", name="insertarMedidas")
     */
    public function insertarMedidas($idSupervision,$idRiesgo,$peligro,$clasificacion,$fechaCumplimiento,$estado,$medida)
    {
        $em = $this->getDoctrine()->getManager();
        $supervision = $em->getRepository(Supervision::class)->find($idSupervision);
        $riesgo = $em->getRepository(Riesgo::class)->find($idRiesgo);
        $planMedidas = new PlanDeMedidas();
        $planMedidas->setIdsupervision($supervision);
        $planMedidas->setIdRiesgo($riesgo);
        $planMedidas->setPeligros($peligro);
        $planMedidas->setClasificacion($clasificacion);
        $planMedidas->setFechaCumplimiento(new \DateTime($fechaCumplimiento));
        if ($estado == "Cumplido"){
            $planMedidas->setEstado(true);
        }else{
            $planMedidas->setEstado(false);
        }
        $planMedidas->setMedida($medida);
        $em->persist($planMedidas);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nueva medida del riesgo: '.$riesgo->getDescripcion(),$em);
        return $this->redirect($this->generateUrl('supervisionAjax'));
    }
    /**
     * @Route("/eliminarSup/{idSupervision}", name="eliminarSupervision")
     */
    public function eliminarSupervision($idSupervision)
    {
        $em = $this->getDoctrine()->getManager();
        $supervision = $em->getRepository(Supervision::class)->find($idSupervision);
        $em->remove($supervision);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino supervisión: '.$supervision->getidSupervision(),$em);
        return $this->redirect($this->generateUrl('supervisionAjax'));
    }
    public function userTraza()
    {
        $username = $this->getUser();
        if($username != null    )
        {
            return $usuario = $this->getUsuario($username->getId());
        }
        else
        {
            return $this->redirect($this->generateUrl('login'));
        }
    }
    public function getUsuario($id) {
        $em = $this->getDoctrine()->getManager();
        return $em->getRepository(Usuario::class)->findOneBy(array("id" => $id));
    }
    /**
     * @Route("/traza/{idusuario}", name="TrazaUser")
     */
    public function TrazaUser($idusuario)
    {
        $bd = $this->getDoctrine()->getManager();
        $traza = $bd->getRepository(Traza::class)->findBy(['idUsuario' => $idusuario]);
        return $this->render('nomencladores/trazas.html.twig', [
            'trazas' => $traza,
        ]);
    }
    public function getIdAreaUsuario()
    {
        $em = $this->getDoctrine()->getManager();
        $username = $this->getUser();
        $usuario = $em->getRepository(Usuario::class)->find($username->getId());
        return $usuario->getIdArea()->getId();
    }

}
