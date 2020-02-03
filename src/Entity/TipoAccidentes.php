<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * TipoAccidentes
 *
 * @ORM\Table(name="tipo_accidentes")
 * @ORM\Entity
 */
class TipoAccidentes
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string|null
     *
     * @ORM\Column(name="tipo", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $tipo = 'NULL';

    /**
     * @ORM\OneToMany(targetEntity="AccidenteLaboral", mappedBy="idtipo", cascade={"persist", "remove"})
     *
     */
    private $tipoAccidente;

    public function __construct()
    {
        $this->tipoAccidente = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipo(): ?string
    {
        return $this->tipo;
    }

    public function setTipo(?string $tipo): self
    {
        $this->tipo = $tipo;

        return $this;
    }

    /**
     * @return Collection|AccidenteLaboral[]
     */
    public function getTipoAccidente(): Collection
    {
        return $this->tipoAccidente;
    }

    public function addTipoAccidente(AccidenteLaboral $tipoAccidente): self
    {
        if (!$this->tipoAccidente->contains($tipoAccidente)) {
            $this->tipoAccidente[] = $tipoAccidente;
            $tipoAccidente->setIdtipo($this);
        }

        return $this;
    }

    public function removeTipoAccidente(AccidenteLaboral $tipoAccidente): self
    {
        if ($this->tipoAccidente->contains($tipoAccidente)) {
            $this->tipoAccidente->removeElement($tipoAccidente);
            // set the owning side to null (unless already changed)
            if ($tipoAccidente->getIdtipo() === $this) {
                $tipoAccidente->setIdtipo(null);
            }
        }

        return $this;
    }


}
