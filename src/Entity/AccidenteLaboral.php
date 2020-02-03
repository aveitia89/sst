<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AccidenteLaboralRepository")
 */
class AccidenteLaboral
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
    private $horarioDeTrabajo;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $turnosDeTrabajo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $tiempo;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $descripcionAccidenete;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $observacion;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $costoDirecto;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $costoIndirecto;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $conclusionesRecomendaciones;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $fechaInicio;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $fechaTerminacion;

    /**
     * @ORM\OneToOne(targetEntity="Trabajador", inversedBy="accidente")
     * @ORM\JoinColumn(name="id_trabajador", referencedColumnName="id")
     */
    private $idTrabajador;

    /**
     * @ORM\ManyToMany(targetEntity="Trabajador", mappedBy="investigador")
     * @ORM\JoinTable(name="accidentelaboral_investigador")
     */
    private $investigador;

    /**
     * @ORM\ManyToMany(targetEntity="NaturalezaLesion", mappedBy="naturaleza")
     * @ORM\JoinTable(name="accidentelaboral_naturalezalesion")
     */
    private $naturaleza;

    /**
     * @ORM\ManyToMany(targetEntity="PartesDelCuerpoLesionado", mappedBy="lesion")
     * @ORM\JoinTable(name="accidentelaboral_partelesionada")
     */
    private $lesion;

    /**
     * @ORM\ManyToOne(targetEntity="TipoAccidentes", inversedBy="tipoAccidente")
     * @ORM\JoinColumn(name="idtipo_accidentes", referencedColumnName="id")
     */
    private $idtipo;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\FormaDeAccidente", inversedBy="accidenteLaborals")
     */
    private $idformaAccidentes;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\LugarDeTrabajoAccidente", inversedBy="accidenteLaborals")
     */
    private $idlugarAccidente;

    /**
     * @ORM\ManyToOne(targetEntity="EspecificacionesDeAgentematerial", inversedBy="accidentelaboral")
     * @ORM\JoinColumn(name="idagenteespecificaciones", referencedColumnName="id")
     */
    private $idAgenteEspecificaciones;

    /**
     * @ORM\ManyToOne(targetEntity="EspecificacionesDeCausas", inversedBy="accidentelaboral")
     * @ORM\JoinColumn(name="idcausaespecificaciones", referencedColumnName="id")
     */
    private $idCausaEspecificaciones;

    public function __construct()
    {
        $this->investigador = new ArrayCollection();
        $this->naturaleza = new ArrayCollection();
        $this->lesion = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getHorarioDeTrabajo(): ?string
    {
        return $this->horarioDeTrabajo;
    }

    public function setHorarioDeTrabajo(?string $horarioDeTrabajo): self
    {
        $this->horarioDeTrabajo = $horarioDeTrabajo;

        return $this;
    }

    public function getTurnosDeTrabajo(): ?string
    {
        return $this->turnosDeTrabajo;
    }

    public function setTurnosDeTrabajo(?string $turnosDeTrabajo): self
    {
        $this->turnosDeTrabajo = $turnosDeTrabajo;

        return $this;
    }

    public function getTiempo(): ?int
    {
        return $this->tiempo;
    }

    public function setTiempo(?int $tiempo): self
    {
        $this->tiempo = $tiempo;

        return $this;
    }

    public function getDescripcionAccidenete(): ?string
    {
        return $this->descripcionAccidenete;
    }

    public function setDescripcionAccidenete(?string $descripcionAccidenete): self
    {
        $this->descripcionAccidenete = $descripcionAccidenete;

        return $this;
    }

    public function getObservacion(): ?string
    {
        return $this->observacion;
    }

    public function setObservacion(?string $observacion): self
    {
        $this->observacion = $observacion;

        return $this;
    }

    public function getCostoDirecto(): ?float
    {
        return $this->costoDirecto;
    }

    public function setCostoDirecto(?float $costoDirecto): self
    {
        $this->costoDirecto = $costoDirecto;

        return $this;
    }

    public function getCostoIndirecto(): ?float
    {
        return $this->costoIndirecto;
    }

    public function setCostoIndirecto(?float $costoIndirecto): self
    {
        $this->costoIndirecto = $costoIndirecto;

        return $this;
    }

    public function getConclusionesRecomendaciones(): ?string
    {
        return $this->conclusionesRecomendaciones;
    }

    public function setConclusionesRecomendaciones(?string $conclusionesRecomendaciones): self
    {
        $this->conclusionesRecomendaciones = $conclusionesRecomendaciones;

        return $this;
    }

    public function getFechaInicio(): ?\DateTimeInterface
    {
        return $this->fechaInicio;
    }

    public function setFechaInicio(?\DateTimeInterface $fechaInicio): self
    {
        $this->fechaInicio = $fechaInicio;

        return $this;
    }

    public function getFechaTerminacion(): ?\DateTimeInterface
    {
        return $this->fechaTerminacion;
    }

    public function setFechaTerminacion(?\DateTimeInterface $fechaTerminacion): self
    {
        $this->fechaTerminacion = $fechaTerminacion;

        return $this;
    }

    public function getIdTrabajador(): ?Trabajador
    {
        return $this->idTrabajador;
    }

    public function setIdTrabajador(?Trabajador $idTrabajador): self
    {
        $this->idTrabajador = $idTrabajador;

        return $this;
    }

    /**
     * @return Collection|Trabajador[]
     */
    public function getInvestigador(): Collection
    {
        return $this->investigador;
    }

    public function addInvestigador(Trabajador $investigador): self
    {
        if (!$this->investigador->contains($investigador)) {
            $this->investigador[] = $investigador;
            $investigador->addInvestigador($this);
        }

        return $this;
    }

    public function removeInvestigador(Trabajador $investigador): self
    {
        if ($this->investigador->contains($investigador)) {
            $this->investigador->removeElement($investigador);
            $investigador->removeInvestigador($this);
        }

        return $this;
    }

    /**
     * @return Collection|NaturalezaLesion[]
     */
    public function getNaturaleza(): Collection
    {
        return $this->naturaleza;
    }

    public function addNaturaleza(NaturalezaLesion $naturaleza): self
    {
        if (!$this->naturaleza->contains($naturaleza)) {
            $this->naturaleza[] = $naturaleza;
            $naturaleza->addNaturaleza($this);
        }

        return $this;
    }

    public function removeNaturaleza(NaturalezaLesion $naturaleza): self
    {
        if ($this->naturaleza->contains($naturaleza)) {
            $this->naturaleza->removeElement($naturaleza);
            $naturaleza->removeNaturaleza($this);
        }

        return $this;
    }

    /**
     * @return Collection|PartesDelCuerpoLesionado[]
     */
    public function getLesion(): Collection
    {
        return $this->lesion;
    }

    public function addLesion(PartesDelCuerpoLesionado $lesion): self
    {
        if (!$this->lesion->contains($lesion)) {
            $this->lesion[] = $lesion;
            $lesion->addLesion($this);
        }

        return $this;
    }

    public function removeLesion(PartesDelCuerpoLesionado $lesion): self
    {
        if ($this->lesion->contains($lesion)) {
            $this->lesion->removeElement($lesion);
            $lesion->removeLesion($this);
        }

        return $this;
    }

    public function getIdtipo(): ?TipoAccidentes
    {
        return $this->idtipo;
    }

    public function setIdtipo(?TipoAccidentes $idtipo): self
    {
        $this->idtipo = $idtipo;

        return $this;
    }

    public function getIdformaAccidentes(): ?FormaDeAccidente
    {
        return $this->idformaAccidentes;
    }

    public function setIdformaAccidentes(?FormaDeAccidente $idformaAccidentes): self
    {
        $this->idformaAccidentes = $idformaAccidentes;

        return $this;
    }

    public function getIdlugarAccidente(): ?LugarDeTrabajoAccidente
    {
        return $this->idlugarAccidente;
    }

    public function setIdlugarAccidente(?LugarDeTrabajoAccidente $idlugarAccidente): self
    {
        $this->idlugarAccidente = $idlugarAccidente;

        return $this;
    }

    public function getIdAgenteEspecificaciones(): ?EspecificacionesDeAgentematerial
    {
        return $this->idAgenteEspecificaciones;
    }

    public function setIdAgenteEspecificaciones(?EspecificacionesDeAgentematerial $idAgenteEspecificaciones): self
    {
        $this->idAgenteEspecificaciones = $idAgenteEspecificaciones;

        return $this;
    }

    public function getIdCausaEspecificaciones(): ?EspecificacionesDeCausas
    {
        return $this->idCausaEspecificaciones;
    }

    public function setIdCausaEspecificaciones(?EspecificacionesDeCausas $idCausaEspecificaciones): self
    {
        $this->idCausaEspecificaciones = $idCausaEspecificaciones;

        return $this;
    }



}
