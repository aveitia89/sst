<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PermisosSeguridadTrabajadoresEjecutanRepository")
 */
class PermisosSeguridadTrabajadoresEjecutan
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Trabajador", inversedBy="seguridadTrabajador")
     * @ORM\JoinColumn(name="id_trabajador", referencedColumnName="id")
     */
    private $idTrabajador;

    /**
     * @ORM\ManyToOne(targetEntity="PermisoSeguridad", inversedBy="seguridadPermisos")
     * @ORM\JoinColumn(name="id_permiso_seguridad", referencedColumnName="id")
     */
    private $idPermisosSeguridad;

    /**
     * @ORM\ManyToOne(targetEntity="TrabajadorEscala", inversedBy="escala")
     * @ORM\JoinColumn(name="id_escala", referencedColumnName="id")
     */
    private $idEscala;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIdTrabajador(): ?Trabajador
    {
        return $this->idTrabajador;
    }

    public function setIdTrabajador(?Trabajador $idTrabajador): self
    {
        $this->idTrabajador = $idTrabajador;

        return $this;
    }

    public function getIdPermisosSeguridad(): ?PermisoSeguridad
    {
        return $this->idPermisosSeguridad;
    }

    public function setIdPermisosSeguridad(?PermisoSeguridad $idPermisosSeguridad): self
    {
        $this->idPermisosSeguridad = $idPermisosSeguridad;

        return $this;
    }

    public function getIdEscala(): ?TrabajadorEscala
    {
        return $this->idEscala;
    }

    public function setIdEscala(?TrabajadorEscala $idEscala): self
    {
        $this->idEscala = $idEscala;

        return $this;
    }

}
