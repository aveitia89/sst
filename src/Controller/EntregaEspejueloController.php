<?php

namespace App\Controller;

use App\Entity\Trabajador;
use App\Entity\Area;
use App\Entity\EntregaEspejuelo;
use App\Entity\Traza;
use App\Entity\Usuario;
use App\Entity\UnidadOrganizativa;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Entrega espejuelos controller.
 *
 * @Route("tecnico/entregaespejuelo")
 */
class EntregaEspejueloController extends AbstractController {

    /**
     * @Route("/", name="entregaespejuelo")
     */
    public function entregaespejuelo() {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['claseDeContrato'=>'Indeterminado','idArea' => $this->getIdAreaUsuario()],['nombre'=>'ASC']);
        $unidadOrganizativa = $em->getRepository(UnidadOrganizativa::class)->findAll();
        return $this->render('entregaespejuelo/entregaespejuelos.html.twig', [
            'trabajador' => $trabajadores,
            'unidadOrganizativa' => $unidadOrganizativa,
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

    /**
     * @Route("/ajax", name="entregaespejueloAjax")
     */
    public function entregaespejueloAjax() {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT ee FROM App\Entity\EntregaEspejuelo ee
         INNER JOIN App\Entity\Trabajador t WITH ee.idTrabajador =
          t.id WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $entregaEspejuelos=$consulta->getResult();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['claseDeContrato'=>'Indeterminado'],['nombre'=>'ASC']);
        return $this->render('entregaespejuelo/entregaespejuelosAjax.html.twig', array(
            'entregaEspejuelos' => $entregaEspejuelos,
            'espejuelos' => $trabajadores,
        ));
    }

    /**
     * @Route("/entrega/ajax/{idtrabajador}/{fechaCompra}/{costo}/{cheque}/{fechaEconomia}/{respaldoP}/{consejoD}", name="entrega")
     */
    public function entrega($idtrabajador,$fechaCompra,$costo,$cheque,$fechaEconomia,$respaldoP,$consejoD)
    {
        $em = $this->getDoctrine()->getManager();
        $trabajador = $em->getRepository(Trabajador::class)->find($idtrabajador);
        $entrega = new EntregaEspejuelo();
        $entrega->setIdTrabajador($trabajador);
        $entrega->setFechaCompra(new \DateTime($fechaCompra));
        $entrega->setCosto($costo);
        $entrega->setCheque($cheque);
        $entrega->setFechaRecibeEconomia(new \DateTime($fechaEconomia));
        if ($respaldoP == "true")
        {
            $entrega->setRespaldadoPolitica(true);
        }
        else
        {
            $entrega->setRespaldadoPolitica(false);
        }
        if ($consejoD == "true")
        {
            $entrega->setAprobacionConsejo(true);
        }
        else
        {
            $entrega->setAprobacionConsejo(false);
        }
        $em->persist($entrega);
        $em->flush();
        Traza::save($this->userTraza(),'Registro entrega de espejuelos '.$trabajador->getNombre()." ".$trabajador->getApellidos()." ".$trabajador->getSegundoApellido(),$em);
        return $this->redirect($this->generateUrl('entregaespejueloAjax'));
    }
    /**
     * @Route("/eliminar/{id}", name="eliminarEntrega")
     */
    public function eliminarEntrega($id)
    {
        $em = $this->getDoctrine()->getManager();
        $entregaEspejuelos = $em->getRepository(EntregaEspejuelo::class)->find($id);
        $em->remove($entregaEspejuelos);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino una entrega de espejuelos',$em);
        return $this->redirect($this->generateUrl('entregaespejueloAjax'));
    }

    /**
     * @Route("/ver/entrega/{iduo}/{fecha}", name="verEntrega")
     */
    public function verEntrega($iduo,$fecha)
    {
        $fech = new \DateTime($fecha);
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT ee FROM  App\Entity\EntregaEspejuelo ee
                INNER JOIN App\Entity\Trabajador t WITH ee.idTrabajador = t.id  
                INNER JOIN App\Entity\UnidadOrganizativa uo WITH t.idUnidadOrganizativa = uo.id
                WHERE uo.id = ".$iduo." AND ee.fechaCompra = '".$fech->format('Y-m-d')."' ";
        $consulta = $em->createQuery($sql);
        $entregaEspejuelos = $consulta->getResult();
        return $this->render('entregaespejuelo/entregaespejuelosAjax.html.twig', array(
            'entregaEspejuelos' => $entregaEspejuelos,
        ));
    }
    public function getIdAreaUsuario()
    {
        $em = $this->getDoctrine()->getManager();
        $username = $this->getUser();
        $usuario = $em->getRepository(Usuario::class)->find($username->getId());
        return $usuario->getIdArea()->getId();
    }
}
