<?php
namespace App\utils;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ChequeoMedico_mepeado
 *
 * @author Adrian
 */
class ChequeoMedico_mepeado {
    //put your code here
    /**
     * @var integer
     */
    private $tiempo_chequeo;
    /**
     * @var string
     */
    private $fecha;
    
    /**
     * @var string
     */
    private $trabajador;
    /**
     * @var integer
     */
    private $id_trabajador;
    
     /**
     * Set tiempo_chequeo
     *
     * @param integer $tiempo_chequeo
     *
     * @return Cargo
     */
    public function setTiempoChequeo($tiempo_chequeo)
    {
        $this->tiempo_chequeo = $tiempo_chequeo;

        return $this;
    }
     /**
     * Set tiempo_chequeo
     *
     * @param string $fecha
     *
     * @return Cargo
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }
     /**
     * Set id_trabajador
     *
     * @param string $id_trabajador
     *
     * @return Cargo
     */
    public function setIDTrabajador($id_trabajador)
    {
        $this->id_trabajador = $id_trabajador;

        return $this;
    }
     /**
     * Set trabajador
     *
     * @param string $trabajador
     *
     * @return Cargo
     */
    public function setTrabajador($trabajador)
    {
        $this->trabajador = $trabajador;

        return $this;
    }
    
    public function getTiempo_chequeo() {
        return $this->tiempo_chequeo;
    }

    public function getFecha() {
        return $this->fecha;
    }

    public function getTrabajador() {
        return $this->trabajador;
    }
    public function getId_trabajador() {
        return $this->id_trabajador;
    }




}
