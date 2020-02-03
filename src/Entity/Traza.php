<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TrazaRepository")
 */
class Traza
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
    private $accion;

    /**
     * @ORM\Column(type="datetime")
     */
    private $fecha;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $ip;

    /**
     * @ORM\ManyToOne(targetEntity="Usuario", inversedBy="traza")
     * @ORM\JoinColumn(name="id_usuario", referencedColumnName="id")
     */
    private $idUsuario;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAccion(): ?string
    {
        return $this->accion;
    }

    public function setAccion(?string $accion): self
    {
        $this->accion = $accion;

        return $this;
    }

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(\DateTimeInterface $fecha): self
    {
        $this->fecha = $fecha;

        return $this;
    }

    public function getIp(): ?string
    {
        return $this->ip;
    }

    public function setIp(?string $ip): self
    {
        $this->ip = $ip;

        return $this;
    }

    public function getIdUsuario(): ?Usuario
    {
        return $this->idUsuario;
    }

    public function setIdUsuario(?Usuario $idUsuario): self
    {
        $this->idUsuario = $idUsuario;

        return $this;
    }

    public static function save($usuario, $accion, $em) {
        $hoy = new \DateTime();
        $ip = "";
        //$user = 1;
        $traza = new Traza();
        $traza->setAccion($accion);
        $traza->setFecha($hoy);
        $traza->setIdUsuario($usuario);
        $traza->setIp($ip);
        //print_r($accion);
        //die;
        //$em = self::getDoctrine()->getManager();
        $em->persist($traza);
        $em->flush();
    }

}
