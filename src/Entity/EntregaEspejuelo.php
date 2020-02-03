<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EntregaEspejueloRepository")
 */
class EntregaEspejuelo
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $fechaCompra;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $costo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $cheque;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $respaldadoPolitica;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $fechaRecibeEconomia;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $aprobacionConsejo;

    /**
     * @ORM\ManyToOne(targetEntity="Trabajador", inversedBy="espejuelos")
     * @ORM\JoinColumn(name="id_trabajador", referencedColumnName="id")
     */
    private $idTrabajador;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFechaCompra(): ?\DateTimeInterface
    {
        return $this->fechaCompra;
    }

    public function setFechaCompra(\DateTimeInterface $fechaCompra): self
    {
        $this->fechaCompra = $fechaCompra;

        return $this;
    }

    public function getCosto(): ?float
    {
        return $this->costo;
    }

    public function setCosto(?float $costo): self
    {
        $this->costo = $costo;

        return $this;
    }

    public function getCheque(): ?int
    {
        return $this->cheque;
    }

    public function setCheque(?int $cheque): self
    {
        $this->cheque = $cheque;

        return $this;
    }

    public function getRespaldadoPolitica(): ?string
    {
        return $this->respaldadoPolitica;
    }

    public function setRespaldadoPolitica(?string $respaldadoPolitica): self
    {
        $this->respaldadoPolitica = $respaldadoPolitica;

        return $this;
    }

    public function getFechaRecibeEconomia(): ?\DateTimeInterface
    {
        return $this->fechaRecibeEconomia;
    }

    public function setFechaRecibeEconomia(?\DateTimeInterface $fechaRecibeEconomia): self
    {
        $this->fechaRecibeEconomia = $fechaRecibeEconomia;

        return $this;
    }

    public function getAprobacionConsejo(): ?bool
    {
        return $this->aprobacionConsejo;
    }

    public function setAprobacionConsejo(?bool $aprobacionConsejo): self
    {
        $this->aprobacionConsejo = $aprobacionConsejo;

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
