<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TrabajadorEscalaRepository")
 */
class TrabajadorEscala
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
    private $escalaMando;

    /**
     * @ORM\OneToMany(targetEntity="PermisosSeguridadTrabajadoresEjecutan", mappedBy="idEscala", cascade={"persist", "remove"})
     *
     */
    private $escala;

    public function __construct()
    {
        $this->escala = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEscalaMando(): ?string
    {
        return $this->escalaMando;
    }

    public function setEscalaMando(?string $escalaMando): self
    {
        $this->escalaMando = $escalaMando;

        return $this;
    }

    /**
     * @return Collection|PermisosSeguridadTrabajadoresEjecutan[]
     */
    public function getEscala(): Collection
    {
        return $this->escala;
    }

    public function addEscala(PermisosSeguridadTrabajadoresEjecutan $escala): self
    {
        if (!$this->escala->contains($escala)) {
            $this->escala[] = $escala;
            $escala->setIdEscala($this);
        }

        return $this;
    }

    public function removeEscala(PermisosSeguridadTrabajadoresEjecutan $escala): self
    {
        if ($this->escala->contains($escala)) {
            $this->escala->removeElement($escala);
            // set the owning side to null (unless already changed)
            if ($escala->getIdEscala() === $this) {
                $escala->setIdEscala(null);
            }
        }

        return $this;
    }
}
