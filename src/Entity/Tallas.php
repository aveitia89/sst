<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TallasRepository")
 */
class Tallas
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
    private $talladescripcion;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $medidasCM;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $proveedor;

    /**
     * @ORM\ManyToOne(targetEntity="TipoTallas", inversedBy="tallas")
     * @ORM\JoinColumn(name="idTipoTalla", referencedColumnName="id")
     */
    private $idTipoTalla;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTalladescripcion(): ?string
    {
        return $this->talladescripcion;
    }

    public function setTalladescripcion(?string $talladescripcion): self
    {
        $this->talladescripcion = $talladescripcion;

        return $this;
    }

    public function getMedidasCM(): ?float
    {
        return $this->medidasCM;
    }

    public function setMedidasCM(?float $medidasCM): self
    {
        $this->medidasCM = $medidasCM;

        return $this;
    }

    public function getProveedor(): ?bool
    {
        return $this->proveedor;
    }

    public function setProveedor(?bool $proveedor): self
    {
        $this->proveedor = $proveedor;

        return $this;
    }

    public function getIdTipoTalla(): ?self
    {
        return $this->idTipoTalla;
    }

    public function setIdTipoTalla(?self $idTipoTalla): self
    {
        $this->idTipoTalla = $idTipoTalla;

        return $this;
    }


}
