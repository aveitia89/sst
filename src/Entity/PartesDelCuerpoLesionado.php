<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PartesDelCuerpoLesionadoRepository")
 */
class PartesDelCuerpoLesionado
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nombre;

    /**
     * @ORM\ManyToMany(targetEntity="AccidenteLaboral", inversedBy="lesion")
     * @ORM\JoinTable(name="accidentelaboral_partelesionada")
     */
    private $lesion;

    public function __construct()
    {
        $this->lesion = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * @return Collection|AccidenteLaboral[]
     */
    public function getLesion(): Collection
    {
        return $this->lesion;
    }

    public function addLesion(AccidenteLaboral $lesion): self
    {
        if (!$this->lesion->contains($lesion)) {
            $this->lesion[] = $lesion;
        }

        return $this;
    }

    public function removeLesion(AccidenteLaboral $lesion): self
    {
        if ($this->lesion->contains($lesion)) {
            $this->lesion->removeElement($lesion);
        }

        return $this;
    }
}
