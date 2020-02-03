<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MediosAsignadosRepository")
 */
class MediosAsignados
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $fecha;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $causas;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $cantidad;

    /**
     * @ORM\ManyToOne(targetEntity="Trabajador", inversedBy="asignacionMedios")
     * @ORM\JoinColumn(name="id_trabajador", referencedColumnName="id")
     */
    private $idTrabajador;

    /**
     * @ORM\ManyToOne(targetEntity="MedioDeProteccion", inversedBy="asignacionMedios")
     * @ORM\JoinColumn(name="id_medios", referencedColumnName="id")
     */
    private $idMedios;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(?\DateTimeInterface $fecha): self
    {
        $this->fecha = $fecha;

        return $this;
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

    public function getIdMedios(): ?MedioDeProteccion
    {
        return $this->idMedios;
    }

    public function setIdMedios(?MedioDeProteccion $idMedios): self
    {
        $this->idMedios = $idMedios;

        return $this;
    }

    public function getCausas(): ?string
    {
        return $this->causas;
    }

    public function setCausas(?string $causas): self
    {
        $this->causas = $causas;

        return $this;
    }

    public function getCantidad(): ?int
    {
        return $this->cantidad;
    }

    public function setCantidad(?int $cantidad): self
    {
        $this->cantidad = $cantidad;

        return $this;
    }


}
