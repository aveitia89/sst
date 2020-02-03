<?php

namespace App\Controller;

use App\Entity\Area;
use App\Entity\ChequeoMedico;
use App\Entity\Trabajador;
use App\Entity\Traza;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Chequeomedico controller.
 *
 * @Route("tecnico/chequeomedico")
 */
class ChequeoMedicoController extends AbstractController {

    /**
     * @Route("/", name="chequeomedico")
     */
    public function chequeomedico() 
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT t FROM App\Entity\Trabajador t                
                WHERE t.idCargo = 52 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 53 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 54 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 55 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 56 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 57 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 58 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 59 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 60 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 61 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 62 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 63 AND t.idArea = ".$this->getIdAreaUsuario()."
                ORDER BY t.nombre ASC";
        $consulta = $em->createQuery($sql);
        $trabajadores = $consulta->getResult();
        $Areas = $em->getRepository(Area::class)->findAll();
        return $this->render('chequeomedico/chequeomedico.html.twig', array(
            'trabajador' => $trabajadores,
            'areas' => $Areas,
        ));
    }
    /**
     * @Route("/ajax", name="chequeomedicoAjax")
     */
    public function chequeomedicoAjax()
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT cm FROM App\Entity\ChequeoMedico cm
         INNER JOIN App\Entity\Trabajador t WITH cm.idTrabajador =
          t.id WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $chequeo=$consulta->getResult();
        $chequeoMedicos = $em->getRepository(ChequeoMedico::class)->findBy([],['id'=>'DESC']);
        return $this->render('chequeomedico/chequeoAjax.html.twig', array(
            'chequeoMedicos' => $chequeo,
            'chequeo'=>$chequeoMedicos,
        ));
    }
    /**
     * @Route("/registrar/{idtrabajador}/{fecha}/{estado}/{observaciones}", name="registrarChequeo")
     */
    public function registrarChequeo($idtrabajador,$fecha,$estado,$observaciones)
    {
        $em = $this->getDoctrine()->getManager();
        $trabajador = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $tiempoChequeo = $trabajador->getIdCargo()->getTiempoChequeo();
        $fechaEntrega = new \DateTime($fecha);
        $proximoChequeo = strtotime('+'.$tiempoChequeo.' day' ,strtotime($fechaEntrega->format('Y-m-d')));
        $proximoChequeo = date('Y-m-d' , $proximoChequeo);
        $proximoCheq = new \DateTime($proximoChequeo);
        $chequeo = new ChequeoMedico();
        $chequeo->setIdTrabajador($trabajador);
        $chequeo->setFecha($fechaEntrega);
        if ($estado == "true")
        {
            $chequeo->setEstado(true);
        }
        else
        {
            $chequeo->setEstado(false);
        }
        $chequeo->setObservaciones($observaciones);
        $chequeo->setProximoChequeo($proximoCheq);
        $em->persist($chequeo);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nuevo Chequeo Médico: '.$trabajador->getNombre()." ".$trabajador->getApellidos()." ".$trabajador->getSegundoApellido(),$em);
        return $this->redirect($this->generateUrl('chequeomedicoAjax'));
    }
    /**
     * @Route("/eliminar/chequeo/{id}", name="eliminarChequeo")
     */
    public function eliminarChequeo($id)
    {
        $em = $this->getDoctrine()->getManager();
        $chequeo = $em->getRepository(ChequeoMedico::class)->find($id);
        $em->remove($chequeo);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino Chequeo Médico',$em);
        return $this->redirect($this->generateUrl('chequeomedicoAjax'));
    }
    /**
     * @Route("/dt/chequeo/{idTD}", name="chequeoDT")
     */
    public function chequeoDT($idTD)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT ch  FROM App\Entity\ChequeoMedico ch 
                INNER JOIN App\Entity\Trabajador t WITH ch.idTrabajador = t.id
                INNER JOIN App\Entity\Area a WITH t.idArea = a.id               
                WHERE a.id = ".$idTD."
                ORDER BY t.nombre ASC";
        $consulta = $em->createQuery($sql);
        $chequeoDT = $consulta->getResult();
        $resultado = array();
        $total = count($chequeoDT);
        $fechaActual = new \DateTime('now');
        for ($i = 0; $i < $total; $i++)
        {
            $fechaChequeo = $chequeoDT[$i]->getFecha();
            if ($fechaActual->format('d.m.Y') != $fechaChequeo->format('d.m.Y'))
            {
                //print_r($fechaChequeo->format('d.m.Y')."<br/>");
                $diff = $fechaChequeo->diff($fechaActual);
                $diferencia = $diff->days;
                $tiempoChequeo = $chequeoDT[$i]->getIdTrabajador()->getIdCargo()->getTiempoChequeo();
                if ($tiempoChequeo < $diferencia)
                {
                    $resultado[] = $chequeoDT[$i];
                }
                //print_r($diferencia.'---'.$chequeoDT[$i]->getIdTrabajador()->getIdCargo()->getTiempoChequeo()."<br/>");
            }
        }
        $dt = $em->getRepository(Area::class)->find($idTD);
        return $this->render('chequeomedico/chequeoDTAjax.html.twig', array(
            'chequeoDT' => $resultado,
            /*'chequeoDT' => $chequeoDT,*/
            'UnidadOrganizativa' => $dt->getNombre(),
        ));
    }
    /**
     * @Route("/rango/fecha/{rangoFecha}", name="rangoFechaChequeo")
     */
    public function rangoFechaChequeo($rangoFecha)
    {
        $em = $this->getDoctrine()->getManager();
        $picarFecha = mb_split('-',$rangoFecha);
        $fecha1 = new \DateTime($picarFecha[0]);
        $fecha2 = new \DateTime($picarFecha[1]);
        $sql = "SELECT ch  FROM App\Entity\ChequeoMedico ch                
                WHERE '".$fecha1->format('Y-m-d')."' <= ch.fecha AND ch.fecha <= '".$fecha2->format('Y-m-d')."'
                ORDER BY ch.id DESC";
        $consulta = $em->createQuery($sql);
        $chequeoDT = $consulta->getResult();
        return $this->render('chequeomedico/chequeoRangoAjax.html.twig', array(
            'chequeoDT' => $chequeoDT,
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
}
