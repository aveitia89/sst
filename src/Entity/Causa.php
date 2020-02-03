<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CausaRepository")
 */
class Causa
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
     * @ORM\OneToMany(targetEntity="EspecificacionesDeCausas", mappedBy="idCausa", cascade={"persist", "remove"})
     */
    private $especificaciones;

    public function __construct()
    {
        $this->especificaciones = new ArrayCollection();
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
     * @return Collection|EspecificacionesDeCausas[]
     */
    public function getEspecificaciones(): Collection
    {
        return $this->especificaciones;
    }

    public function addEspecificacione(EspecificacionesDeCausas $especificacione): self
    {
        if (!$this->especificaciones->contains($especificacione)) {
            $this->especificaciones[] = $especificacione;
            $especificacione->setIdCausa($this);
        }

        return $this;
    }

    public function removeEspecificacione(EspecificacionesDeCausas $especificacione): self
    {
        if ($this->especificaciones->contains($especificacione)) {
            $this->especificaciones->removeElement($especificacione);
            // set the owning side to null (unless already changed)
            if ($especificacione->getIdCausa() === $this) {
                $especificacione->setIdCausa(null);
            }
        }

        return $this;
    }

}
