<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AgenteMaterialRepository")
 */
class AgenteMaterial
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
     * @ORM\OneToMany(targetEntity="App\Entity\EspecificacionesDeAgentematerial", mappedBy="idagenteMaterial")
     */
    private $especificacionesDeAgentematerials;

    public function __construct()
    {
        $this->especificacionesDeAgentematerials = new ArrayCollection();
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
     * @return Collection|EspecificacionesDeAgentematerial[]
     */
    public function getEspecificacionesDeAgentematerials(): Collection
    {
        return $this->especificacionesDeAgentematerials;
    }

    public function addEspecificacionesDeAgentematerial(EspecificacionesDeAgentematerial $especificacionesDeAgentematerial): self
    {
        if (!$this->especificacionesDeAgentematerials->contains($especificacionesDeAgentematerial)) {
            $this->especificacionesDeAgentematerials[] = $especificacionesDeAgentematerial;
            $especificacionesDeAgentematerial->setIdagenteMaterial($this);
        }

        return $this;
    }

    public function removeEspecificacionesDeAgentematerial(EspecificacionesDeAgentematerial $especificacionesDeAgentematerial): self
    {
        if ($this->especificacionesDeAgentematerials->contains($especificacionesDeAgentematerial)) {
            $this->especificacionesDeAgentematerials->removeElement($especificacionesDeAgentematerial);
            // set the owning side to null (unless already changed)
            if ($especificacionesDeAgentematerial->getIdagenteMaterial() === $this) {
                $especificacionesDeAgentematerial->setIdagenteMaterial(null);
            }
        }

        return $this;
    }

}
