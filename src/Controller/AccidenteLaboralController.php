<?php

namespace App\Controller;

use App\Entity\AccidenteLaboral;
use App\Entity\AgenteMaterial;
use App\Entity\Area;
use App\Entity\Causa;
use App\Entity\EspecificacionesDeAgentematerial;
use App\Entity\EspecificacionesDeCausas;
use App\Entity\FormaDeAccidente;
use App\Entity\LugarDeTrabajoAccidente;
use App\Entity\NaturalezaLesion;
use App\Entity\PartesDelCuerpoLesionado;
use App\Entity\TipoAccidentes;
use App\Entity\Trabajador;
use App\Entity\Traza;
use App\Entity\UnidadOrganizativa;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Accidentelaboral controller.
 *
 * @Route("tecnico/accidentelaboral")
 */
class AccidenteLaboralController extends AbstractController {

    /**
     * @Route("/", name="accidentelaboral")
     */
    public function accidentelaboral() {
        $em = $this->getDoctrine()->getManager();
        $trabajador = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre' => 'ASC']);
        $tipo = $em->getRepository(TipoAccidentes::class)->findAll();
        $forma = $em->getRepository(FormaDeAccidente::class)->findAll();
        $lugar = $em->getRepository(LugarDeTrabajoAccidente::class)->findAll();
        $causas = $em->getRepository(Causa::class)->findAll();
        $agenteMaterial = $em->getRepository(AgenteMaterial::class)->findAll();
        $naturalezaLesion = $em->getRepository(NaturalezaLesion::class)->findAll();
        $parteLesion = $em->getRepository(PartesDelCuerpoLesionado::class)->findAll();
        $unidadOrg = $em->getRepository(Area::class)->findAll();

        return $this->render('accidentelaboral/accidenteLaboral.html.twig', [
            'trabajador' => $trabajador,
            'tipo' => $tipo,
            'forma' => $forma,
            'lugar' => $lugar,
            'causas' => $causas,
            'agentematerial' => $agenteMaterial,
            'lesion' => $naturalezaLesion,
            'parteLesion' => $parteLesion,
            'unidadOrganizativa' => $unidadOrg
        ]);
    }
    /**
     * @Route("/ajax", name="accidentelaboralAjax")
     */
    public function accidentelaboralAjax() {
        $em = $this->getDoctrine()->getManager();
        //$trabajador = $em->getRepository(Trabajador::class)->findBy([],['nombre' => 'ASC']);
        $tipo = $em->getRepository(TipoAccidentes::class)->findAll();
        $forma = $em->getRepository(FormaDeAccidente::class)->findAll();
        $lugar = $em->getRepository(LugarDeTrabajoAccidente::class)->findAll();
        $causas = $em->getRepository(Causa::class)->findAll();
        $agenteMaterial = $em->getRepository(AgenteMaterial::class)->findAll();
        $naturalezaLesion = $em->getRepository(NaturalezaLesion::class)->findAll();
        $parteLesion = $em->getRepository(PartesDelCuerpoLesionado::class)->findAll();
        $sql = "SELECT ac FROM App\Entity\AccidenteLaboral ac
         INNER JOIN App\Entity\Trabajador t WITH ac.idTrabajador =
          t.id WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $accidente = $consulta->getResult();
        //$accidenteLaborals = $em->getRepository(AccidenteLaboral::class)->findBy([],['id'=
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre'=>'ASC']);
        return $this->render('accidentelaboral/accidenteLaboralAjax.html.twig', [
            'accidenteLaborals' => $accidente,
            /*'accidente'=>$trabajadores,*/
            'trabajador' => $trabajadores,
            'tipo' => $tipo,
            'forma' => $forma,
            'lugar' => $lugar,
            'causas' => $causas,
            'agentematerial' => $agenteMaterial,
            'lesion' => $naturalezaLesion,
            'parteLesion' => $parteLesion,
        ]);
    }
    /**
     * @Route("/agente/{id}", name="especificacioneAgente")
     */
    public function especificacioneAgente($id) {
        $em = $this->getDoctrine()->getManager();
        $especificaciones = $em->getRepository(EspecificacionesDeAgentematerial::class)->findBy(['idagenteMaterial' => $id]);
        $arr = array();
        for ($i = 0; $i < count($especificaciones); $i++)
        {
            $arr[] = array('id' => $especificaciones[$i]->getId(), 'nombre'=>$especificaciones[$i]->getNombre());
        }
        $response = new Response(json_encode($arr));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }
    /**
     * @Route("/causas/{id}", name="especificacioneCausas")
     */
    public function especificacioneCausas($id) {
        $em = $this->getDoctrine()->getManager();
        $especificaciones = $em->getRepository(EspecificacionesDeCausas::class)->findBy(['idCausa' => $id]);
        $arr = array();
        for ($i = 0; $i < count($especificaciones); $i++)
        {
            $arr[] = array('id' => $especificaciones[$i]->getId(), 'nombre'=>$especificaciones[$i]->getNombre());
        }
        $response = new Response(json_encode($arr));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }
    /**
     * @Route("/registrar", name="registrarAccidente")
     */
    public function registrarAccidente(){
        //print_r($_POST);die;
        $em = $this->getDoctrine()->getManager();
        $accidente = new AccidenteLaboral();
        $trabajador = $em->getRepository(Trabajador::class)->find($_POST['trabajador']);
        $accidente->setIdTrabajador($trabajador);
        $tipo = $em->getRepository(TipoAccidentes::class)->find($_POST['tipo']);
        $accidente->setIdtipo($tipo);
        $forma = $em->getRepository(FormaDeAccidente::class)->find($_POST['formas']);
        $accidente->setIdformaAccidentes($forma);
        $lugar = $em->getRepository(LugarDeTrabajoAccidente::class)->find($_POST['lugar']);
        $accidente->setIdlugarAccidente($lugar);
        $fechaInicio = new \DateTime($_POST['fechaInicio']);
        $accidente->setFechaInicio($fechaInicio);
        $fechaFin = new \DateTime($_POST['fechaFin']);
        $accidente->setFechaTerminacion($fechaFin);
        $accidente->setHorarioDeTrabajo($_POST['horario']);
        $accidente->setTurnosDeTrabajo($_POST['turno']);
        $causaEspecificaciones = $em->getRepository(EspecificacionesDeCausas::class)->find(['id' => $_POST['especificacionesCausas']]);
        $accidente->setIdCausaEspecificaciones($causaEspecificaciones);
        $agenteEspecificaciones = $em->getRepository(EspecificacionesDeAgentematerial::class)->find(['id' => $_POST['especificacionesAgente']]);
        $accidente->setIdAgenteEspecificaciones($agenteEspecificaciones);
        $parteLesionada = $em->getRepository(PartesDelCuerpoLesionado::class)->find($_POST['partes']);
        $accidente->addLesion($parteLesionada);
        $lesion = $em->getRepository(NaturalezaLesion::class)->find($_POST['lesion']);
        $accidente->addNaturaleza($lesion);
        $accidente->setCostoDirecto($_POST['directos']);
        $accidente->setCostoIndirecto($_POST['indirectos']);
        $accidente->setDescripcionAccidenete($_POST['descripcion']);
        $accidente->setObservacion($_POST['observaciones']);
        $em->persist($accidente);
        $em->flush();
        Traza::save($this->userTraza(),'Inserta nuevo Accidente de Trabajo: '.$trabajador->getNombre()." ".$trabajador->getApellidos()." ".$trabajador->getSegundoApellido(),$em);
        return $this->redirect($this->generateUrl('accidentelaboral'));
    }
    /**
     * @Route("/editar", name="accidenteEditar")
     */
    public function accidenteEditar()
    {
        print_r("");die;
    }

    /**
     * @Route("/eliminar/{id}", name="accidenteEliminar")
     */
    public function accidenteEliminar($id){
        $em = $this->getDoctrine()->getManager();
        $accidente = $em->getRepository(AccidenteLaboral::class)->find($id);
        $em->remove($accidente);
        $em->flush();
        return $this->redirect($this->generateUrl('accidentelaboralAjax'));
    }
    /**
     * @Route("/resumen/{uo}", name="resumen")
     */
    public function resumen($uo)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT alt FROM App\Entity\AccidenteLaboral alt  
                INNER JOIN  App\Entity\Trabajador t WITH alt.idTrabajador = t.id 
                INNER JOIN  App\Entity\Area a WITH t.idArea = a.id
                WHERE a.id = ".$uo."";
        $consulta = $em->createQuery($sql);
        $accidenteLaborals = $consulta->getResult();
        return $this->render('accidentelaboral/accidenteLaboralAjax.html.twig', [
            'accidenteLaborals' => $accidenteLaborals,
        ]);
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
