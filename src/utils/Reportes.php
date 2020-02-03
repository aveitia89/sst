<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\utils;

use App\Entity\AccidenteLaboral;
use App\Entity\ChequeoMedico;
use App\Entity\MediosAsignados;
use App\Entity\Vacuna;
use App\Entity\SupervisionNivel2;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Description of Reportes
 *
 * @author Adrian
 */
class Reportes extends AbstractController {

    //put your code here

    public static function buscar($em, $data) {
       $arrayResult = new \ArrayObject();
//       print_r($data);
//       die;
        $trabajadores = $em->getRepository(Trabajador::class)->findAll();
        for ($i = 0; $i < count($trabajadores); $i++) {
            $historial = self::getHistorialDeUnTrabajador($em, $trabajadores[$i]->getCodigo());
            for($j=0;$j<count($historial);$j++){
                $current=$historial[$j];
                $pos=strpos($current->toString(),$data);
                if($pos!=FALSE ){
                    $arrayResult->append($current);
                }
            }
        }
        return $arrayResult;
    }

    public static function getchequeos($em) {
        $chequeos = $em->getRepository(ChequeoMedico::class)->findBy(['estado' => "Asistio"]);
        $chequeosNo = $em->getRepository(ChequeoMedico::class)->findBy(['estado' => "No Asistio"]);
        $totalInasistencia = count($chequeosNo);
        $totalAsistencia = count($chequeos);
        $total = $totalInasistencia + $totalAsistencia;
        $porcientoasistencia = 0;
        if ($total != 0) {
            $porcientoasistencia = $totalAsistencia * 100 / $total;
        }
        $hoy = new \DateTime();
        $counter = 0;

        for ($i = 0; $i < count($chequeos); $i++) {
            $fecha = $chequeos[$i]->getFecha();
            $diferencia = $hoy->diff($fecha);

            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
        //print_r("la asistencia=".$porcientoasistencia);
        //die;
        $arr = [$counter, $totalAsistencia, $porcientoasistencia, $total, $totalInasistencia];
        return $arr;
    }

    public static function getChequeosDeUnTrabajador($em, $id) {
        $chequeos = $em->getRepository(ChequeoMedico::class)->findBy(['estado' => "Asistio", "idTrabajador" => $id]);
        $chequeosNo = $em->getRepository(ChequeoMedico::class)->findBy(['estado' => "No Asistio", "idTrabajador" => $id]);
        $totalInasistencia = count($chequeosNo);
        $totalAsistencia = count($chequeos);
        $total = $totalInasistencia + $totalAsistencia;
        $porcientoasistencia = 0;
        if ($total != 0) {
            $porcientoasistencia = $totalAsistencia * 100 / $total;
        }
        $hoy = new \DateTime();
        $counter = 0;

        for ($i = 0; $i < count($chequeos); $i++) {
            $fecha = $chequeos[$i]->getFecha();
            $diferencia = $hoy->diff($fecha);

            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
        $arr = [$counter, $totalAsistencia, $porcientoasistencia, $total, $totalInasistencia];
        return $arr;
    }

    public static function getEvaluaciones($em) {
        $evaluacion = $em->getRepository(SupervisionNivel2::class)->findBy(['evaluacionFinal' => "Bien"]);
        $evaluacionNeg = $em->getRepository(SupervisionNivel2::class)->findBy(['evaluacionFinal' => "Mal"]);
        $total = count($em->getRepository(SupervisionNivel2::class)->findAll());

        $totalPositvo = count($evaluacion);
        $totalNegativo = count($evaluacionNeg);
        $porciento_positivo = 0;
        $porciento_negativo = 0;
        if ($total != 0) {
            $porciento_positivo = $totalPositvo * 100 / $total;
            $porciento_negativo = $totalNegativo * 100 / $total;
        }
        $arr = [$totalPositvo, $totalNegativo, $total, $porciento_positivo, $porciento_negativo];
        return $arr;
    }

    public static function getVacunas($em) {
        $vacunas_hechas = $em->getRepository(Vacuna::class)->findBy(['estado' => "Vacunado"]);
        $vacunas_asignadas = $em->getRepository(Vacuna::class)->findBy(['estado' => NULL]);
        $total_hecho = count($vacunas_hechas);
        $total_asignado = count($vacunas_asignadas);
        $total = $total_asignado + $total_hecho;
        $porciento_hecho = 0;
        if ($total != 0) {
            $porciento_hecho = $total_hecho * 100 / $total;
        }
        $hoy = new \DateTime();
        $counter = 0;

        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $vacunas_hechas[$i]->getFecha();
            $diferencia = $hoy->diff($fecha);
            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
        $arr = [$total_hecho, $total_asignado, $total, $porciento_hecho, $counter];
        return $arr;
    }

    public static function getVacunasDeUnTrabajador($em, $id) {
        $vacunas_hechas = $em->getRepository(Vacuna::class)->findBy(['estado' => "Vacunado", "idTrabajador" => $id]);
        $vacunas_asignadas = $em->getRepository(Vacuna::class)->findBy(['estado' => NULL, "idTrabajador" => $id]);
        $total_hecho = count($vacunas_hechas);
        $total_asignado = count($vacunas_asignadas);
        $total = $total_asignado + $total_hecho;
        $porciento_hecho = 0;
        if ($total != 0) {
            $porciento_hecho = $total_hecho * 100 / $total;
        }

        $hoy = new \DateTime();
        $counter = 0;

        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $vacunas_hechas[$i]->getFecha();
            $diferencia = $hoy->diff($fecha);
            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
        $arr = [$total_hecho, $total_asignado, $total, $porciento_hecho, $counter];
        return $arr;
    }

    public static function getMediosAsignados($em) {
        $medios_asignados = $em->getRepository(MediosAsignados::class)->findAll();
        $total_hecho = count($medios_asignados);

        $hoy = new \DateTime();
        $counter = 0;
        $monto = 0;
        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = new \DateTime($medios_asignados[$i]->getFecha());

            $idMedio = $medios_asignados[$i]->getIdMedio();
            $entity = $em->getRepository(MedioDeProteccion::class)->findOneBy(['descripcion' => $idMedio]);
            $monto += $entity->getCosto();
//            print_r($entity->getCosto()."  , ");
            $diferencia = $hoy->diff($fecha);
            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
//            die;
        $arr = [$total_hecho, $counter, $monto];
        return $arr;
    }

    public static function getMediosAsignadosDeUnTrabajador($em, $id) {
        $medios_asignados = $em->getRepository(MediosAsignados::class)->findBy(["idTrabajador" => $id]);
        $total_hecho = count($medios_asignados);

        $hoy = new \DateTime();
        $counter = 0;

        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = new \DateTime($medios_asignados[$i]->getFecha());
            $diferencia = $hoy->diff($fecha);
            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
        $arr = [$total_hecho, $counter];
        return $arr;
    }

    public static function getAccidentes($em) {
        //$accidentes = $em->getRepository(AccidenteLaboral::class)->findBy(["fechaterminacion"=>"ASC"]);
        $accidentes = $em->getRepository(AccidenteLaboral::class)->findAll();
        $total_hecho = count($accidentes);
        //print_r($total_hecho);die;
        $hoy = new \DateTime();
        $counter = 0;
        //$arr_medias = [];
        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $accidentes[$i]->getFechaterminacion();
            $diferencia = $hoy->diff($fecha);
            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
        $facha = $accidentes[0]->getFechaterminacion();
        $resta = $facha->diff($accidentes[$total_hecho - 1]->getFechaterminacion())->days;
        $media = $resta;
        
        $arr = [$total_hecho, $counter, $media];
        return $arr;
    }

    public static function getAccidentesDeUnTrabajador($em, $id) {
        $accidentes = $em->getRepository(AccidenteLaboral::class)->findBy(["idTrabajador" => $id]);
        $total_hecho = count($accidentes);
        $hoy = new \DateTime();
        $counter = 0;

        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $accidentes[$i]->getFechaterminacion();
            $diferencia = $hoy->diff($fecha);
            if ($diferencia->days <= 30) {
                $counter++;
            }
        }
        $arr = [$total_hecho, $counter];
        return $arr;
    }

    public static function getHistorialDeUnTrabajador($em, $id) {

        $accidentes = $em->getRepository(AccidenteLaboral::class)->findBy(["idTrabajador" => $id]);
        $total_hecho = count($accidentes);
        $historial = new \ArrayObject();
        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $accidentes[$i]->getFechaterminacion();
            $naturalezaLesion = $accidentes[$i]->getNaturaleza_lesion();
            $causa = $accidentes[$i]->getCausa();
            $temp = new HistorialTrabajador("El trabajador se accidentó. Causa: $causa, naturaleza : $naturalezaLesion", $fecha, "accidentelaboral_show/" + $accidentes[$i]->getId());
            $historial->append($temp);
        }
        $medios = $em->getRepository(MediosAsignados::class)->findBy(["idTrabajador" => $id]);
        $total_hecho = count($medios);
        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = new \DateTime($medios[$i]->getFecha());
            $idMedio = $medios[$i]->getIdMedio();
            $temp = new HistorialTrabajador("Recibioó el medio de protección : $idMedio", $fecha, "mediodeproteccion_index");
            $historial->append($temp);
        }


