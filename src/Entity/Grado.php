<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\GradoRepository")
 */
class Grado
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
     * @ORM\OneToMany(targetEntity="App\Entity\Probabilidad", mappedBy="idgrado")
     */
    private $probabilidads;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Severidad", mappedBy="idgrado")
     */
    private $severidads;

    public function __construct()
    {
        $this->probabilidads = new ArrayCollection();
        $this->severidads = new ArrayCollection();
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
     * @return Collection|Probabilidad[]
     */
    public function getProbabilidads(): Collection
    {
        return $this->probabilidads;
    }

    public function addProbabilidad(Probabilidad $probabilidad): self
    {
        if (!$this->probabilidads->contains($probabilidad)) {
            $this->probabilidads[] = $probabilidad;
            $probabilidad->setIdgrado($this);
        }

        return $this;
    }

    public function removeProbabilidad(Probabilidad $probabilidad): self
    {
        if ($this->probabilidads->contains($probabilidad)) {
            $this->probabilidads->removeElement($probabilidad);
            // set the owning side to null (unless already changed)
            if ($probabilidad->getIdgrado() === $this) {
                $probabilidad->setIdgrado(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Severidad[]
     */
    public function getSeveridads(): Collection
    {
        return $this->severidads;
    }

    public function addSeveridad(Severidad $severidad): self
    {
        if (!$this->severidads->contains($severidad)) {
            $this->severidads[] = $severidad;
            $severidad->setIdgrado($this);
        }

        return $this;
    }

    public function removeSeveridad(Severidad $severidad): self
    {
        if ($this->severidads->contains($severidad)) {
            $this->severidads->removeElement($severidad);
            // set the owning side to null (unless already changed)
            if ($severidad->getIdgrado() === $this) {
                $severidad->setIdgrado(null);
            }
        }

        return $this;
    }
}
