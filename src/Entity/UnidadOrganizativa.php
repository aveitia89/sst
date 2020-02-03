<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UnidadOrganizativaRepository")
 */
class UnidadOrganizativa
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
     * @ORM\OneToMany(targetEntity="Trabajador", mappedBy="idUnidadOrganizativa", cascade={"persist", "remove"})
     *
     */
    private $trabajador;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Supervision", mappedBy="idUO")
     */
    private $supervisions;

    /**
     * @ORM\OneToMany(targetEntity="AreaUO", mappedBy="idUO", cascade={"persist", "remove"})
     *
     */
    private $unidadOrganizativa;

    public function __construct()
    {
        $this->trabajador = new ArrayCollection();
        $this->supervisions = new ArrayCollection();
        $this->unidadOrganizativa = new ArrayCollection();
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
            $trabajador->setIdUnidadOrganizativa($this);
        }

        return $this;
    }

    public function removeTrabajador(Trabajador $trabajador): self
    {
        if ($this->trabajador->contains($trabajador)) {
            $this->trabajador->removeElement($trabajador);
            // set the owning side to null (unless already changed)
            if ($trabajador->getIdUnidadOrganizativa() === $this) {
                $trabajador->setIdUnidadOrganizativa(null);
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
            $supervision->setIdUO($this);
        }

        return $this;
    }

    public function removeSupervision(Supervision $supervision): self
    {
        if ($this->supervisions->contains($supervision)) {
            $this->supervisions->removeElement($supervision);
            // set the owning side to null (unless already changed)
            if ($supervision->getIdUO() === $this) {
                $supervision->setIdUO(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|AreaUO[]
     */
    public function getUnidadOrganizativa(): Collection
    {
        return $this->unidadOrganizativa;
    }

    public function addUnidadOrganizativa(AreaUO $unidadOrganizativa): self
    {
        if (!$this->unidadOrganizativa->contains($unidadOrganizativa)) {
            $this->unidadOrganizativa[] = $unidadOrganizativa;
            $unidadOrganizativa->setIdUO($this);
        }

        return $this;
    }

    public function removeUnidadOrganizativa(AreaUO $unidadOrganizativa): self
    {
        if ($this->unidadOrganizativa->contains($unidadOrganizativa)) {
            $this->unidadOrganizativa->removeElement($unidadOrganizativa);
            // set the owning side to null (unless already changed)
            if ($unidadOrganizativa->getIdUO() === $this) {
                $unidadOrganizativa->setIdUO(null);
            }
        }

        return $this;
    }


}
