<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\NaturalezaLesionRepository")
 */
class NaturalezaLesion
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
    private $nombre;

    /**
     * @ORM\ManyToMany(targetEntity="AccidenteLaboral", inversedBy="naturaleza")
     * @ORM\JoinTable(name="accidentelaboral_naturalezalesion")
     */
    private $naturaleza;

    public function __construct()
    {
        $this->naturaleza = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(?string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * @return Collection|AccidenteLaboral[]
     */
    public function getNaturaleza(): Collection
    {
        return $this->naturaleza;
    }

    public function addNaturaleza(AccidenteLaboral $naturaleza): self
    {
        if (!$this->naturaleza->contains($naturaleza)) {
            $this->naturaleza[] = $naturaleza;
        }

        return $this;
    }

    public function removeNaturaleza(AccidenteLaboral $naturaleza): self
    {
        if ($this->naturaleza->contains($naturaleza)) {
            $this->naturaleza->removeElement($naturaleza);
        }

        return $this;
    }
}
