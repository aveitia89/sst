<?php

namespace App\Controller;

use App\Entity\Trabajador;
use App\Entity\Traza;
use App\Entity\Usuario;
use App\Entity\Vacuna;
use App\Entity\VacunaTrabajador;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Vacuna controller.
 *
 * @Route("tecnico/vacuna")
 */
class VacunaController extends AbstractController {

    /**
     * @Route("/", name="vacunas")
     */
    public function vacunas() {
        return $this->render('vacuna/vacuna.html.twig');
    }
    /**
     * @Route("/ajax", name="vacunaAjax")
     */
    public function vacunaAjax() {
        $em = $this->getDoctrine()->getManager();
        $vacunas = $em->getRepository(Vacuna::class)->findBy([],['id'=>'DESC']);
        return $this->render('vacuna/vacunaAjax.html.twig', array(
            'vacuna' => $vacunas,
        ));
    }
    /**
     * @Route("/insertar/{nombre}", name="vacunasInsertar")
     */
    public function vacunasInsertar($nombre) {
        $em = $this->getDoctrine()->getManager();
        $vacunas = new Vacuna();
        $vacunas->setNombreVacuna($nombre);
        $em->persist($vacunas);
        $em->flush();
        Traza::save($this->userTraza(),'Inserto nueva vacuna: '.$vacunas->getNombreVacuna(),$em );
        return $this->redirect($this->generateUrl('vacunaAjax'));
    }
    /**
     * @Route("/editar/{id}/{nombre}", name="vacunasEditar")
     */
    public function vacunasEditar($id,$nombre) {
        $em = $this->getDoctrine()->getManager();
        $vacunas = $em->getRepository(Vacuna::class)->findOneBy(['id' => $id]);
        $vacunas->setNombreVacuna($nombre);
        $em->persist($vacunas);
        $em->flush();
        Traza::save($this->userTraza(),'Edito vacuna: '.$vacunas->getNombreVacuna(),$em );
        return $this->redirect($this->generateUrl('vacunaAjax'));
    }
    /**
     * @Route("/editar/{id}", name="vacunasEliminar")
     */
    public function vacunasEliminar($id) {
        $em = $this->getDoctrine()->getManager();
        $vacunas = $em->getRepository(Vacuna::class)->findOneBy(['id' => $id]);
        $em->remove($vacunas);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino vacuna: '.$vacunas->getNombreVacuna(),$em );
        return $this->redirect($this->generateUrl('vacunaAjax'));
    }
    /**
     * @Route("/control", name="controlVacunacion")
     */
    public function controlVacunacion()
    {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre'=>'ASC']);
        $vacunas = $em->getRepository(Vacuna::class)->findAll();
        return $this->render('vacuna/registrarV.html.twig',[
            "trabajadores" => $trabajadores,
            'vacunas' => $vacunas,
        ]);
    }
    /**
     * @Route("/vacunacion/ajax", name="controlVAjax")
     */
    public function controlVAjax() {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT vt FROM App\Entity\VacunaTrabajador vt
         INNER JOIN App\Entity\Trabajador t WITH vt.idTrabajador =
          t.id WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        //$vacunas = $em->getRepository(Vacuna::class)->findAll();
        $consulta = $em->createQuery($sql);
        $vacunas=$consulta->getResult();
         $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre'=>'ASC']);
        return $this->render('vacuna/registrarVAjax.html.twig', array(
            'vacunasTrabajador' => $vacunas,
            'vacunas'=> $trabajadores,



        ));
    }
    /**
     * @Route("/asignar/vacunas/{idtrabajador}/{idvacuna}/{fecha}", name="registrarVtrabajador")
     */
    public function registrarVtrabajador($idtrabajador,$idvacuna,$fecha)
    {
        $em = $this->getDoctrine()->getManager();
        $trabajador = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $vacuna = $em->getRepository(Vacuna::class)->find($idvacuna);
        $fech = new \DateTime($fecha);
        $cargo = $trabajador->getIdCargo();
        $trabajadorVacuna = new VacunaTrabajador();
        $trabajadorVacuna->setIdTrabajador($trabajador);
        $trabajadorVacuna->setIdVacuna($vacuna);
        $trabajadorVacuna->setFecha($fech);
        $trabajadorVacuna->setIdCargo($cargo);
        $em->persist($trabajadorVacuna);
        $em->flush();
        Traza::save($this->userTraza(),'Registro vacunación del trabajador: '.$trabajador->getNombre()." ".$trabajador->getApellidos()." ".$trabajador->getSegundoApellido(),$em );
        return $this->redirect($this->generateUrl('controlVAjax'));
    }

    /**
     * @Route("/eliminar/vacuna/trabajador/{id}", name="eliminarVacunaTrabajador")
     */
    public function eliminarVacunaTrabajador($id)
    {
        $em = $this->getDoctrine()->getManager();
        $chequeo = $em->getRepository(VacunaTrabajador::class)->find($id);
        $em->remove($chequeo);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino vacunación del trabajador: '.$chequeo->getidTrabajador(),$em );
        return $this->redirect($this->generateUrl('controlVAjax'));
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
