<?php

namespace App\Controller;

use App\Entity\Area;
use App\Entity\MedioAsignado_Trabajador_Fecha;
use App\Entity\MedioDeProteccion;
use App\Entity\MediosAsignados;
use App\Entity\TipoTallas;
use App\Entity\Trabajador;
use App\Entity\Traza;
use App\Entity\UnidadOrganizativa;
use App\Entity\Usuario;
use App\utils\Trazas;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * Mediodeproteccion controller.
 *
 * @Route("tecnico/mediodeproteccion")
 */
class MedioDeProteccionController extends AbstractController {

    /**
     * @Route("/", name="mediodeproteccion")
     */
    public function mediodeproteccion() {
        $em = $this->getDoctrine()->getManager();
        $talla = $em->getRepository(TipoTallas::class)->findAll();
        return $this->render('mediodeproteccion/mediosproteccion.html.twig',[
            'talla' => $talla,
        ]);
    }
    /**
     * @Route("/ajax", name="mpAjax")
     */
    public function mpAjax() {
        $em = $this->getDoctrine()->getManager();
        $medioDeProteccions = $em->getRepository(MedioDeProteccion::class)->findBy([],['id'=>'DESC']);
        $talla = $em->getRepository(TipoTallas::class)->findAll();
        return $this->render('mediodeproteccion/mpAjax.html.twig', array(
            'medio' => $medioDeProteccions,
            'talla' => $talla,
        ));
    }
    /**
     * @Route("/insertar/{idtrabajador}/{fecha}/{causas}/{listamediosid}/{cantidad}", name="mediodeproteccion_insertar")
     */
    public function mediodeproteccion_insertar($idtrabajador,$fecha,$causas,$listamediosid,$cantidad)
    {
        $em = $this->getDoctrine()->getManager();
        $trabajador = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $fech = new \DateTime($fecha);
        $lista = mb_split(',',$listamediosid);
        $cantidadLista = count($lista);
        for ($i = 0; $i < $cantidadLista; $i++)
        {
            if (!$this->BuscarAsignacion($idtrabajador,$lista[$i]))
            {
                $medio = $em->getRepository(MedioDeProteccion::class)->find($lista[$i]);
                $asignar = new MediosAsignados();
                $asignar->setCausas($causas);
                $asignar->setFecha($fech);
                $asignar->setIdTrabajador($trabajador);
                $asignar->setIdMedios($medio);
                $cantExist = $medio->getCantidad();
                //print_r($cantExist);die;
                $diferenciaExist = $cantExist -$cantidad;
                $medio->setCantidad($diferenciaExist);
                $asignar->setCantidad($cantidad);
                $em->persist($asignar);
                $em->persist($medio);
            }
        }
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nueva asignación de Medios de Protección: '.$trabajador->getNombre()." ".$trabajador->getApellidos()." ".$trabajador->getSegundoApellido(),$em);
        return $this->redirect($this->generateUrl('mediodeproteccion_asignarAjax'));
    }
    public function BuscarAsignacion($idtrabjador,$idmedio)
    {
        $em = $this->getDoctrine()->getManager();
        $medio = $em->getRepository(MediosAsignados::class)->findBy(['idMedios' => $idmedio,'idTrabajador'=>$idtrabjador]);
        if (count($medio)>0)
        {
            return true;
        }
        return false;
    }
    /**
     * @Route("/asignar", name="mediodeproteccion_asignar")
     */
    public function mediodeproteccion_asignar() {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre' => 'ASC']);
        $medioDeProteccions = $em->getRepository(MedioDeProteccion::class)->findAll();
        $talla = $em->getRepository(TipoTallas::class)->findAll();
        $uo = $em->getRepository(UnidadOrganizativa::class)->findAll();
        $medioTrabajador = $em->getRepository(MediosAsignados::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        return $this->render('mediodeproteccion/asignar.html.twig', array(
            'trabajadores' => $trabajadores,
            'medio' => $medioDeProteccions,
            'talla' => $talla,
            'medioTrabajador' => $medioTrabajador,
            'unidadOrganizativa' => $uo,
            'area' => $area,
        ));
    }
    /**
     * @Route("/asignar/ajax", name="mediodeproteccion_asignarAjax")
     */
    public function mediodeproteccion_asignarAjax() {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT ma FROM App\Entity\MediosAsignados ma
         INNER JOIN App\Entity\Trabajador t WITH ma.idTrabajador =
          t.id WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $medio=$consulta->getResult();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre' => 'ASC']);
        //$medioDeProteccions = $em->getRepository(MedioDeProteccion::class)->findAll();
        $talla = $em->getRepository(TipoTallas::class)->findAll();
        //$medioTrabajador = $em->getRepository(MediosAsignados::class)->findBy([],['id'=>'DESC']);
        return $this->render('mediodeproteccion/asignarMPAjax.html.twig', array(
          //  'trabajadores' => $trabajadores,
            'medios' => $trabajadores,
            'talla' => $talla,
            'medioTrabajador' => $medio
        ));
    }
    /**
     * @Route("/delete/asignar/{id}", name="mediodeproteccion_deleteasignar")
     */
    public function mediodeproteccion_deleteasignar($id) {
        $em = $this->getDoctrine()->getManager();
        $mp = $em->getRepository(MediosAsignados::class)->find($id);
        $em->remove($mp);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino asignación de Medio de Protección ',$em);
        return $this->redirect($this->generateUrl('mediodeproteccion_asignarAjax'));
    }
    /**
     * @Route("/new/{descripcion}/{vidautil}/{um}/{codigo}/{idtalla}/{cantidad}/{costo}", name="mediodeproteccion_new")
     */
    public function mediodeproteccion_new($descripcion,$vidautil,$um,$codigo,$idtalla,$cantidad,$costo) {
        $em = $this->getDoctrine()->getManager();
        $medioDeProteccion = new Mediodeproteccion();
        $medioDeProteccion->setDescripcion($descripcion);
        $medioDeProteccion->setVidaUtil($vidautil);
        $medioDeProteccion->setUm($um);
        $medioDeProteccion->setCodigo($codigo);
        $talla = $em->getRepository(TipoTallas::class)->find($idtalla);
        $medioDeProteccion->setIdTipoTalla($talla);
        $medioDeProteccion->setCantidad($cantidad);
        $medioDeProteccion->setCosto($costo);
        $em->persist($medioDeProteccion);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nuevo Medios de Protección: '.$medioDeProteccion->getDescripcion(),$em);
        return $this->redirect($this->generateUrl('mpAjax'));
    }
    /**
     * @Route("/edit/{id}/{descripcion}/{vidautil}/{codigo}/{idtalla}/{cantidad}/{costo}", name="mediodeproteccion_edit")
     */
    public function mediodeproteccion_edit($id,$descripcion,$vidautil,$codigo,$idtalla,$cantidad,$costo) {
        $em = $this->getDoctrine()->getManager();
        $mp = $em->getRepository(MedioDeProteccion::class)->find($id);
        $mp->setDescripcion($descripcion);
        $mp->setVidaUtil($vidautil);
        $mp->setCodigo($codigo);
        if ($idtalla != "nulo")
        {
            $talla = $em->getRepository(TipoTallas::class)->find($idtalla);
            $mp->setIdTipoTalla($talla);
        }
        $mp->setCantidad($cantidad);
        $mp->setCosto($costo);
        $em->persist($mp);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nuevo Medios de Protección: '.$mp->getDescripcion(),$em);
        return $this->redirect($this->generateUrl('mpAjax'));
    }
    /**
     * @Route("/delete/{id}", name="mediodeproteccion_delete")
     */
    public function mediodeproteccion_delete($id) {
        $em = $this->getDoctrine()->getManager();
        $mp = $em->getRepository(MedioDeProteccion::class)->find($id);
        $em->remove($mp);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino Medios de Protección: '.$mp->getDescripcion(),$em);
        return $this->redirect($this->generateUrl('mpAjax'));
    }
    /**
     * @Route("/entregas/{fecha}/{uo}", name="EUOF")
     */
    public function EUOF($fecha,$uo)
    {
        $em = $this->getDoctrine()->getManager();
        $picarF = mb_split('-',$fecha);
        $fecha1 = new \DateTime($picarF[0]);
        $fecha2 = new \DateTime($picarF[1]);
        $sql = "SELECT mat FROM App\Entity\MediosAsignados mat
                INNER JOIN App\Entity\MedioDeProteccion mp WITH  mat.idMedios = mp.id 
                INNER JOIN App\Entity\Trabajador t WITH  mat.idTrabajador = t.id               
                INNER JOIN App\Entity\UnidadOrganizativa uo WITH  t.idUnidadOrganizativa = uo.id                
                WHERE uo.nombre = '".$uo."' and '".$fecha1->format('Y-m-d')."' <= mat.fecha AND mat.fecha <= '".$fecha2->format('Y-m-d')."'
                ORDER BY mat.id DESC";
        $consulta = $em->createQuery($sql);
        $mediosTrabajador = $consulta->getResult();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy([],['nombre' => 'ASC']);
        $medioDeProteccions = $em->getRepository(MedioDeProteccion::class)->findAll();
        $talla = $em->getRepository(TipoTallas::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        return $this->render('mediodeproteccion/asignarMPAjax.html.twig', array(
            'trabajadores' => $trabajadores,
            'medio' => $medioDeProteccions,
            'talla' => $talla,
            'area' => $area,
            'medioTrabajador' => $mediosTrabajador
        ));
    }
    /**
     * @Route("/entregasTF/{fecha}/{idtrabajador}", name="ETF")
     */
    public function ETF($fecha,$idtrabajador)
    {

        $em = $this->getDoctrine()->getManager();
        $picarFT = mb_split('-',$fecha);
        $fecha1 = new \DateTime($picarFT[0]);
        $fecha2 = new \DateTime($picarFT[1]);
        $sql = "SELECT mat FROM App\Entity\MediosAsignados mat
                INNER JOIN App\Entity\MedioDeProteccion mp WITH  mat.idMedios = mp.id
                WHERE mat.idTrabajador = ".$idtrabajador." and '".$fecha1->format('Y-m-d')."' <= mat.fecha AND mat.fecha <= '".$fecha2->format('Y-m-d')."'
                ORDER BY mat.id DESC";
        $consulta = $em->createQuery($sql);
        $mediosTrabajador = $consulta->getResult();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy([],['nombre' => 'ASC']);
        $medioDeProteccions = $em->getRepository(MedioDeProteccion::class)->findAll();
        $talla = $em->getRepository(TipoTallas::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        return $this->render('mediodeproteccion/asignarMPAjax.html.twig', array(
            'trabajadores' => $trabajadores,
            'medio' => $medioDeProteccions,
            'talla' => $talla,
            'area' => $area,
            'medioTrabajador' => $mediosTrabajador
        ));
    }
    /**
     * @Route("/entregasArea/{area}", name="EXA")
     */
    public function EXA($area)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT mat FROM App\Entity\MediosAsignados mat
                INNER JOIN App\Entity\MedioDeProteccion mp WITH  mat.idMedios = mp.id 
                INNER JOIN App\Entity\Trabajador t WITH  mat.idTrabajador = t.id               
                INNER JOIN App\Entity\Area a WITH  t.idArea = a.id                
                WHERE a.nombre = '".$area."'";
        $consulta = $em->createQuery($sql);
        $mediosTrabajador = $consulta->getResult();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy([],['nombre' => 'ASC']);
        $medioDeProteccions = $em->getRepository(MedioDeProteccion::class)->findAll();
        $talla = $em->getRepository(TipoTallas::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        return $this->render('mediodeproteccion/asignarMPAjax.html.twig', array(
            'trabajadores' => $trabajadores,
            'medio' => $medioDeProteccions,
            'talla' => $talla,
            'area' => $area,
            'medioTrabajador' => $mediosTrabajador
        ));
    }
    /**
     * @Route("/demanda/{uo}", name="demandaMP")
     */
    public function demandaMP($uo)
    {
        $fechaActual = new \DateTime('today');
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT mat FROM App\Entity\MediosAsignados mat
                INNER JOIN App\Entity\MedioDeProteccion mp WITH  mat.idMedios = mp.id 
                INNER JOIN App\Entity\Trabajador t WITH  mat.idTrabajador = t.id               
                INNER JOIN App\Entity\UnidadOrganizativa uo WITH  t.idUnidadOrganizativa = uo.id                
                WHERE uo.id = ".$uo."";
        $consulta = $em->createQuery($sql);
        $mediosTrabajador = $consulta->getResult();
        $resultado = array();
        for($i = 0, $iMax = count($mediosTrabajador); $i < $iMax; $i++)
        {
            $fechaEntrega = $mediosTrabajador[$i]->getFecha();
            $vidaUtil = $mediosTrabajador[$i]->getIdMedios()->getVidaUtil();
            $diff = $fechaEntrega->diff($fechaActual);
            $diferencia = $diff->days;

            $dif = $vidaUtil - $diferencia;
            $descripcion = $mediosTrabajador[$i]->getIdMedios()->getDescripcion();
            $cantidadMP = $this->cantidadMP($mediosTrabajador[$i]->getIdMedios()->getId(),$mediosTrabajador);
            $cantidadPorciento = ($cantidadMP * 10)/100 + $cantidadMP;

            if ($dif < 60){
                if (!$this->estaMP($descripcion,$resultado))
                {
                    $resultado[] = array('descripcion' => $descripcion, 'cantidad' => $cantidadMP, 'cantidadPorciento' => $cantidadPorciento);
                }
            }
        }
        //print_r($resultado);die;
        return $this->render('mediodeproteccion/demandaAjax.html.twig', array(
            'medioTrabajador' => $resultado,
        ));
    }
    public function cantidadMP($id,$medios)
    {
        $cantidad = 0;
        for($i = 0, $iMax = count($medios); $i < $iMax; $i++)
        {
            if ($medios[$i]->getIdMedios()->getId() == $id){
                $cantidad++;
            }
        }
        return $cantidad;
    }
    public function estaMP($descripcion,$resultado)
    {
        for($i = 0, $iMax = count($resultado); $i < $iMax; $i++)
        {
            if ($resultado[$i]['descripcion'] == $descripcion){
                return true;
            }
        }
        return false;
    }
    /**
     * @Route("/demandaTrab/{idtrabajador}", name="demandaTrab")
     */
    public function demandaTrab($idtrabajador)
    {
        $fechaActual = new \DateTime('today');
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT mat FROM App\Entity\MediosAsignados mat
                INNER JOIN App\Entity\MedioDeProteccion mp WITH  mat.idMedios = mp.id 
                INNER JOIN App\Entity\Trabajador t WITH  mat.idTrabajador = t.id
                WHERE t.id = ".$idtrabajador."";
        $consulta = $em->createQuery($sql);
        $mediosTrabajador = $consulta->getResult();
        $resultado = array();
        for($i = 0, $iMax = count($mediosTrabajador); $i < $iMax; $i++)
        {
            $fechaEntrega = $mediosTrabajador[$i]->getFecha();
            $vidaUtil = $mediosTrabajador[$i]->getIdMedios()->getVidaUtil();
            $diff = $fechaEntrega->diff($fechaActual);
            $diferencia = $diff->days;
            //print_r($diferencia.'<br/>');
            //$dif = $vidaUtil - $diferencia;
            $descripcion = $mediosTrabajador[$i]->getIdMedios()->getDescripcion();
            //$cantidadMP = $this->cantidadMP($mediosTrabajador[$i]->getIdMedios()->getId(),$mediosTrabajador);
            //$cantidadPorciento = ($cantidadMP * 10)/100 + $cantidadMP;
            //print_r($vidaUtil.'--'.$diferencia.'--'.$dif.'--'.$descripcion.'<br/>');
            if ($diferencia > $vidaUtil){
                $resultado[] = array('descripcion' => $descripcion, 'tiempo' => $diferencia);
                /*if (!$this->estaMP($descripcion,$resultado))
                {
                    //$resultado[] = array('descripcion' => $descripcion, 'cantidad' => $cantidadMP, 'cantidadPorciento' => $cantidadPorciento);
                }*/
            }
        }
        //print_r($resultado);die;
        return $this->render('mediodeproteccion/demandaTrabajadorAjax.html.twig', array(
            'medioTrabajador' => $resultado,
        ));
    }
    /**
     * @Route("/presupuesto", name="presupuesto")
     */
    public function presupuesto()
    {
        $em = $this->getDoctrine()->getManager();
        $fechaActual = new \DateTime('now');
        $annoActual = $fechaActual->format('Y');
        $resultado = array();
        $mp = $em->getRepository(MediosAsignados::class)->findAll();
        $total = count($mp);
        for ($i = 0; $i < $total; $i++)
        {
            $fecha = $mp[$i]->getFecha();
            $anno = $fecha->format('Y');
            if ($annoActual == $anno)
            {
                $resultado[] = $mp[$i];
            }
        }
        return $this->render('mediodeproteccion/mpPresupuestoAjax.html.twig', array(
            'mediosPresupuesto' => $resultado
        ));
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
    /**
     * @Route("/balance", name="balance")
     */
    public function balance()
    {
        $em = $this->getDoctrine()->getManager();
        $fechaActual = new \DateTime('today');
        $medioAsignado =  $em->getRepository(MediosAsignados::class)->findAll();
        $resultado = array();
        $cantInsatmedio = 0;
        for ($i = 0; $i < count($medioAsignado); $i++)
        {
            $fechaAsignada = $medioAsignado[$i]->getFecha();
            $vidaUtil = $medioAsignado[$i]->getIdMedios()->getVidaUtil();
            $diff = $fechaAsignada->diff($fechaActual);
            $diferencia = $diff->days;
            $descripcion = $medioAsignado[$i]->getIdMedios()->getDescripcion();
            if ($diferencia > $vidaUtil)
            {
                if ($medioAsignado[$i]->getIdMedios()->getCantidad() == 0)
                {
                    $cantInsatmedio ++;
                }
                else
                {
                    $cantInsatmedio ++;
                }
            }
            if (!$this->estaMP($descripcion,$resultado))
            {
                $resultado[] = array('descripcion' => $descripcion, 'demandaInsatisfecha' => $cantInsatmedio);
                $cantInsatmedio = 0;
            }
            else
            {
                for ($j = 0; $j < count($resultado); $j++)
                {
                    if($resultado[$j]['descripcion'] == $descripcion)
                    {
                        $resultado[$j]['demandaInsatisfecha'] = $cantInsatmedio;
                    }
                }
            }
        }
        return $this->render('mediodeproteccion/balanceMPAjax.html.twig', [
            'resultado' => $resultado,
        ]);
    }
}
