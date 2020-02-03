<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\utils;

/**
 * Description of HistorialTrabajador
 *
 * @author Adrian
 */
class HistorialTrabajador {

    private $detalles;
    private $fecha;
    private $url;

    public function __construct($detalles, $fecha, $url) {
        $this->detalles = $detalles;
        $this->fecha = $fecha;
        $this->url = $url;
    }

    public function getUrl() {
        return $this->url;
    }

    public function setUrl($url) {
        $this->url = $url;
    }

    public function getDetalles() {
        return $this->detalles;
    }

    public function getFecha() {
        return $this->fecha;
    }

    public function setDetalles($detalles) {
        $this->detalles = $detalles;
    }

    public function setFecha($fecha) {
        $this->fecha = $fecha;
    }

    public function toString() {
        return $this->detalles + " " ;
//                $this->fecha;
//                $this->url = $url;
    }

}
