<?php

namespace App\Controller;

use App\Entity\Area;
use App\Entity\Traza;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 * Usuario controller.
 *
 * @Route("admin")
 */
class UsuarioController extends AbstractController {

    /**
     * @Route("/", name="usuario")
     */
    public function usuario() {
        $em = $this->getDoctrine()->getManager();
        $centro = $em->getRepository(Area::class)->findAll();
        return $this->render('usuario/usuarioR.html.twig',[
            'centro' => $centro,
        ]);
    }
    /**
     * @Route("/ajax", name="usuarioAjax")
     */
    public function usuarioAjax() {
        $em = $this->getDoctrine()->getManager();
        $usuarios = $em->getRepository(Usuario::class)->findBy([],['id'=>'DESC']);
        $centro = $em->getRepository(Area::class)->findAll();
        return $this->render('usuario/usuarioAjaxR.html.twig', [
            'user' => $usuarios,
            'centro' => $centro,
        ]);
    }
    /**
     * @Route("/crearUser/{nombre}/{usuario}/{correo}/{pass}/{rol}/{area}", name="crearUser")
     */
    public function crearUser(UserPasswordEncoderInterface $passwordEncoder,$nombre,$usuario,$correo,$pass,$rol,$area)
    {
        $bd = $this->getDoctrine()->getManager();
        $centro = $bd->getRepository(Area::class)->findOneBy(['id' => $area]);
        $gest = new Usuario();
        $gest->setNombre($nombre);
        $gest->setUsuario($usuario);
        $gest->setRol($rol);
        $gest->setCorreo($correo);
        $gest->setIdArea($centro);
        $gest->setPass($passwordEncoder->encodePassword($gest,$pass));

        $bd->persist($gest);
        $bd->flush();
        Traza::save($this->userTraza(),'Crear Usuario',$bd);

        return $this->redirect($this->generateUrl('usuarioAjax'));
    }
    /**
     * @Route("/editarUser", name="editarUser")
     */
    public function editarUser(UserPasswordEncoderInterface $passwordEncoder)
    {
        $nombre = $_POST['nombre'];
        $usuario = $_POST['usuario'];
        $rol = $_POST['rol'];
        $area = $_POST['centro'];
        $pass = $_POST['pass'];
        $correo = $_POST['email'];
        $bd = $this->getDoctrine()->getManager();
        $user = $bd->getRepository(Usuario::class)->findOneBy(['usuario' => $usuario]);
        if ($pass != "") {
            $user->setNombre($nombre);
            $user->setUsuario($usuario);
            $user->setRol($rol);
            $centro = $bd->getRepository(Area::class)->findOneBy(['id' => $area]);
            $user->setIdArea($centro);
            $user->setCorreo($correo);
            $user->setPass($passwordEncoder->encodePassword($user,$pass));
            $bd->persist($user);
        } else {
            $user->setNombre($nombre);
            $user->setUsuario($usuario);
            $user->setRol($rol);
            $centro = $bd->getRepository(Area::class)->findOneBy(['id' => $area]);
            $user->setIdArea($centro);
            $user->setCorreo($correo);
            $bd->persist($user);
        }
        $bd->flush();
        Traza::save($this->userTraza(),'Modificar Usuario',$bd);
        return $this->redirect($this->generateUrl('usuario'));
    }
    /**
     * @Route("/eliminarUser/{id}", name="eliminarUser")
     */
    public function eliminarUser($id)
    {
        $bd = $this->getDoctrine()->getManager();
        $user = $bd->getRepository(Usuario::class)->findOneBy(['id' => $id]);
        $bd->remove($user);
        $bd->flush();
        Traza::save($this->userTraza(),'Eliminar Usuario',$bd);
        return $this->redirect($this->generateUrl('usuarioAjax'));
    }
    public function userTraza()
    {
        $username = $this->getUser();
        if($username != null    )
        {
            return $usuario = $this->getUsuario($username->getId());
        }
        else
        {
            return $this->redirect($this->generateUrl('login'));
        }
    }
    public function getUsuario($id) {
        $em = $this->getDoctrine()->getManager();
        return $em->getRepository(Usuario::class)->findOneBy(array("id" => $id));
    }
    /**
     * @Route("/traza/{idusuario}", name="TrazaUser")
     */
    public function TrazaUser($idusuario)
    {
        $bd = $this->getDoctrine()->getManager();
        $traza = $bd->getRepository(Traza::class)->findBy(['idUsuario' => $idusuario]);
        return $this->render('nomencladores/trazas.html.twig', [
            'trazas' => $traza,
        ]);
    }
    public function getIdAreaUsuario()
    {
        $em = $this->getDoctrine()->getManager();
        $username = $this->getUser();
        $usuario = $em->getRepository(Usuario::class)->find($username->getId());
        return $usuario->getIdArea()->getId();
    }
}
