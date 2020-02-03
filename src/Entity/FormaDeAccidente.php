<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\FormaDeAccidenteRepository")
 */
class FormaDeAccidente
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
    private $formas;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\AccidenteLaboral", mappedBy="idformaAccidentes")
     */
    private $accidenteLaborals;

    public function __construct()
    {
        $this->accidenteLaborals = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFormas(): ?string
    {
        return $this->formas;
    }

    public function setFormas(?string $formas): self
    {
        $this->formas = $formas;

        return $this;
    }

    /**
     * @return Collection|AccidenteLaboral[]
     */
    public function getAccidenteLaborals(): Collection
    {
        return $this->accidenteLaborals;
    }

    public function addAccidenteLaboral(AccidenteLaboral $accidenteLaboral): self
    {
        if (!$this->accidenteLaborals->contains($accidenteLaboral)) {
            $this->accidenteLaborals[] = $accidenteLaboral;
            $accidenteLaboral->setIdformaAccidentes($this);
        }

        return $this;
    }

    public function removeAccidenteLaboral(AccidenteLaboral $accidenteLaboral): self
    {
        if ($this->accidenteLaborals->contains($accidenteLaboral)) {
            $this->accidenteLaborals->removeElement($accidenteLaboral);
            // set the owning side to null (unless already changed)
            if ($accidenteLaboral->getIdformaAccidentes() === $this) {
                $accidenteLaboral->setIdformaAccidentes(null);
            }
        }

        return $this;
    }
}
