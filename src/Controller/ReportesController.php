<?php

namespace App\Controller;

use App\Entity\Area;
use App\Entity\Supervision;
use App\Entity\Trabajador;
use App\Entity\UnidadOrganizativa;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ReportesController extends AbstractController
{
    /**
     * @Route("/usuario/supervision", name="reportesSupervision")
     */
    public function reportesSupervision()
    {
        $em = $this->getDoctrine()->getManager();
        $areaUsuario = $em->getRepository(Area::class)->find($this->getIdAreaUsuario());
        if($areaUsuario->getNombre() == "DTSR")
        {
            $area = $em->getRepository(Area::class)->findAll();
        }
        else
        {
            $area[] = array('id' => $areaUsuario->getId(),'nombre' =>$areaUsuario->getNombre());
           // print_r($area[0]);die;
        }

        return $this->render('reportes/supervisiones/reporteSupervision.html.twig', [
            'area' => $area,
        ]);
    }
    /**
     * @Route("/usuario/listado/riesgo/dt", name="listadoDT")
     */
    public function listadoDT()
    {
        $em = $this->getDoctrine()->getManager();
        $areaUsuario = $em->getRepository(Area::class)->find($this->getIdAreaUsuario());
        if($areaUsuario->getNombre() == "DTSR")
        {
            $area = $em->getRepository(Area::class)->findAll();
            $listado = $em->getRepository(Supervision::class)->findBy([],['id' => 'DESC']);
        }
        else
        {
            $listado = $em->getRepository(Supervision::class)->findBy(['idarea' => $this->getIdAreaUsuario()],['id' => 'DESC']);
            $area[] = array('id' => $areaUsuario->getId(),'nombre' =>$areaUsuario->getNombre());
            // print_r($area[0]);die;
        }

        return $this->render('reportes/supervisiones/reporteSupervisionRiesgo.html.twig', array(
            'listado' => $listado,
            'area' => $area,
        ));
    }
    /**
     * @Route("/usuario/mas/peligrosidad/dt", name="peligrosidadDT")
     */
    public function peligrosidadDT()
    {
        $em = $this->getDoctrine()->getManager();
        $areaUsuario = $em->getRepository(Area::class)->find($this->getIdAreaUsuario());
        if($areaUsuario->getNombre() == "DTSR")
        {
            $listado = $em->getRepository(Supervision::class)->findBy([],['id' => 'DESC']);
            $resultado = array();

            for ($i = 0; $i < count($listado);$i++)
            {
                $riesgo = $listado[$i]->getRiesgos();
                $cantidadRPelig = 0;
                for ($j = 0; $j < count($riesgo);$j++)
                {
                    $grado = $this->GradoPeligrosidad($riesgo[$j]);
                    if($this->MuestraGrado($grado) == "Muy alto"){
                        $cantidadRPelig++;
                    }
                }
                if ($cantidadRPelig > 0)
                {
                    $resultado[] = array('DT' => $listado[$i]->getIdArea()->getNombre(), 'cantRiesgoPelig' => $cantidadRPelig);
                }
            }
            $area = $em->getRepository(Area::class)->findAll();
        }
        else
        {
            $listado = $em->getRepository(Supervision::class)->findBy(['idarea' => $this->getIdAreaUsuario()],['id' => 'DESC']);
            $resultado = array();

            for ($i = 0; $i < count($listado);$i++)
            {
                $riesgo = $listado[$i]->getRiesgos();
                $cantidadRPelig = 0;
                for ($j = 0; $j < count($riesgo);$j++)
                {
                    $grado = $this->GradoPeligrosidad($riesgo[$j]);
                    if($this->MuestraGrado($grado) == "Muy alto"){
                        $cantidadRPelig++;
                    }
                }
                if ($cantidadRPelig > 0)
                {
                    $resultado[] = array('DT' => $listado[$i]->getIdArea()->getNombre(), 'cantRiesgoPelig' => $cantidadRPelig);
                }
            }
            $area[] = array('id' => $areaUsuario->getId(),'nombre' =>$areaUsuario->getNombre());
        }


        return $this->render('reportes/supervisiones/reporteSupervisionPeligrosidad.html.twig', array(
            'listado' => $resultado,
            'area' => $area,
        ));
    }
    public function GradoPeligrosidad($riesgo)
    {
        $resultado = $riesgo->getIdprobabilidad()->getValor() * $riesgo->getIdseveridad()->getValor();
        return $resultado;
    }
    public function MuestraGrado($resultado)
    {
        switch ($resultado){
            case $resultado <= 5:
                return "Muy bajo";
            case 5 < $resultado && $resultado <= 10:
                return "Bajo";
            case 10 < $resultado && $resultado <= 15:
                return "Moderado";
            case 15 < $resultado && $resultado <= 20:
                return "Alto";
            case 20 < $resultado :
                return "Muy alto";
            default:
                return "";
        }
    }
    /**
     * @Route("/usuario/tipoExterna", name="tipoExterna")
     */
    public function tipoExterna()
    {
        $em = $this->getDoctrine()->getManager();
        $areaUsuario = $em->getRepository(Area::class)->find($this->getIdAreaUsuario());
        if($areaUsuario->getNombre() == "DTSR")
        {
            $area = $em->getRepository(Area::class)->findAll();
            $listado = $em->getRepository(Supervision::class)->findBy(['idnivel' => 4],['id' => 'DESC']);
        }
        else
        {
            $area[] = array('id' => $areaUsuario->getId(),'nombre' =>$areaUsuario->getNombre());
            $listado = $em->getRepository(Supervision::class)->findBy(['idnivel' => 4,'idarea' => $this->getIdAreaUsuario()],['id' => 'DESC']);
        }

        return $this->render('reportes/supervisiones/reporteSupervisionExterna.html.twig', array(
            'supervision' => $listado,
            'area' => $area,
        ));
    }
    /**
     * @Route("/usuario/rango/fecha", name="rangoFechaSupervision")
     */
    public function rangoFechaSupervision()
    {
        $idDT = $_POST['idTD'];
        $picarFecha = mb_split('-',$_POST['rangoFecha']);
        $fecha1 = new \DateTime($picarFecha[0]);
        $fecha2 = new \DateTime($picarFecha[1]);
        $em = $this->getDoctrine()->getManager();

        $areaUsuario = $em->getRepository(Area::class)->find($this->getIdAreaUsuario());
        if($areaUsuario->getNombre() == "DTSR")
        {
            $area = $em->getRepository(Area::class)->findAll();
            $sql = "SELECT super FROM App\Entity\Supervision super                
                WHERE '".$fecha1->format('Y-m-d')."' <= super.fecha  AND super.fecha <= '".$fecha2->format('Y-m-d')."'
                AND super.idarea = ".$idDT."
                ORDER BY super.id DESC";
            $consulta = $em->createQuery($sql);
            $listado = $consulta->getResult();
        }
        else
        {
            $area[] = array('id' => $areaUsuario->getId(),'nombre' =>$areaUsuario->getNombre());
            $sql = "SELECT super FROM App\Entity\Supervision super                
                WHERE '".$fecha1->format('Y-m-d')."' <= super.fecha  AND super.fecha <= '".$fecha2->format('Y-m-d')."'
                AND super.idarea = ".$this->getIdAreaUsuario()."
                ORDER BY super.id DESC";
            $consulta = $em->createQuery($sql);
            $listado = $consulta->getResult();
        }
        return $this->render('reportes/supervisiones/reporteSupervisionRango.html.twig', array(
            'supervision' => $listado,
            'area' => $area,
        ));
    }

    /**
     * @Route("/usuario/seguridad", name="reportesSeguridad")
     */
    public function reportesSeguridad()
    {
        $em = $this->getDoctrine()->getManager();

        $uo = $em->getRepository(UnidadOrganizativa::class)->findAll();
        $trabajadores  = $em->getRepository(Trabajador::class)->findAll();
        $area = $em->getRepository(Area::class)->findAll();
        return $this->render('reportes/seguridad/reporteSeguridad.html.twig', [
            'unidadOrganizativa' => $uo,
            'trabajadores' => $trabajadores,
            'area' => $area,
        ]);
    }

    /**
     * @Route("/usuario/salud", name="reportesSalud")
     */
    public function reportesSalud()
    {
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->findAll();
        $uo = $em->getRepository(UnidadOrganizativa::class)->findAll();
        return $this->render('reportes/salud/reporteSalud.html.twig', [
            'unidadOrganizativa' => $uo,
            'areas' => $area,
        ]);
    }

    /**
     * @Route("/usuario/unidadOrganizativa", name="reportesUO")
     */
    public function reportesUO()
    {
        return $this->render('reportes/unidadOrganizativa/reporteUO.html.twig', [
            'controller_name' => 'ReportesController',
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
