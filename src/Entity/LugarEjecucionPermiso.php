<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\LugarEjecucionPermisoRepository")
 */
class LugarEjecucionPermiso
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
    private $lugar;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $direccion;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $coordenadaX;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $coordenadaY;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PermisoSeguridad", mappedBy="idLugar")
     */
    private $permisoSeguridads;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Area", inversedBy="lugarEjecucionPermisos")
     */
    private $idArea;

    public function __construct()
    {
        $this->permisoSeguridads = new ArrayCollection();
    }

    /**
     * @return Collection|PermisoSeguridad[]
     */
    public function getPermisoSeguridads(): Collection
    {
        return $this->permisoSeguridads;
    }

    public function addPermisoSeguridad(PermisoSeguridad $permisoSeguridad): self
    {
        if (!$this->permisoSeguridads->contains($permisoSeguridad)) {
            $this->permisoSeguridads[] = $permisoSeguridad;
            $permisoSeguridad->setIdLugar($this);
        }

        return $this;
    }

    public function removePermisoSeguridad(PermisoSeguridad $permisoSeguridad): self
    {
        if ($this->permisoSeguridads->contains($permisoSeguridad)) {
            $this->permisoSeguridads->removeElement($permisoSeguridad);
            // set the owning side to null (unless already changed)
            if ($permisoSeguridad->getIdLugar() === $this) {
                $permisoSeguridad->setIdLugar(null);
            }
        }

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLugar(): ?string
    {
        return $this->lugar;
    }

    public function setLugar(?string $lugar): self
    {
        $this->lugar = $lugar;

        return $this;
    }

    public function getDireccion(): ?string
    {
        return $this->direccion;
    }

    public function setDireccion(?string $direccion): self
    {
        $this->direccion = $direccion;

        return $this;
    }

    public function getCoordenadaX(): ?float
    {
        return $this->coordenadaX;
    }

    public function setCoordenadaX(?float $coordenadaX): self
    {
        $this->coordenadaX = $coordenadaX;

        return $this;
    }

    public function getCoordenadaY(): ?float
    {
        return $this->coordenadaY;
    }

    public function setCoordenadaY(?float $coordenadaY): self
    {
        $this->coordenadaY = $coordenadaY;

        return $this;
    }

    public function getIdArea(): ?Area
    {
        return $this->idArea;
    }

    public function setIdArea(?Area $idArea): self
    {
        $this->idArea = $idArea;

        return $this;
    }


}
