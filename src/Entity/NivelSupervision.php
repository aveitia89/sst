<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\NivelSupervisionRepository")
 */
class NivelSupervision
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
    private $nivel;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Supervision", mappedBy="idnivel")
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

    public function getNivel(): ?string
    {
        return $this->nivel;
    }

    public function setNivel(?string $nivel): self
    {
        $this->nivel = $nivel;

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
            $supervision->setIdnivel($this);
        }

        return $this;
    }

    public function removeSupervision(Supervision $supervision): self
    {
        if ($this->supervisions->contains($supervision)) {
            $this->supervisions->removeElement($supervision);
            // set the owning side to null (unless already changed)
            if ($supervision->getIdnivel() === $this) {
                $supervision->setIdnivel(null);
            }
        }

        return $this;
    }
}
