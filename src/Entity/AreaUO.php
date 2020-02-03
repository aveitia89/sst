<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AreaUORepository")
 */
class AreaUO
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Area", inversedBy="area")
     * @ORM\JoinColumn(name="id_area", referencedColumnName="id")
     */
    private $idArea;

    /**
     * @ORM\ManyToOne(targetEntity="UnidadOrganizativa", inversedBy="unidadOrganizativa")
     * @ORM\JoinColumn(name="id_uo", referencedColumnName="id")
     */
    private $idUO;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIdArea(): ?Area
    {
        return $this->idArea;
    }

    public function setIdArea(?Area $idArea): self
    {
        $this->idArea = $idArea;

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
}
