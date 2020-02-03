<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MedidasSeguridadRepository")
 */
class MedidasSeguridad
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
    private $descripcion;

    /**
     * @ORM\ManyToMany(targetEntity="PermisoSeguridad", mappedBy="seguridad")
     * @ORM\JoinTable(name="permisosseguridad_medidas")
     */
    private $seguridad;

    public function __construct()
    {
        $this->seguridad = new ArrayCollection();
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

    /**
     * @return Collection|PermisoSeguridad[]
     */
    public function getSeguridad(): Collection
    {
        return $this->seguridad;
    }

    public function addSeguridad(PermisoSeguridad $seguridad): self
    {
        if (!$this->seguridad->contains($seguridad)) {
            $this->seguridad[] = $seguridad;
            $seguridad->addSeguridad($this);
        }

        return $this;
    }

    public function removeSeguridad(PermisoSeguridad $seguridad): self
    {
        if ($this->seguridad->contains($seguridad)) {
            $this->seguridad->removeElement($seguridad);
            $seguridad->removeSeguridad($this);
        }

        return $this;
    }


}
