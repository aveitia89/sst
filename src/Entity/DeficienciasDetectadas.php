<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\DeficienciasDetectadasRepository")
 */
class DeficienciasDetectadas
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
     * @ORM\ManyToMany(targetEntity="App\Entity\Supervision", mappedBy="deficiencias")
     */
    private $supervisions;

    public function __construct()
    {
        $this->supervisions = new ArrayCollection();
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
     * @return Collection|Supervision[]
     */
    public function getSupervisions(): Collection
    {
        return $this->supervisions;
    }

    public function addSupervision(Supervision $supervision): self
    {
        if (!$this->supervisions->contains($supervision)) {
            $this->supervisions[] = $supervision;
            $supervision->addDeficiencia($this);
        }

        return $this;
    }

    public function removeSupervision(Supervision $supervision): self
    {
        if ($this->supervisions->contains($supervision)) {
            $this->supervisions->removeElement($supervision);
            $supervision->removeDeficiencia($this);
        }

        return $this;
    }
}
