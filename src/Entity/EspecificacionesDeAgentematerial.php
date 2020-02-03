<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EspecificacionesDeAgentematerialRepository")
 */
class EspecificacionesDeAgentematerial
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
     * @ORM\ManyToOne(targetEntity="App\Entity\AgenteMaterial", inversedBy="especificacionesDeAgentematerials")
     */
    private $idagenteMaterial;

    /**
     * @ORM\OneToMany(targetEntity="AccidenteLaboral", mappedBy="idAgenteEspecificaciones", cascade={"persist", "remove"})
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

    public function getIdagenteMaterial(): ?AgenteMaterial
    {
        return $this->idagenteMaterial;
    }

    public function setIdagenteMaterial(?AgenteMaterial $idagenteMaterial): self
    {
        $this->idagenteMaterial = $idagenteMaterial;

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
            $accidentelaboral->setIdAgenteEspecificaciones($this);
        }

        return $this;
    }

    public function removeAccidentelaboral(AccidenteLaboral $accidentelaboral): self
    {
        if ($this->accidentelaboral->contains($accidentelaboral)) {
            $this->accidentelaboral->removeElement($accidentelaboral);
            // set the owning side to null (unless already changed)
            if ($accidentelaboral->getIdAgenteEspecificaciones() === $this) {
                $accidentelaboral->setIdAgenteEspecificaciones(null);
            }
        }

        return $this;
    }


}