        $chequeos = $em->getRepository(ChequeoMedico::class)->findBy(["idTrabajador" => $id]);
        $total_hecho = count($chequeos);
        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $chequeos[$i]->getFecha();
            $estado = $chequeos[$i]->getEstado();
            $detalles = $chequeos[$i]->getObservaciones();
            if ($estado == "Asistio") {
                $temp = new HistorialTrabajador("Asitió a su chequeo médico. Observaciones: $detalles ", $fecha, "chequeomedico_index");
            } else {
                $temp = new HistorialTrabajador("Se ausentó a su chequeo médico ", $fecha, "chequeomedico_index");
            }
        }

        $evaluaciones = $em->getRepository(SupervisionNivel2::class)->findBy(['idJefeBrigada' => $id]);
        $total_hecho = count($evaluaciones);
        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $evaluaciones[$i]->getFecha();
            $resultado = $evaluaciones[$i]->getEvaluacionFinal();
            $temp = new HistorialTrabajador("Como jefe de brigada en la inspección hecha fue evaluado de: $resultado", $fecha, "SupervisionNivel2_show/" . $evaluaciones[$i]->getId());
            $historial->append($temp);
        }

        $vacunas = $em->getRepository(Vacuna::class)->findBy(['idTrabajador' => $id]);
        $total_hecho = count($vacunas);
        for ($i = 0; $i < $total_hecho; $i++) {
            $fecha = $vacunas[$i]->getFecha();
            $estado = $vacunas[$i]->getEstado();
            $nombre = $vacunas[$i]->getNombreVacuna();
            if ($estado == "Vacunado") {
                $temp = new HistorialTrabajador("Se vacunó. Vacuna: $nombre", $fecha, "vacuna_index");
            } else {
                $temp = new HistorialTrabajador("Se le asignó la vacuna: $nombre", $fecha, "vacuna_index2");
            }
            $historial->append($temp);
        }
//$historial->asort();
        return $historial;
    }

}
