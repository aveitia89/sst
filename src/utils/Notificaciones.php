<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\utils;

use App\Entity\Cargo;
use App\Entity\ChequeoMedico;
use App\Entity\Trabajador;
use App\Entity\Vacuna;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Description of Notificaciones
 *
 * @author Adrian
 */
class Notificaciones extends AbstractController {

    //put your code here
    public static function chequerVacunasVencidas($em) {

//        $em = $this->getDoctrine()->getManager();
        $vacunas = $em->getRepository(Vacuna::class)->findBy(['estado' => NULL]);
        $hoy = new \DateTime();
        $lista = new \ArrayObject();
        for ($i = 0; $i < count($vacunas); $i++) {
            $fecha = $vacunas[$i]->getFecha();
            if ($hoy > $fecha) {//es porque la fecha de ir a vacunarse se vencio
                $diferencia = $hoy->diff($fecha);
                if ($diferencia->days == 0) {
//                    echo "la resta es cero";
                } else {
                    $current = $vacunas[$i];
                    $trabaj = $em->getRepository(Trabajador::class)->findOneBy(["codigo" => $current->getIdTrabajador()]);
//                    $current->setTrabajador($trabaj);
                    $lista->append([$current,$trabaj]);
//                    echo "es mayor " . $i . " la resta= ".$diferencia->days;
                }
            }
        }
        if (!session_id()) {
            session_start();
            $_SESSION['total_vacunas'] = count($lista);
            $_SESSION['vacunas_canceladas'] = $lista;
        } else {
//            if (!isset($_SESSION['total_vacunas'])) {
            $_SESSION['total_vacunas'] = count($lista);
//            }
//            if (!isset($_SESSION['vacunas_canceladas'])) {
            $_SESSION['vacunas_canceladas'] = $lista;
//            }
        }
        return $lista;
    }

    public static function total($em) {
        if (!session_id()) {
            session_start();
            $_SESSION['total'] = count(self::chequerVacunasVencidas($em)) + count(self::revisarChequeosMEdicosVencidos($em));
        } else {
//            if (!isset($_SESSION['total'])) {
            $_SESSION['total'] = count(self::chequerVacunasVencidas($em)) + count(self::revisarChequeosMEdicosVencidos($em));
//            }
        }
        return $_SESSION['total'];
    }
    public static function getSupervicionesNivel1Realizadas($em) {
                $response = new JsonResponse();
//        echo "entrooooooooooooooooo";
//        die;
        return $response->setData(array(
                    "success" => 1,
                    "result" => [
                        array("id" => "293",
                            "title" => "Organización y limpieza.",
                            "url" => "#",
                            "class" => "event-warning",
                            "start" => "1362938400000",
                            "end" => "1363197686300"),
                    ],
        ));
    }

    public static function revisarChequeosMEdicosVencidos($em) {
//        $file = fopen("check.adr", "r");
//        $lastDate = fgets($file);
//        fclose($file);
//        $fecha = new \DateTime($lastDate);
//        $hoy = new \DateTime();
//        $diferencia = $hoy->diff($fecha);
//        echo "hoy=".$hoy->format("d-m-Y")."  **** ";
//         echo "fecha=".$fecha->format("d-m-Y")."   ";
//        echo " la diferencia=".$diferencia->days." --";
//        die;
//        if ($diferencia->days > 0) {//todavia no se ha hecho el analisis de este dia
//        $file = fopen("check.adr", "w");
//        fwrite($file, date("d-m-Y"));
//        fclose($file);
//        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findAll();
        $lista = new \ArrayObject();
        for ($J = 0; $J < count($trabajadores); $J++) {
            $currentTRabajador = $trabajadores[$J];
            $tiempo_restante = $currentTRabajador->getTiempo_restante_chequeo();
            $tiempo_restante = $tiempo_restante - 1;
            $currentTRabajador->setTiempo_restante_chequeo($tiempo_restante);
            if ($tiempo_restante == -1) {
                $che = new ChequeoMedico();
                $che->setEstado("No Asistio");
                $fecha = date("d-m-Y");
                $che->setFecha(new \DateTime());
                $che->setIdTrabajador($currentTRabajador->getCodigo());
                $che->setObservaciones("La fecha de chequeo se vencio");
                $current_cargo_de_trabajador = $em->getRepository(Cargo::class)->findOneBy(["nombre" => $currentTRabajador->getPosicion()]);
                $currentTRabajador->setTiempo_restante_chequeo($current_cargo_de_trabajador->getTiempo_original_chequeo() - 1);
                $em->persist($che);
                $last = new \ArrayObject($em->getRepository('AppBundle:ChequeoMedico')->findAll());
                $currentTRabajador->setLast_chequeo($last[$last->count() - 1]);
                $lista->append($currentTRabajador); //lo agrego a la lista de los trabajadores que no asistieron
            }
        }
        $em->flush();
        if (!session_id()) {
            session_start();
            $_SESSION['total_chequeos'] = count($lista);
            $_SESSION['chequeos_cancelados'] = $lista;
        } else {
//            if (!isset($_SESSION['total_chequeos'])) {
            $_SESSION['total_chequeos'] = count($lista);
//            }
//            if (!isset($_SESSION['chequeos_cancelados'])) {
            $_SESSION['chequeos_cancelados'] = $lista;
//            }
        }
        return $lista;
    }

}
