<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\SeveridadRepository")
 */
class Severidad
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
    private $descripcion;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $valor;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Riesgo", mappedBy="idseveridad")
     */
    private $riesgos;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Grado", inversedBy="severidads")
     */
    private $idgrado;

    public function __construct()
    {
        $this->riesgos = new ArrayCollection();
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

    public function getValor(): ?int
    {
        return $this->valor;
    }

    public function setValor(?int $valor): self
    {
        $this->valor = $valor;

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
            $riesgo->setIdseveridad($this);
        }

        return $this;
    }

    public function removeRiesgo(Riesgo $riesgo): self
    {
        if ($this->riesgos->contains($riesgo)) {
            $this->riesgos->removeElement($riesgo);
            // set the owning side to null (unless already changed)
            if ($riesgo->getIdseveridad() === $this) {
                $riesgo->setIdseveridad(null);
            }
        }

        return $this;
    }

    public function getIdgrado(): ?Grado
    {
        return $this->idgrado;
    }

    public function setIdgrado(?Grado $idgrado): self
    {
        $this->idgrado = $idgrado;

        return $this;
    }
}
