<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\RiesgoRepository")
 */
class Riesgo
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Probabilidad", inversedBy="riesgos")
     */
    private $idprobabilidad;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Severidad", inversedBy="riesgos")
     */
    private $idseveridad;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $descripcion;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PlanDeMedidas", mappedBy="idRiesgo")
     */
    private $planDeMedidas;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Supervision", inversedBy="riesgos")
     */
    private $idsupervision;

    public function __construct()
    {
        $this->planDeMedidas = new ArrayCollection();
    }

    public function getIdsupervision(): ?Supervision
    {
        return $this->idsupervision;
    }

    public function setIdsupervision(?Supervision $idsupervision): self
    {
        $this->idsupervision = $idsupervision;

        return $this;
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

    public function getIdprobabilidad(): ?Probabilidad
    {
        return $this->idprobabilidad;
    }

    public function setIdprobabilidad(?Probabilidad $idprobabilidad): self
    {
        $this->idprobabilidad = $idprobabilidad;

        return $this;
    }

    public function getIdseveridad(): ?Severidad
    {
        return $this->idseveridad;
    }

    public function setIdseveridad(?Severidad $idseveridad): self
    {
        $this->idseveridad = $idseveridad;

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
            $planDeMedida->setIdRiesgo($this);
        }

        return $this;
    }

    public function removePlanDeMedida(PlanDeMedidas $planDeMedida): self
    {
        if ($this->planDeMedidas->contains($planDeMedida)) {
            $this->planDeMedidas->removeElement($planDeMedida);
            // set the owning side to null (unless already changed)
            if ($planDeMedida->getIdRiesgo() === $this) {
                $planDeMedida->setIdRiesgo(null);
            }
        }

        return $this;
    }

}
