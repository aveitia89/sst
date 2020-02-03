<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UsuarioRepository")
 */
class Usuario implements UserInterface
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
    private $usuario;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $pass;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $correo;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $nombre;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $rol;

    /**
     * @ORM\ManyToOne(targetEntity="Area", inversedBy="usuario")
     * @ORM\JoinColumn(name="id_area", referencedColumnName="id")
     */
    private $idArea;

    /**
     * @ORM\OneToMany(targetEntity="Traza", mappedBy="idUsuario", cascade={"persist", "remove"})
     *
     */
    private $traza;

    public function __construct()
    {
        $this->traza = new ArrayCollection();
    }

    /**
     * Returns the roles granted to the user.
     *
     *     public function getRoles()
     *     {
     *         return ['ROLE_USER'];
     *     }
     *
     * Alternatively, the roles might be stored on a ``roles`` property,
     * and populated in any number of different ways when the user object
     * is created.
     *
     * @return (Role|string)[] The user roles
     */
    public function getRoles()
    {
        // TODO: Implement getRoles() method.
        if($this->getRol() == 'Administrador')
        {
            return array('ROLE_ADMIN');
        }
        elseif($this->getRol() == 'Especialista')
        {
            return array('ROLE_ESPECIALISTA');
        }
        elseif($this->getRol() == 'Técnico')
        {
            return array('ROLE_TECNICO');
        }
        elseif($this->getRol() == 'Jefe Brigada')
        {
            return array('ROLE_JEFEBRIGADA');
        }
        elseif($this->getRol() == 'Jefe Operaciones')
        {
            return array('ROLE_JEFEOPERACIONES');
        }
        elseif($this->getRol() == 'Usuario')
        {
            return array('ROLE_OBSERVADOR');
        }
    }

    /**
     * Returns the password used to authenticate the user.
     *
     * This should be the encoded password. On authentication, a plain-text
     * password will be salted, encoded, and then compared to this value.
     *
     * @return string|null The encoded password if any
     */
    public function getPassword()
    {
        // TODO: Implement getPassword() method.
        return $this->getPass();
    }

    /**
     * Returns the salt that was originally used to encode the password.
     *
     * This can return null if the password was not encoded using a salt.
     *
     * @return string|null The salt
     */
    public function getSalt()
    {
        // TODO: Implement getSalt() method.
    }

    /**
     * Returns the username used to authenticate the user.
     *
     * @return string The username
     */
    public function getUsername()
    {
        // TODO: Implement getUsername() method.
        return $this->getUsuario();
    }

    /**
     * Removes sensitive data from the user.
     *
     * This is important if, at any given point, sensitive information like
     * the plain-text password is stored on this object.
     */
    public function eraseCredentials()
    {
        // TODO: Implement eraseCredentials() method.
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsuario(): ?string
    {
        return $this->usuario;
    }

    public function setUsuario(?string $usuario): self
    {
        $this->usuario = $usuario;

        return $this;
    }

    public function getPass(): ?string
    {
        return $this->pass;
    }

    public function setPass(?string $pass): self
    {
        $this->pass = $pass;

        return $this;
    }

    public function getCorreo(): ?string
    {
        return $this->correo;
    }

    public function setCorreo(?string $correo): self
    {
        $this->correo = $correo;

        return $this;
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

    public function getRol(): ?string
    {
        return $this->rol;
    }

    public function setRol(?string $rol): self
    {
        $this->rol = $rol;

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

    /**
     * @return Collection|Traza[]
     */
    public function getTraza(): Collection
    {
        return $this->traza;
    }

    public function addTraza(Traza $traza): self
    {
        if (!$this->traza->contains($traza)) {
            $this->traza[] = $traza;
            $traza->setIdUsuario($this);
        }

        return $this;
    }

    public function removeTraza(Traza $traza): self
    {
        if ($this->traza->contains($traza)) {
            $this->traza->removeElement($traza);
            // set the owning side to null (unless already changed)
            if ($traza->getIdUsuario() === $this) {
                $traza->setIdUsuario(null);
            }
        }

        return $this;
    }
}
