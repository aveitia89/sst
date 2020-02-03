<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PlanDeMedidasRepository")
 */
class PlanDeMedidas
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $peligros;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $clasificacion;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $fechaCumplimiento;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $estado;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Supervision", inversedBy="planDeMedidas")
     */
    private $idsupervision;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Riesgo", inversedBy="planDeMedidas")
     */
    private $idRiesgo;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $medida;

    public function getIdsupervision(): ?Supervision
    {
        return $this->idsupervision;
    }

    public function setIdsupervision(?Supervision $idsupervision): self
    {
        $this->idsupervision = $idsupervision;

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPeligros(): ?string
    {
        return $this->peligros;
    }

    public function setPeligros(?string $peligros): self
    {
        $this->peligros = $peligros;

        return $this;
    }

    public function getClasificacion(): ?string
    {
        return $this->clasificacion;
    }

    public function setClasificacion(?string $clasificacion): self
    {
        $this->clasificacion = $clasificacion;

        return $this;
    }

    public function getFechaCumplimiento(): ?\DateTimeInterface
    {
        return $this->fechaCumplimiento;
    }

    public function setFechaCumplimiento(?\DateTimeInterface $fechaCumplimiento): self
    {
        $this->fechaCumplimiento = $fechaCumplimiento;

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

    public function getIdRiesgo(): ?Riesgo
    {
        return $this->idRiesgo;
    }

    public function setIdRiesgo(?Riesgo $idRiesgo): self
    {
        $this->idRiesgo = $idRiesgo;

        return $this;
    }

    public function getMedida(): ?string
    {
        return $this->medida;
    }

    public function setMedida(string $medida): self
    {
        $this->medida = $medida;

        return $this;
    }


}
