<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AreaRepository")
 */
class Area
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
     * @ORM\OneToMany(targetEntity="Usuario", mappedBy="idArea", cascade={"persist", "remove"})
     *
     */
    private $usuario;

    /**
     * @ORM\OneToMany(targetEntity="Trabajador", mappedBy="idArea", cascade={"persist", "remove"})
     *
     */
    private $trabajador;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Supervision", mappedBy="idarea")
     */
    private $supervisions;

    /**
     * @ORM\OneToMany(targetEntity="AreaUO", mappedBy="idArea", cascade={"persist", "remove"})
     *
     */
    private $area;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\LugarEjecucionPermiso", mappedBy="idArea")
     */
    private $lugarEjecucionPermisos;

    public function __construct()
    {
        $this->usuario = new ArrayCollection();
        $this->trabajador = new ArrayCollection();
        $this->supervisions = new ArrayCollection();
        $this->area = new ArrayCollection();
        $this->lugarEjecucionPermisos = new ArrayCollection();
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
     * @return Collection|Usuario[]
     */
    public function getUsuario(): Collection
    {
        return $this->usuario;
    }

    public function addUsuario(Usuario $usuario): self
    {
        if (!$this->usuario->contains($usuario)) {
            $this->usuario[] = $usuario;
            $usuario->setIdArea($this);
        }

        return $this;
    }

    public function removeUsuario(Usuario $usuario): self
    {
        if ($this->usuario->contains($usuario)) {
            $this->usuario->removeElement($usuario);
            // set the owning side to null (unless already changed)
            if ($usuario->getIdArea() === $this) {
                $usuario->setIdArea(null);
            }
        }

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
            $trabajador->setIdArea($this);
        }

        return $this;
    }

    public function removeTrabajador(Trabajador $trabajador): self
    {
        if ($this->trabajador->contains($trabajador)) {
            $this->trabajador->removeElement($trabajador);
            // set the owning side to null (unless already changed)
            if ($trabajador->getIdArea() === $this) {
                $trabajador->setIdArea(null);
            }
        }

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
            $supervision->setIdarea($this);
        }

        return $this;
    }

    public function removeSupervision(Supervision $supervision): self
    {
        if ($this->supervisions->contains($supervision)) {
            $this->supervisions->removeElement($supervision);
            // set the owning side to null (unless already changed)
            if ($supervision->getIdarea() === $this) {
                $supervision->setIdarea(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|AreaUO[]
     */
    public function getArea(): Collection
    {
        return $this->area;
    }

    public function addArea(AreaUO $area): self
    {
        if (!$this->area->contains($area)) {
            $this->area[] = $area;
            $area->setIdArea($this);
        }

        return $this;
    }

    public function removeArea(AreaUO $area): self
    {
        if ($this->area->contains($area)) {
            $this->area->removeElement($area);
            // set the owning side to null (unless already changed)
            if ($area->getIdArea() === $this) {
                $area->setIdArea(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|LugarEjecucionPermiso[]
     */
    public function getLugarEjecucionPermisos(): Collection
    {
        return $this->lugarEjecucionPermisos;
    }

    public function addLugarEjecucionPermiso(LugarEjecucionPermiso $lugarEjecucionPermiso): self
    {
        if (!$this->lugarEjecucionPermisos->contains($lugarEjecucionPermiso)) {
            $this->lugarEjecucionPermisos[] = $lugarEjecucionPermiso;
            $lugarEjecucionPermiso->setIdArea($this);
        }

        return $this;
    }

    public function removeLugarEjecucionPermiso(LugarEjecucionPermiso $lugarEjecucionPermiso): self
    {
        if ($this->lugarEjecucionPermisos->contains($lugarEjecucionPermiso)) {
            $this->lugarEjecucionPermisos->removeElement($lugarEjecucionPermiso);
            // set the owning side to null (unless already changed)
            if ($lugarEjecucionPermiso->getIdArea() === $this) {
                $lugarEjecucionPermiso->setIdArea(null);
            }
        }

        return $this;
    }


}
