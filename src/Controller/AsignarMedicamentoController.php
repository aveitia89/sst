<?php

namespace App\Controller;

use App\Entity\AsignarMedicamento;
use App\Entity\Medicamento;
use App\Entity\Trabajador;
use App\Entity\Traza;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Asignarmedicamento controller.
 *
 * @Route("tecnico/asignarmedicamento")
 */
class AsignarMedicamentoController extends AbstractController {

    /**
     * @Route("/", name="asignarmedicamento")
     */
    public function asignarmedicamento() {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre'=>'ASC']);
        $medicamentos = $em->getRepository(Medicamento::class)->findAll();
        return $this->render('medicamentos/asignarMedicamentos.html.twig', array(
            'trabajadores' => $trabajadores,
            'medicamentos' => $medicamentos,
        ));
    }
    /**
     * @Route("/ajax", name="asignarmedicamentoAjax")
     */
    public function asignarmedicamentoAjax() {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT m FROM App\Entity\AsignarMedicamento m
         INNER JOIN App\Entity\Trabajador t WITH m.idTrabajador =
          t.id WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $medicamentos=$consulta->getResult();
        $trabajadores = $em->getRepository(AsignarMedicamento::class)->findBy([],['id'=>'DESC']);
        return $this->render('medicamentos/asignarMedicamentosAjax.html.twig', array(
            'medtrabajadores' => $medicamentos,
            'medTrab'=>$trabajadores,
        ));
    }
    /**
     * @Route("/registrar/{idtrabajador}/{idmedicamento}/{fecha}/{cantidad}/{orden}", name="asignarMT")
     */
    public function asignarMT($idtrabajador,$idmedicamento,$fecha,$cantidad)
    {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $medicamentos = $em->getRepository(Medicamento::class)->find($idmedicamento);
        $asignarMedicamento = new AsignarMedicamento();
        $asignarMedicamento->setIdTrabajador($trabajadores);
        $asignarMedicamento->setIdMedicamento($medicamentos);
        $asignarMedicamento->setFecha(new \DateTime($fecha));
        $asignarMedicamento->setCantidad($cantidad);
//        $asignarMedicamento->setOrden($orden);
        $em->persist($asignarMedicamento);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nueva asignación de Medicamento: '.$trabajadores->getNombre()." ".$trabajadores->getApellidos()." ".$trabajadores->getSegundoApellido(),$em);
        return $this->redirect($this->generateUrl('asignarmedicamentoAjax'));
    }
    /**
     * @Route("/eliminar/asginarmed/{id}", name="eliminarAsigMed")
     */
    public function eliminarAsigMed($id)
    {
        $em = $this->getDoctrine()->getManager();
        $chequeo = $em->getRepository(AsignarMedicamento::class)->find($id);
        $em->remove($chequeo);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino asignación de Medicamento: ',$em);
        return $this->redirect($this->generateUrl('asignarmedicamentoAjax'));
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
