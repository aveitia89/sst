<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MedicamentoRepository")
 */
class Medicamento
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
     * @ORM\OneToMany(targetEntity="AsignarMedicamento", mappedBy="idMedicamento", cascade={"persist", "remove"})
     *
     */
    private $asignarmedicamentos;

    public function __construct()
    {
        $this->asignarmedicamentos = new ArrayCollection();
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
     * @return Collection|AsignarMedicamento[]
     */
    public function getAsignarmedicamentos(): Collection
    {
        return $this->asignarmedicamentos;
    }

    public function addAsignarmedicamento(AsignarMedicamento $asignarmedicamento): self
    {
        if (!$this->asignarmedicamentos->contains($asignarmedicamento)) {
            $this->asignarmedicamentos[] = $asignarmedicamento;
            $asignarmedicamento->setIdMedicamento($this);
        }

        return $this;
    }

    public function removeAsignarmedicamento(AsignarMedicamento $asignarmedicamento): self
    {
        if ($this->asignarmedicamentos->contains($asignarmedicamento)) {
            $this->asignarmedicamentos->removeElement($asignarmedicamento);
            // set the owning side to null (unless already changed)
            if ($asignarmedicamento->getIdMedicamento() === $this) {
                $asignarmedicamento->setIdMedicamento(null);
            }
        }

        return $this;
    }
}
