<?php

namespace App\Controller;

use App\Entity\Area;
use App\Entity\Traza;
use App\Entity\UnidadOrganizativa;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class UnidadOrganizativaController extends AbstractController
{
    /**
     * @Route("especialista/unidad/organizativa", name="unidad_organizativa")
     */
    public function index()
    {
        $em = $this->getDoctrine()->getManager();
        return $this->render('unidad_organizativa/unidadOR.html.twig', []);
    }
    /**
     * @Route("especialista/unidad/organizativa/ajax", name="unidadOAjax")
     */
    public function unidadOAjax()
    {
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->findBy([],['id' => 'ASC']);
        $unidadO = $em->getRepository(UnidadOrganizativa::class)->findBy([],['id' => 'ASC']);

        return $this->render('unidad_organizativa/uoAjaxR.html.twig', [
            'area' => $area,
            'unidadO' => $unidadO
        ]);
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
     * @Route("especialista/insertar/{nombre}", name="uoInsertar")
     */
    public function uoInsertar($nombre) {
        $em = $this->getDoctrine()->getManager();
        $uo = new UnidadOrganizativa();
        $uo->setNombre($nombre);
        $em->persist($uo);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nueva unidad organizativa: '.$uo->getNombre(),$em);
        return $this->redirect($this->generateUrl('unidadOAjax'));
    }
    /**
     * @Route("especialista/editar/{id}/{nombre}", name="uoEditar")
     */
    public function uoEditar($id,$nombre) {
        $em = $this->getDoctrine()->getManager();
        $uo = $em->getRepository(UnidadOrganizativa::class)->findOneBy(['id' => $id]);
        $uo->setNombre($nombre);
        $em->persist($uo);
        $em->flush();
        Traza::save($this->userTraza(),'Edito la unidad organizativa: '.$uo->getNombre(),$em);
        return $this->redirect($this->generateUrl('unidadOAjax'));
    }
    /**
     * @Route("especialista/editar/{id}", name="uoEliminar")
     */
    public function uoEliminar($id) {
        $em = $this->getDoctrine()->getManager();
        $uo = $em->getRepository(UnidadOrganizativa::class)->findOneBy(['id' => $id]);
        $em->remove($uo);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino la unidad organizativa'.$uo->getNombre(),$em);
        return $this->redirect($this->generateUrl('unidadOAjax'));
    }
    public function getIdAreaUsuario()
    {
        $em = $this->getDoctrine()->getManager();
        $username = $this->getUser();
        $usuario = $em->getRepository(Usuario::class)->find($username->getId());
        return $usuario->getIdArea()->getId();
    }
}
