<?php

namespace App\Controller;

use App\Entity\MedidasSeguridad;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Medidasseguridad controller.
 *
 * @Route("tecnico/medidasseguridad")
 */
class MedidasSeguridadController extends AbstractController
{
    /**
     * @Route("/", name="medidasseguridad_index")
     */
    public function medidasseguridad_index()
    {
        /*$em = $this->getDoctrine()->getManager();

        $medidasSeguridads = $em->getRepository(MedidasSeguridad::class)->findAll();

        return $this->render('medidasseguridad/permisoSeguridad.html.twig', array(
            'medidasSeguridads' => $medidasSeguridads,
        ));*/
    }
}
