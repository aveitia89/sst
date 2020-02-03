<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TrabajadorRepository")
 */
class Trabajador
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(name="nombre", type="string", length=255, nullable=true)
     */
    private $nombre;

    /**
     * @ORM\Column(name="primer_apellido", type="string", length=255, nullable=true)
     */
    private $apellidos;

    /**
     * @ORM\Column(name="Ci", type="string", length=255, nullable=true)
     */
    private $ci;

    /**
     * @ORM\Column(name="sexo", type="string", length=255, nullable=true)
     */
    private $sexo;

    /**
     * @ORM\Column(name="raza", type="string", length=255, nullable=true)
     */
    private $raza;

    /**
     * @ORM\Column(name="nivel_escolar" ,type="string", length=255, nullable=true)
     */
    private $nivelEscolar;

    /**
     * @ORM\Column(name="nombre_titulo", type="string", length=255, nullable=true)
     */
    private $nombreTitulo;

    /**
     * @ORM\Column(name="ano_graduacion",type="integer", length=11, nullable=true)
     */
    private $anoGraduacion;

    /**
     * @ORM\Column(name="pcc", type="integer", nullable=true)
     */
    private $pcc;

    /**
     * @ORM\Column(name="ujc", type="integer", nullable=true)
     */
    private $ujc;

    /**
     * @ORM\Column(name="estado_civil", type="string", length=255, nullable=true)
     */
    private $estadoCivil;

    /**
     * @ORM\Column(name="calle_y_numero",type="string", length=255, nullable=true)
     */
    private $calleYNumero;

    /**
     * @ORM\Column(name="entre_calles", type="string", length=255, nullable=true)
     */
    private $entreCalles;

    /**
     * @ORM\Column(name="municipio", type="integer", nullable=true)
     */
    private $municipio;

    /**
     * @ORM\Column(name="detalles", type="string", length=255, nullable=true)
     */
    private $detalles;

    /**
     * @ORM\Column(name="ubicacion_de_la_defensa", type="string", length=255, nullable=true)
     */
    private $ubicacionDeLaDefensa;

    /**
     * @ORM\Column(name="total", type="float", length=255, nullable=true)
     */
    private $total;

    /**
     * @ORM\Column(name="moneda", type="string", length=255, length=255, nullable=true)
     */
    private $moneda;

    /**
     * @ORM\Column(name="area_de_personal", type="string", length=255, nullable=true)
     */
    private $areaDePersonal;

    /**
     * @ORM\Column(name="modulo_de_ropa", type="string", length=255, nullable=true)
     */
    private $moduloDeRopa;

    /**
     * @ORM\Column(name="titulo", type="string", length=255, nullable=true)
     */
    private $titulo;

    /**
     * @ORM\Column(name="subdivision_personal", type="string", length=255, nullable=true)
     */
    private $subdivisionPersonal;

    /**
     * @ORM\Column(name="numero_persona", type="integer", nullable=true)
     */
    private $numeroPersona;

    /**
     * @ORM\Column(name="clase_de_contrato", type="string", length=255, nullable=true)
     */
    private $claseDeContrato;

    /**
     * @ORM\Column(name="segundo_apellido", type="string", length=255, nullable=true)
     */
    private $segundoApellido;

    /**
     * @ORM\Column(name="tiempo_restante_chequeo", type="string", length=255, nullable=true)
     */
    private $tiempoRestanteChequeo;

    /**
     * @ORM\OneToMany(targetEntity="VacunaTrabajador", mappedBy="idTrabajador", cascade={"persist", "remove"})
     *
     */
    private $vacunatrabajador;

    /**
     * @ORM\OneToMany(targetEntity="AsignarMedicamento", mappedBy="idTrabajador", cascade={"persist", "remove"})
     *
     */
    private $asignarmedicamentos;

    /**
     * @ORM\OneToMany(targetEntity="EntregaEspejuelo", mappedBy="idTrabajador", cascade={"persist", "remove"})
     *
     */
    private $espejuelos;

    /**
     * @ORM\OneToMany(targetEntity="ChequeoMedico", mappedBy="idTrabajador", cascade={"persist", "remove"})
     *
     */
    private $chequeo;

    /**
     * @ORM\OneToOne(targetEntity="AccidenteLaboral", mappedBy="idTrabajador", cascade={"persist", "remove"})
     *
     */
    private $accidente;

    /**
     * @ORM\ManyToMany(targetEntity="AccidenteLaboral", inversedBy="investigador")
     * @ORM\JoinTable(name="accidentelaboral_investigador")
     */
    private $investigador;

    /**
     * @ORM\OneToMany(targetEntity="MediosAsignados", mappedBy="idTrabajador", cascade={"persist", "remove"})
     *
     */
    private $asignacionMedios;

    /**
     * @ORM\OneToMany(targetEntity="PermisosSeguridadTrabajadoresEjecutan", mappedBy="idTrabajador", cascade={"persist", "remove"})
     *
     */
    private $seguridadTrabajador;

    /**
     * @ORM\ManyToOne(targetEntity="Area", inversedBy="trabajador")
     * @ORM\JoinColumn(name="id_area", referencedColumnName="id")
     */
    private $idArea;

    /**
     * @ORM\ManyToOne(targetEntity="Cargo", inversedBy="trabajador")
     * @ORM\JoinColumn(name="id_cargo", referencedColumnName="id")
     */
    private $idCargo;

    /**
     * @ORM\ManyToOne(targetEntity="UnidadOrganizativa", inversedBy="trabajador")
     * @ORM\JoinColumn(name="id_unidad_organizativa", referencedColumnName="id")
     */
    private $idUnidadOrganizativa;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Supervision", mappedBy="trabajadores")
     */
    private $supervisions;

    public function __construct()
    {
        $this->vacunatrabajador = new ArrayCollection();
        $this->asignarmedicamentos = new ArrayCollection();
        $this->espejuelos = new ArrayCollection();
        $this->chequeo = new ArrayCollection();
        $this->investigador = new ArrayCollection();
        $this->asignacionMedios = new ArrayCollection();
        $this->seguridadTrabajador = new ArrayCollection();
        $this->supervisions = new ArrayCollection();
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

    public function getApellidos(): ?string
    {
        return $this->apellidos;
    }

    public function setApellidos(?string $apellidos): self
    {
        $this->apellidos = $apellidos;

        return $this;
    }

    public function getCi(): ?string
    {
        return $this->ci;
    }

    public function setCi(?string $ci): self
    {
        $this->ci = $ci;

        return $this;
    }

    public function getSexo(): ?string
    {
        return $this->sexo;
    }

    public function setSexo(?string $sexo): self
    {
        $this->sexo = $sexo;

        return $this;
    }

    public function getRaza(): ?string
    {
        return $this->raza;
    }

    public function setRaza(?string $raza): self
    {
        $this->raza = $raza;

        return $this;
    }

    public function getNivelEscolar(): ?string
    {
        return $this->nivelEscolar;
    }

    public function setNivelEscolar(?string $nivelEscolar): self
    {
        $this->nivelEscolar = $nivelEscolar;

        return $this;
    }

    public function getNombreTitulo(): ?string
    {
        return $this->nombreTitulo;
    }

    public function setNombreTitulo(?string $nombreTitulo): self
    {
        $this->nombreTitulo = $nombreTitulo;

        return $this;
    }

    public function getAnoGraduacion(): ?int
    {
        return $this->anoGraduacion;
    }

    public function setAnoGraduacion(?int $anoGraduacion): self
    {
        $this->anoGraduacion = $anoGraduacion;

        return $this;
    }

    public function getPcc(): ?int
    {
        return $this->pcc;
    }

    public function setPcc(?int $pcc): self
    {
        $this->pcc = $pcc;

        return $this;
    }

    public function getUjc(): ?int
    {
        return $this->ujc;
    }

    public function setUjc(?int $ujc): self
    {
        $this->ujc = $ujc;

        return $this;
    }

    public function getEstadoCivil(): ?string
    {
        return $this->estadoCivil;
    }

    public function setEstadoCivil(?string $estadoCivil): self
    {
        $this->estadoCivil = $estadoCivil;

        return $this;
    }

    public function getCalleYNumero(): ?string
    {
        return $this->calleYNumero;
    }

    public function setCalleYNumero(?string $calleYNumero): self
    {
        $this->calleYNumero = $calleYNumero;

        return $this;
    }

    public function getEntreCalles(): ?string
    {
        return $this->entreCalles;
    }

    public function setEntreCalles(?string $entreCalles): self
    {
        $this->entreCalles = $entreCalles;

        return $this;
    }

    public function getMunicipio(): ?int
    {
        return $this->municipio;
    }

    public function setMunicipio(?int $municipio): self
    {
        $this->municipio = $municipio;

        return $this;
    }

    public function getDetalles(): ?string
    {
        return $this->detalles;
    }

    public function setDetalles(?string $detalles): self
    {
        $this->detalles = $detalles;

        return $this;
    }

    public function getUbicacionDeLaDefensa(): ?string
    {
        return $this->ubicacionDeLaDefensa;
    }

    public function setUbicacionDeLaDefensa(?string $ubicacionDeLaDefensa): self
    {
        $this->ubicacionDeLaDefensa = $ubicacionDeLaDefensa;

        return $this;
    }

    public function getTotal(): ?float
    {
        return $this->total;
    }

    public function setTotal(?float $total): self
    {
        $this->total = $total;

        return $this;
    }

    public function getMoneda(): ?string
    {
        return $this->moneda;
    }

    public function setMoneda(?string $moneda): self
    {
        $this->moneda = $moneda;

        return $this;
    }

    public function getAreaDePersonal(): ?string
    {
        return $this->areaDePersonal;
    }

    public function setAreaDePersonal(?string $areaDePersonal): self
    {
        $this->areaDePersonal = $areaDePersonal;

        return $this;
    }

    public function getModuloDeRopa(): ?string
    {
        return $this->moduloDeRopa;
    }

    public function setModuloDeRopa(?string $moduloDeRopa): self
    {
        $this->moduloDeRopa = $moduloDeRopa;

        return $this;
    }

    public function getTitulo(): ?string
    {
        return $this->titulo;
    }

    public function setTitulo(?string $titulo): self
    {
        $this->titulo = $titulo;

        return $this;
    }

    public function getSubdivisionPersonal(): ?string
    {
        return $this->subdivisionPersonal;
    }

    public function setSubdivisionPersonal(?string $subdivisionPersonal): self
    {
        $this->subdivisionPersonal = $subdivisionPersonal;

        return $this;
    }

    public function getNumeroPersona(): ?int
    {
        return $this->numeroPersona;
    }

    public function setNumeroPersona(?int $numeroPersona): self
    {
        $this->numeroPersona = $numeroPersona;

        return $this;
    }

    public function getClaseDeContrato(): ?string
    {
        return $this->claseDeContrato;
    }

    public function setClaseDeContrato(?string $claseDeContrato): self
    {
        $this->claseDeContrato = $claseDeContrato;

        return $this;
    }

    public function getSegundoApellido(): ?string
    {
        return $this->segundoApellido;
    }

    public function setSegundoApellido(?string $segundoApellido): self
    {
        $this->segundoApellido = $segundoApellido;

        return $this;
    }

    public function getTiempoRestanteChequeo(): ?string
    {
        return $this->tiempoRestanteChequeo;
    }

    public function setTiempoRestanteChequeo(?string $tiempoRestanteChequeo): self
    {
        $this->tiempoRestanteChequeo = $tiempoRestanteChequeo;

        return $this;
    }

    /**
     * @return Collection|VacunaTrabajador[]
     */
    public function getVacunatrabajador(): Collection
    {
        return $this->vacunatrabajador;
    }

    public function addVacunatrabajador(VacunaTrabajador $vacunatrabajador): self
    {
        if (!$this->vacunatrabajador->contains($vacunatrabajador)) {
            $this->vacunatrabajador[] = $vacunatrabajador;
            $vacunatrabajador->setIdTrabajador($this);
        }

        return $this;
    }

    public function removeVacunatrabajador(VacunaTrabajador $vacunatrabajador): self
    {
        if ($this->vacunatrabajador->contains($vacunatrabajador)) {
            $this->vacunatrabajador->removeElement($vacunatrabajador);
            // set the owning side to null (unless already changed)
            if ($vacunatrabajador->getIdTrabajador() === $this) {
                $vacunatrabajador->setIdTrabajador(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|AsignarMedicamento[]
     */
    public function getAsignarmedicamentos(): Collection
    {
        return $this->asignarmedicamentos;
    }

    public function addAsignarmedicamento(AsignarMedicamento $asignarmedicamento): self
    {
        if (!$this->asignarmedicamentos->contains($asignarmedicamento)) {
            $this->asignarmedicamentos[] = $asignarmedicamento;
            $asignarmedicamento->setIdTrabajador($this);
        }

        return $this;
    }

    public function removeAsignarmedicamento(AsignarMedicamento $asignarmedicamento): self
    {
        if ($this->asignarmedicamentos->contains($asignarmedicamento)) {
            $this->asignarmedicamentos->removeElement($asignarmedicamento);
            // set the owning side to null (unless already changed)
            if ($asignarmedicamento->getIdTrabajador() === $this) {
                $asignarmedicamento->setIdTrabajador(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|EntregaEspejuelo[]
     */
    public function getEspejuelos(): Collection
    {
        return $this->espejuelos;
    }

    public function addEspejuelo(EntregaEspejuelo $espejuelo): self
    {
        if (!$this->espejuelos->contains($espejuelo)) {
            $this->espejuelos[] = $espejuelo;
            $espejuelo->setIdTrabajador($this);
        }

        return $this;
    }

    public function removeEspejuelo(EntregaEspejuelo $espejuelo): self
    {
        if ($this->espejuelos->contains($espejuelo)) {
            $this->espejuelos->removeElement($espejuelo);
            // set the owning side to null (unless already changed)
            if ($espejuelo->getIdTrabajador() === $this) {
                $espejuelo->setIdTrabajador(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|ChequeoMedico[]
     */
    public function getChequeo(): Collection
    {
        return $this->chequeo;
    }

    public function addChequeo(ChequeoMedico $chequeo): self
    {
        if (!$this->chequeo->contains($chequeo)) {
            $this->chequeo[] = $chequeo;
            $chequeo->setIdTrabajador($this);
        }

        return $this;
    }

    public function removeChequeo(ChequeoMedico $chequeo): self
    {
        if ($this->chequeo->contains($chequeo)) {
            $this->chequeo->removeElement($chequeo);
            // set the owning side to null (unless already changed)
            if ($chequeo->getIdTrabajador() === $this) {
                $chequeo->setIdTrabajador(null);
            }
        }

        return $this;
    }

    public function getAccidente(): ?AccidenteLaboral
    {
        return $this->accidente;
    }

    public function setAccidente(?AccidenteLaboral $accidente): self
    {
        $this->accidente = $accidente;

        // set (or unset) the owning side of the relation if necessary
        $newIdTrabajador = null === $accidente ? null : $this;
        if ($accidente->getIdTrabajador() !== $newIdTrabajador) {
            $accidente->setIdTrabajador($newIdTrabajador);
        }

        return $this;
    }

    /**
     * @return Collection|AccidenteLaboral[]
     */
    public function getInvestigador(): Collection
    {
        return $this->investigador;
    }

    public function addInvestigador(AccidenteLaboral $investigador): self
    {
        if (!$this->investigador->contains($investigador)) {
            $this->investigador[] = $investigador;
        }

        return $this;
    }

    public function removeInvestigador(AccidenteLaboral $investigador): self
    {
        if ($this->investigador->contains($investigador)) {
            $this->investigador->removeElement($investigador);
        }

        return $this;
    }

    /**
     * @return Collection|MediosAsignados[]
     */
    public function getAsignacionMedios(): Collection
    {
        return $this->asignacionMedios;
    }

    public function addAsignacionMedio(MediosAsignados $asignacionMedio): self
    {
        if (!$this->asignacionMedios->contains($asignacionMedio)) {
            $this->asignacionMedios[] = $asignacionMedio;
            $asignacionMedio->setIdTrabajador($this);
        }

        return $this;
    }

    public function removeAsignacionMedio(MediosAsignados $asignacionMedio): self
    {
        if ($this->asignacionMedios->contains($asignacionMedio)) {
            $this->asignacionMedios->removeElement($asignacionMedio);
            // set the owning side to null (unless already changed)
            if ($asignacionMedio->getIdTrabajador() === $this) {
                $asignacionMedio->setIdTrabajador(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|PermisosSeguridadTrabajadoresEjecutan[]
     */
    public function getSeguridadTrabajador(): Collection
    {
        return $this->seguridadTrabajador;
    }

    public function addSeguridadTrabajador(PermisosSeguridadTrabajadoresEjecutan $seguridadTrabajador): self
    {
        if (!$this->seguridadTrabajador->contains($seguridadTrabajador)) {
            $this->seguridadTrabajador[] = $seguridadTrabajador;
            $seguridadTrabajador->setIdTrabajador($this);
        }

        return $this;
    }

    public function removeSeguridadTrabajador(PermisosSeguridadTrabajadoresEjecutan $seguridadTrabajador): self
    {
        if ($this->seguridadTrabajador->contains($seguridadTrabajador)) {
            $this->seguridadTrabajador->removeElement($seguridadTrabajador);
            // set the owning side to null (unless already changed)
            if ($seguridadTrabajador->getIdTrabajador() === $this) {
                $seguridadTrabajador->setIdTrabajador(null);
            }
        }

        return $this;
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

    public function getIdCargo(): ?Cargo
    {
        return $this->idCargo;
    }

    public function setIdCargo(?Cargo $idCargo): self
    {
        $this->idCargo = $idCargo;

        return $this;
    }

    public function getIdUnidadOrganizativa(): ?UnidadOrganizativa
    {
        return $this->idUnidadOrganizativa;
    }

    public function setIdUnidadOrganizativa(?UnidadOrganizativa $idUnidadOrganizativa): self
    {
        $this->idUnidadOrganizativa = $idUnidadOrganizativa;

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
            $supervision->addTrabajadore($this);
        }

        return $this;
    }

    public function removeSupervision(Supervision $supervision): self
    {
        if ($this->supervisions->contains($supervision)) {
            $this->supervisions->removeElement($supervision);
            $supervision->removeTrabajadore($this);
        }

        return $this;
    }



}
