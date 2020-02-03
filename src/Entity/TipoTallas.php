<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TipoTallasRepository")
 */
class TipoTallas
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
     * @ORM\OneToMany(targetEntity="Tallas", mappedBy="idTipoTalla", cascade={"persist", "remove"})
     */
    private $tallas;
    /**
     * @ORM\OneToMany(targetEntity="MedioDeProteccion", mappedBy="idTipoTalla", cascade={"persist", "remove"})
     */
    private $mediosproteccion;

    public function __construct()
    {
        $this->tallas = new ArrayCollection();
        $this->mediosproteccion = new ArrayCollection();
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
     * @return Collection|Tallas[]
     */
    public function getTallas(): Collection
    {
        return $this->tallas;
    }

    public function addTalla(Tallas $talla): self
    {
        if (!$this->tallas->contains($talla)) {
            $this->tallas[] = $talla;
            $talla->setIdTipoTalla($this);
        }

        return $this;
    }

    public function removeTalla(Tallas $talla): self
    {
        if ($this->tallas->contains($talla)) {
            $this->tallas->removeElement($talla);
            // set the owning side to null (unless already changed)
            if ($talla->getIdTipoTalla() === $this) {
                $talla->setIdTipoTalla(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|MedioDeProteccion[]
     */
    public function getMediosproteccion(): Collection
    {
        return $this->mediosproteccion;
    }

    public function addMediosproteccion(MedioDeProteccion $mediosproteccion): self
    {
        if (!$this->mediosproteccion->contains($mediosproteccion)) {
            $this->mediosproteccion[] = $mediosproteccion;
            $mediosproteccion->setIdTipoTalla($this);
        }

        return $this;
    }

    public function removeMediosproteccion(MedioDeProteccion $mediosproteccion): self
    {
        if ($this->mediosproteccion->contains($mediosproteccion)) {
            $this->mediosproteccion->removeElement($mediosproteccion);
            // set the owning side to null (unless already changed)
            if ($mediosproteccion->getIdTipoTalla() === $this) {
                $mediosproteccion->setIdTipoTalla(null);
            }
        }

        return $this;
    }


}
