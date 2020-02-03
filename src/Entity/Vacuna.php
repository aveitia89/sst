<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\VacunaRepository")
 */
class Vacuna
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(name="nombre_vacuna", type="string", length=255)
     */
    private $nombreVacuna;

    /**
     * @ORM\OneToMany(targetEntity="VacunaTrabajador", mappedBy="idVacuna", cascade={"persist", "remove"})
     *
     */
    private $vacunatrabajador;

    public function __construct()
    {
        $this->vacunatrabajador = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombreVacuna(): ?string
    {
        return $this->nombreVacuna;
    }

    public function setNombreVacuna(string $nombreVacuna): self
    {
        $this->nombreVacuna = $nombreVacuna;

        return $this;
    }

    /**
     * @return Collection|VacunaTrabajador[]
     */
    public function getVacunatrabajador(): Collection
    {
        return $this->vacunatrabajador;
    }

    public function addVacunatrabajador(VacunaTrabajador $vacunatrabajador): self
    {
        if (!$this->vacunatrabajador->contains($vacunatrabajador)) {
            $this->vacunatrabajador[] = $vacunatrabajador;
            $vacunatrabajador->setIdVacuna($this);
        }

        return $this;
    }

    public function removeVacunatrabajador(VacunaTrabajador $vacunatrabajador): self
    {
        if ($this->vacunatrabajador->contains($vacunatrabajador)) {
            $this->vacunatrabajador->removeElement($vacunatrabajador);
            // set the owning side to null (unless already changed)
            if ($vacunatrabajador->getIdVacuna() === $this) {
                $vacunatrabajador->setIdVacuna(null);
            }
        }

        return $this;
    }

}
