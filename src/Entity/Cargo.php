<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CargoRepository")
 */
class Cargo
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
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $descripcion;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $tiempoChequeo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $tiempoOriginalChequeo;

    /**
     * @ORM\OneToMany(targetEntity="Trabajador", mappedBy="idCargo", cascade={"persist", "remove"})
     *
     */
    private $trabajador;

    /**
     * @ORM\OneToMany(targetEntity="VacunaTrabajador", mappedBy="idCargo", cascade={"persist", "remove"})
     *
     */
    private $vacunacargo;

    public function __construct()
    {
        $this->trabajador = new ArrayCollection();
        $this->vacunacargo = new ArrayCollection();
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

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(?string $descripcion): self
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    public function getTiempoChequeo(): ?int
    {
        return $this->tiempoChequeo;
    }

    public function setTiempoChequeo(?int $tiempoChequeo): self
    {
        $this->tiempoChequeo = $tiempoChequeo;

        return $this;
    }

    public function getTiempoOriginalChequeo(): ?int
    {
        return $this->tiempoOriginalChequeo;
    }

    public function setTiempoOriginalChequeo(?int $tiempoOriginalChequeo): self
    {
        $this->tiempoOriginalChequeo = $tiempoOriginalChequeo;

        return $this;
    }

    /**
     * @return Collection|Trabajador[]
     */
    public function getTrabajador(): Collection
    {
        return $this->trabajador;
    }

    public function addTrabajador(Trabajador $trabajador): self
    {
        if (!$this->trabajador->contains($trabajador)) {
            $this->trabajador[] = $trabajador;
            $trabajador->setIdCargo($this);
        }

        return $this;
    }

    public function removeTrabajador(Trabajador $trabajador): self
    {
        if ($this->trabajador->contains($trabajador)) {
            $this->trabajador->removeElement($trabajador);
            // set the owning side to null (unless already changed)
            if ($trabajador->getIdCargo() === $this) {
                $trabajador->setIdCargo(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|VacunaTrabajador[]
     */
    public function getVacunacargo(): Collection
    {
        return $this->vacunacargo;
    }

    public function addVacunacargo(VacunaTrabajador $vacunacargo): self
    {
        if (!$this->vacunacargo->contains($vacunacargo)) {
            $this->vacunacargo[] = $vacunacargo;
            $vacunacargo->setIdCargo($this);
        }

        return $this;
    }

    public function removeVacunacargo(VacunaTrabajador $vacunacargo): self
    {
        if ($this->vacunacargo->contains($vacunacargo)) {
            $this->vacunacargo->removeElement($vacunacargo);
            // set the owning side to null (unless already changed)
            if ($vacunacargo->getIdCargo() === $this) {
                $vacunacargo->setIdCargo(null);
            }
        }

        return $this;
    }
}
