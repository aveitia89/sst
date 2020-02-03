<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ChequeoMedicoRepository")
 */
class ChequeoMedico
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
    private $observaciones;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $estado;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $proximoChequeo;

    /**
     * @ORM\ManyToOne(targetEntity="Trabajador", inversedBy="chequeo")
     * @ORM\JoinColumn(name="id_trabajador", referencedColumnName="id")
     */
    private $idTrabajador;

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

    public function getObservaciones(): ?string
    {
        return $this->observaciones;
    }

    public function setObservaciones(?string $observaciones): self
    {
        $this->observaciones = $observaciones;

        return $this;
    }

    public function getEstado(): ?bool
    {
        return $this->estado;
    }

    public function setEstado(?bool $estado): self
    {
        $this->estado = $estado;

        return $this;
    }

    public function getProximoChequeo(): ?\DateTimeInterface
    {
        return $this->proximoChequeo;
    }

    public function setProximoChequeo(?\DateTimeInterface $proximoChequeo): self
    {
        $this->proximoChequeo = $proximoChequeo;

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

}
