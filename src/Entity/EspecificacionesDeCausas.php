<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EspecificacionesDeCausasRepository")
 */
class EspecificacionesDeCausas
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
     * @ORM\ManyToOne(targetEntity="Causa", inversedBy="especificaciones")
     * @ORM\JoinColumn(name="id_causa", referencedColumnName="id")
     */
    private $idCausa;

    /**
     * @ORM\OneToMany(targetEntity="AccidenteLaboral", mappedBy="idCausaEspecificaciones", cascade={"persist", "remove"})
     */
    private $accidentelaboral;

    public function __construct()
    {
        $this->accidentelaboral = new ArrayCollection();
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

    public function getIdCausa(): ?Causa
    {
        return $this->idCausa;
    }

    public function setIdCausa(?Causa $idCausa): self
    {
        $this->idCausa = $idCausa;

        return $this;
    }

    /**
     * @return Collection|AccidenteLaboral[]
     */
    public function getAccidentelaboral(): Collection
    {
        return $this->accidentelaboral;
    }

    public function addAccidentelaboral(AccidenteLaboral $accidentelaboral): self
    {
        if (!$this->accidentelaboral->contains($accidentelaboral)) {
            $this->accidentelaboral[] = $accidentelaboral;
            $accidentelaboral->setIdCausaEspecificaciones($this);
        }

        return $this;
    }

    public function removeAccidentelaboral(AccidenteLaboral $accidentelaboral): self
    {
        if ($this->accidentelaboral->contains($accidentelaboral)) {
            $this->accidentelaboral->removeElement($accidentelaboral);
            // set the owning side to null (unless already changed)
            if ($accidentelaboral->getIdCausaEspecificaciones() === $this) {
                $accidentelaboral->setIdCausaEspecificaciones(null);
            }
        }

        return $this;
    }

}
