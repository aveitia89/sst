<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PermisoSeguridadRepository")
 */
class PermisoSeguridad
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
    private $ordenDeTrabajo;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $descripcionTrabajo;

    /**
     * @ORM\ManyToMany(targetEntity="MedidasSeguridad", inversedBy="seguridad")
     * @ORM\JoinTable(name="permisosseguridad_medidas")
     */
    private $seguridad;

    /**
     * @ORM\OneToMany(targetEntity="PermisosSeguridadTrabajadoresEjecutan", mappedBy="idPermisosSeguridad", cascade={"persist", "remove"})
     *
     */
    private $seguridadPermisos;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $fechaEjecucion;

    /**
     * @ORM\Column(type="time", nullable=true)
     */
    private $horarioInicio;

    /**
     * @ORM\Column(type="time", nullable=true)
     */
    private $horarioFin;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\LugarEjecucionPermiso", inversedBy="permisoSeguridads")
     */
    private $idLugar;

    public function __construct()
    {
        $this->seguridad = new ArrayCollection();
        $this->seguridadPermisos = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOrdenDeTrabajo(): ?string
    {
        return $this->ordenDeTrabajo;
    }

    public function setOrdenDeTrabajo(?string $ordenDeTrabajo): self
    {
        $this->ordenDeTrabajo = $ordenDeTrabajo;

        return $this;
    }

    public function getDescripcionTrabajo(): ?string
    {
        return $this->descripcionTrabajo;
    }

    public function setDescripcionTrabajo(?string $descripcionTrabajo): self
    {
        $this->descripcionTrabajo = $descripcionTrabajo;

        return $this;
    }

    public function getFechaEjecucion(): ?\DateTimeInterface
    {
        return $this->fechaEjecucion;
    }

    public function setFechaEjecucion(?\DateTimeInterface $fechaEjecucion): self
    {
        $this->fechaEjecucion = $fechaEjecucion;

        return $this;
    }

    public function getHorarioInicio(): ?\DateTimeInterface
    {
        return $this->horarioInicio;
    }

    public function setHorarioInicio(?\DateTimeInterface $horarioInicio): self
    {
        $this->horarioInicio = $horarioInicio;

        return $this;
    }

    public function getHorarioFin(): ?\DateTimeInterface
    {
        return $this->horarioFin;
    }

    public function setHorarioFin(?\DateTimeInterface $horarioFin): self
    {
        $this->horarioFin = $horarioFin;

        return $this;
    }

    /**
     * @return Collection|MedidasSeguridad[]
     */
    public function getSeguridad(): Collection
    {
        return $this->seguridad;
    }

    public function addSeguridad(MedidasSeguridad $seguridad): self
    {
        if (!$this->seguridad->contains($seguridad)) {
            $this->seguridad[] = $seguridad;
        }

        return $this;
    }

    public function removeSeguridad(MedidasSeguridad $seguridad): self
    {
        if ($this->seguridad->contains($seguridad)) {
            $this->seguridad->removeElement($seguridad);
        }

        return $this;
    }

    /**
     * @return Collection|PermisosSeguridadTrabajadoresEjecutan[]
     */
    public function getSeguridadPermisos(): Collection
    {
        return $this->seguridadPermisos;
    }

    public function addSeguridadPermiso(PermisosSeguridadTrabajadoresEjecutan $seguridadPermiso): self
    {
        if (!$this->seguridadPermisos->contains($seguridadPermiso)) {
            $this->seguridadPermisos[] = $seguridadPermiso;
            $seguridadPermiso->setIdPermisosSeguridad($this);
        }

        return $this;
    }

    public function removeSeguridadPermiso(PermisosSeguridadTrabajadoresEjecutan $seguridadPermiso): self
    {
        if ($this->seguridadPermisos->contains($seguridadPermiso)) {
            $this->seguridadPermisos->removeElement($seguridadPermiso);
            // set the owning side to null (unless already changed)
            if ($seguridadPermiso->getIdPermisosSeguridad() === $this) {
                $seguridadPermiso->setIdPermisosSeguridad(null);
            }
        }

        return $this;
    }

    public function getIdLugar(): ?LugarEjecucionPermiso
    {
        return $this->idLugar;
    }

    public function setIdLugar(?LugarEjecucionPermiso $idLugar): self
    {
        $this->idLugar = $idLugar;

        return $this;
    }



}
