<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\VacunaTrabajadorRepository")
 */
class VacunaTrabajador
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $fecha;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $observaciones;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $estado;

    /**
     * @ORM\ManyToOne(targetEntity="Vacuna", inversedBy="vacunatrabajador")
     * @ORM\JoinColumn(name="id_vacuna", referencedColumnName="id")
     */
    private $idVacuna;

    /**
     * @ORM\ManyToOne(targetEntity="Trabajador", inversedBy="vacunatrabajador")
     * @ORM\JoinColumn(name="id_trabajador", referencedColumnName="id")
     */
    private $idTrabajador;

    /**
     * @ORM\ManyToOne(targetEntity="Cargo", inversedBy="vacunacargo")
     * @ORM\JoinColumn(name="id_cargo", referencedColumnName="id")
     */
    private $idCargo;

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

    public function getEstado(): ?string
    {
        return $this->estado;
    }

    public function setEstado(?string $estado): self
    {
        $this->estado = $estado;

        return $this;
    }

    public function getIdVacuna(): ?Vacuna
    {
        return $this->idVacuna;
    }

    public function setIdVacuna(?Vacuna $idVacuna): self
    {
        $this->idVacuna = $idVacuna;

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

    public function getIdCargo(): ?Cargo
    {
        return $this->idCargo;
    }

    public function setIdCargo(?Cargo $idCargo): self
    {
        $this->idCargo = $idCargo;

        return $this;
    }

}
