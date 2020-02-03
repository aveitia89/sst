<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\SupervisionRepository")
 */
class Supervision
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
    private $aspecto;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $fecha;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $estado;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $observaciones;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $evaluacionFinal;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Area", inversedBy="supervisions")
     */
    private $idarea;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\UnidadOrganizativa", inversedBy="supervisions")
     */
    private $idUO;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\NivelSupervision", inversedBy="supervisions")
     */
    private $idnivel;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PlanDeMedidas", mappedBy="idsupervision")
     */
    private $planDeMedidas;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Riesgo", mappedBy="idsupervision")
     */
    private $riesgos;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Trabajador", inversedBy="supervisions")
     */
    private $trabajadores;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\DeficienciasDetectadas", inversedBy="supervisions")
     */
    private $deficiencias;

    public function __construct()
    {
        $this->trabajadores = new ArrayCollection();
        $this->planDeMedidas = new ArrayCollection();
        $this->riesgos = new ArrayCollection();
        $this->deficiencias = new ArrayCollection();
    }

    /**
     * @return Collection|Trabajador[]
     */
    public function getTrabajadores(): Collection
    {
        return $this->trabajadores;
    }

    public function addTrabajadore(Trabajador $trabajadore): self
    {
        if (!$this->trabajadores->contains($trabajadore)) {
            $this->trabajadores[] = $trabajadore;
        }

        return $this;
    }

    public function removeTrabajadore(Trabajador $trabajadore): self
    {
        if ($this->trabajadores->contains($trabajadore)) {
            $this->trabajadores->removeElement($trabajadore);
        }

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAspecto(): ?string
    {
        return $this->aspecto;
    }

    public function setAspecto(?string $aspecto): self
    {
        $this->aspecto = $aspecto;

        return $this;
    }

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(?\DateTimeInterface $fecha): self
    {
        $this->fecha = $fecha;

        return $this;
    }

    public function getEstado(): ?string
    {
        return $this->estado;
    }

    public function setEstado(?string $estado): self
    {
        $this->estado = $estado;

        return $this;
    }

    public function getObservaciones(): ?string
    {
        return $this->observaciones;
    }

    public function setObservaciones(?string $observaciones): self
    {
        $this->observaciones = $observaciones;

        return $this;
    }

    public function getEvaluacionFinal(): ?string
    {
        return $this->evaluacionFinal;
    }

    public function setEvaluacionFinal(?string $evaluacionFinal): self
    {
        $this->evaluacionFinal = $evaluacionFinal;

        return $this;
    }

    public function getIdarea(): ?Area
    {
        return $this->idarea;
    }

    public function setIdarea(?Area $idarea): self
    {
        $this->idarea = $idarea;

        return $this;
    }

    public function getIdUO(): ?UnidadOrganizativa
    {
        return $this->idUO;
    }

    public function setIdUO(?UnidadOrganizativa $idUO): self
    {
        $this->idUO = $idUO;

        return $this;
    }

    public function getIdnivel(): ?NivelSupervision
    {
        return $this->idnivel;
    }

    public function setIdnivel(?NivelSupervision $idnivel): self
    {
        $this->idnivel = $idnivel;

        return $this;
    }

    /**
     * @return Collection|PlanDeMedidas[]
     */
    public function getPlanDeMedidas(): Collection
    {
        return $this->planDeMedidas;
    }

    public function addPlanDeMedida(PlanDeMedidas $planDeMedida): self
    {
        if (!$this->planDeMedidas->contains($planDeMedida)) {
            $this->planDeMedidas[] = $planDeMedida;
            $planDeMedida->setIdsupervision($this);
        }

        return $this;
    }

    public function removePlanDeMedida(PlanDeMedidas $planDeMedida): self
    {
        if ($this->planDeMedidas->contains($planDeMedida)) {
            $this->planDeMedidas->removeElement($planDeMedida);
            // set the owning side to null (unless already changed)
            if ($planDeMedida->getIdsupervision() === $this) {
                $planDeMedida->setIdsupervision(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Riesgo[]
     */
    public function getRiesgos(): Collection
    {
        return $this->riesgos;
    }

    public function addRiesgo(Riesgo $riesgo): self
    {
        if (!$this->riesgos->contains($riesgo)) {
            $this->riesgos[] = $riesgo;
            $riesgo->setIdsupervision($this);
        }

        return $this;
    }

    public function removeRiesgo(Riesgo $riesgo): self
    {
        if ($this->riesgos->contains($riesgo)) {
            $this->riesgos->removeElement($riesgo);
            // set the owning side to null (unless already changed)
            if ($riesgo->getIdsupervision() === $this) {
                $riesgo->setIdsupervision(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|DeficienciasDetectadas[]
     */
    public function getDeficiencias(): Collection
    {
        return $this->deficiencias;
    }

    public function addDeficiencia(DeficienciasDetectadas $deficiencia): self
    {
        if (!$this->deficiencias->contains($deficiencia)) {
            $this->deficiencias[] = $deficiencia;
        }

        return $this;
    }

    public function removeDeficiencia(DeficienciasDetectadas $deficiencia): self
    {
        if ($this->deficiencias->contains($deficiencia)) {
            $this->deficiencias->removeElement($deficiencia);
        }

        return $this;
    }

}
