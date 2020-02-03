<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MedioDeProteccionRepository")
 */
class MedioDeProteccion
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
    private $codigo;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $descripcion;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $vidaUtil;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $um;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $cantidad;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $costo;

    /**
     * @ORM\OneToMany(targetEntity="MediosAsignados", mappedBy="idMedios", cascade={"persist", "remove"})
     *
     */
    private $asignacionMedios;

    /**
     * @ORM\ManyToOne(targetEntity="TipoTallas", inversedBy="mediosproteccion")
     * @ORM\JoinColumn(name="idTipoTalla", referencedColumnName="id")
     */
    private $idTipoTalla;

    public function __construct()
    {
        $this->asignacionMedios = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(?string $descripcion): self
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    public function getVidaUtil(): ?int
    {
        return $this->vidaUtil;
    }

    public function setVidaUtil(?int $vidaUtil): self
    {
        $this->vidaUtil = $vidaUtil;

        return $this;
    }

    public function getUm(): ?string
    {
        return $this->um;
    }

    public function setUm(?string $um): self
    {
        $this->um = $um;

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

    public function getCosto(): ?float
    {
        return $this->costo;
    }

    public function setCosto(?float $costo): self
    {
        $this->costo = $costo;

        return $this;
    }

    /**
     * @return Collection|MediosAsignados[]
     */
    public function getAsignacionMedios(): Collection
    {
        return $this->asignacionMedios;
    }

    public function addAsignacionMedio(MediosAsignados $asignacionMedio): self
    {
        if (!$this->asignacionMedios->contains($asignacionMedio)) {
            $this->asignacionMedios[] = $asignacionMedio;
            $asignacionMedio->setIdMedios($this);
        }

        return $this;
    }

    public function removeAsignacionMedio(MediosAsignados $asignacionMedio): self
    {
        if ($this->asignacionMedios->contains($asignacionMedio)) {
            $this->asignacionMedios->removeElement($asignacionMedio);
            // set the owning side to null (unless already changed)
            if ($asignacionMedio->getIdMedios() === $this) {
                $asignacionMedio->setIdMedios(null);
            }
        }

        return $this;
    }

    public function getCodigo(): ?string
    {
        return $this->codigo;
    }

    public function setCodigo(?string $codigo): self
    {
        $this->codigo = $codigo;

        return $this;
    }

    public function getIdTipoTalla(): ?TipoTallas
    {
        return $this->idTipoTalla;
    }

    public function setIdTipoTalla(?TipoTallas $idTipoTalla): self
    {
        $this->idTipoTalla = $idTipoTalla;

        return $this;
    }


}
