<?php

namespace App\Controller;

use App\Entity\Area;
use App\Entity\LugarEjecucionPermiso;
use App\Entity\PermisoSeguridad;
use App\Entity\PermisosSeguridadTrabajadoresEjecutan;
use App\Entity\Trabajador;
use App\Entity\MedidasSeguridad;
use App\Entity\TrabajadorEscala;
use App\Entity\Traza;
use App\Entity\Usuario;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Writer\Pdf\Dompdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\Time;

/**
 * Permisoseguridad controller.
 * @Route("usuario/permisoseguridad")
 */
class PermisoSeguridadController extends AbstractController {

    /**
     * @Route("/", name="permisoseguridad")
     */
    public function permisoseguridad()
    {
        $em = $this->getDoctrine()->getManager();
        $permisoSeguridads = $em->getRepository(PermisoSeguridad::class)->findBy([],['id'=>'DESC']);
        $trabajadorOrdena = $this->cargoOrdena();
        $trabajadorEmite = $this->cargoEmite();
        $trabajadorEjecuta = $this->cargoEjecuta();
        $unidadOrganizativa  = $em->getRepository(Area::class)->findAll();
        $medidas = $em->getRepository(MedidasSeguridad::class)->findAll();
        $lugarEjecucion = $em->getRepository(LugarEjecucionPermiso::class)->findAll();
        return $this->render('permisoseguridad/permisoSeguridadR.html.twig', array(
            'permisoSeguridads' => $permisoSeguridads,
            'rabajadorOrdena' => $trabajadorOrdena,
            'trabajadorEmite' => $trabajadorEmite,
            'trabajadorEjecuta' => $trabajadorEjecuta,
            'medidasSeguridad' => $medidas,
            'unidadOrganizativa' => $unidadOrganizativa,
            'lugarEjecucion' => $lugarEjecucion,
        ));
    }
    public function cargoOrdena()
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT t FROM App\Entity\Trabajador t                
                WHERE t.idCargo = 1 AND t.idArea = ".$this->getIdAreaUsuario()." 
                OR t.idCargo = 33 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 34 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 35 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 36 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 37 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 38 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 39 AND t.idArea = ".$this->getIdAreaUsuario()."
                ORDER BY t.nombre ASC ";
        $consulta = $em->createQuery($sql);
        $trabajadores = $consulta->getResult();
        return $trabajadores;
    }
    public function cargoEmite()
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT t FROM App\Entity\Trabajador t                
                WHERE t.idCargo = 47 AND t.idArea = ".$this->getIdAreaUsuario()." 
                OR t.idCargo = 53 AND t.idArea = ".$this->getIdAreaUsuario()." 
                OR t.idCargo = 57 AND t.idArea = ".$this->getIdAreaUsuario()." 
                OR t.idCargo = 60 AND t.idArea = ".$this->getIdAreaUsuario()."
                ORDER BY t.nombre ASC ";
        $consulta = $em->createQuery($sql);
        $trabajadores = $consulta->getResult();
        return $trabajadores;
    }
    public function cargoEjecuta()
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT t FROM App\Entity\Trabajador t                
                WHERE t.idCargo = 46 AND t.idArea = ".$this->getIdAreaUsuario()." 
                OR t.idCargo = 48 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 52 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 54 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 55 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 56 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 58 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 59 AND t.idArea = ".$this->getIdAreaUsuario()."
                OR t.idCargo = 61 AND t.idArea = ".$this->getIdAreaUsuario()."                           
                ORDER BY t.nombre ASC ";
        $consulta = $em->createQuery($sql);
        $trabajadores = $consulta->getResult();
        return $trabajadores;
    }
    /**
     * @Route("/ajax", name="permisoseguridadAjax")
     */
    public function permisoseguridadAjax() {
        $em = $this->getDoctrine()->getManager();
        //$permisoSeguridads = $em->getRepository(PermisoSeguridad::class)->findBy([],['id'=>'DESC']);
        $sql = "SELECT ps FROM App\Entity\PermisoSeguridad ps
            INNER JOIN App\Entity\PermisosSeguridadTrabajadoresEjecutan pst WITH pst.idPermisosSeguridad = ps.id
            INNER JOIN App\Entity\Trabajador t WITH pst.idTrabajador = t.id 
            WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $permisos=$consulta->getResult();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()],['nombre'=>'ASC']);
        return $this->render('permisoseguridad/permisoseguridadAjax.html.twig', array(
            'permisoSeguridads' => $permisos,
            'permiso' => $trabajadores,
        ));
    }
    /**
     * @Route("/insertar/{orden}/{lugar}/{descripcion}/{fecha}/{horarioInicio}/{horarioFin}/{idordena}/{idemite}/{idejecuta}", name="Insertarpermisoseguridad")
     */
    public function Insertarpermisoseguridad($orden,$lugar,$descripcion,$fecha,$horarioInicio,$horarioFin,$idordena,$idemite,$idejecuta)
    {
        $em = $this->getDoctrine()->getManager();
        $permiso = new PermisoSeguridad();
        $permiso->setOrdenDeTrabajo($orden);
        $permiso->setLugarEjecucion($lugar);
        $permiso->setDescripcionTrabajo($descripcion);
        $permiso->setFechaEjecucion(new \DateTime($fecha));
        $permiso->setHorarioInicio(new \DateTime($horarioInicio));
        $permiso->setHorarioFin(new \DateTime($horarioFin));
        $em->persist($permiso);

        $ordena = $em->getRepository(Trabajador::class)->find($idordena);
        $TrabajadorOrdena = $em->getRepository(TrabajadorEscala::class)->find(1);
        $permisoTrabajador = new PermisosSeguridadTrabajadoresEjecutan();
        $permisoTrabajador->setIdTrabajador($ordena);
        $permisoTrabajador->setIdEscala($TrabajadorOrdena);
        $permisoTrabajador->setIdPermisosSeguridad($permiso);
        $em->persist($permisoTrabajador);

        $emite = $em->getRepository(Trabajador::class)->find($idemite);
        $TrabajadorEmite = $em->getRepository(TrabajadorEscala::class)->find(2);
        $permisoTrabajador = new PermisosSeguridadTrabajadoresEjecutan();
        $permisoTrabajador->setIdTrabajador($emite);
        $permisoTrabajador->setIdEscala($TrabajadorEmite);
        $permisoTrabajador->setIdPermisosSeguridad($permiso);
        $em->persist($permisoTrabajador);


        $ejecuta = $em->getRepository(Trabajador::class)->find($idejecuta);
        $TrabajadorEjecuta = $em->getRepository(TrabajadorEscala::class)->find(3);
        $permisoTrabajador = new PermisosSeguridadTrabajadoresEjecutan();
        $permisoTrabajador->setIdTrabajador($ejecuta);
        $permisoTrabajador->setIdEscala($TrabajadorEjecuta);
        $permisoTrabajador->setIdPermisosSeguridad($permiso);
        $em->persist($permisoTrabajador);

        $em->flush();
        Traza::save($this->userTraza(),'Insertó nuevo Permiso de Seguridad',$em);
        return $this->redirect($this->generateUrl('permisoseguridadAjax'));
    }
    /**
     * @Route("/editar/{id}/{orden}/{lugar}/{descripcion}", name="Editarpermisoseguridad")
     */
    public function Editarpermisoseguridad($id,$orden,$lugar,$descripcion)
    {
        $em = $this->getDoctrine()->getManager();
        $permiso = $em->getRepository(PermisoSeguridad::class)->find($id);
        $permiso->setOrdenDeTrabajo($orden);
        $permiso->setLugarEjecucion($lugar);
        $permiso->setDescripcionTrabajo($descripcion);
        $em->persist($permiso);
        $em->flush();
        Traza::save($this->userTraza(),'Edito Permiso de Seguridad'.$permiso->getLugarEjecucion(),$em);
        return $this->redirect($this->generateUrl('permisoseguridadAjax'));
    }
    /**
     * @Route("/eliminar/{id}", name="Eliminarpermisoseguridad")
     */
    public function Eliminarpermisoseguridad($id)
    {
        $em = $this->getDoctrine()->getManager();
        $permiso = $em->getRepository(PermisoSeguridad::class)->find($id);
        $em->remove($permiso);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nuevo Permiso de Seguridad'.$permiso->getLugarEjecucion,$em);
        return $this->redirect($this->generateUrl('permisoseguridadAjax'));
    }
    /**
     * @Route("/fechaRango/{rangoF}/{unidadO}", name="rangoUO")
     */
    public function rangoUO($rangoF,$unidadO)
    {
        $picarFecha = mb_split('-',$rangoF);
        $fecha1 = new \DateTime($picarFecha[0]);
        $fecha2 = new \DateTime($picarFecha[1]);
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->find($unidadO);
        $sql = "SELECT per FROM App\Entity\PermisoSeguridad per
                INNER JOIN App\Entity\PermisosSeguridadTrabajadoresEjecutan pste WITH pste.idPermisosSeguridad = per.id
                INNER JOIN App\Entity\Trabajador t WITH pste.idTrabajador = t.id
                INNER JOIN App\Entity\Area a WITH t.idArea = a.id
                WHERE a.nombre = '".$area->getNombre()."' AND
	            '".$fecha1->format('Y-m-d')."' <= per.fechaEjecucion AND per.fechaEjecucion <= '".$fecha2->format('Y-m-d')."'
	            GROUP BY pste.idPermisosSeguridad  ";
        $consulta = $em->createQuery($sql);
        $permisoSeguridads = $consulta->getResult();
        return $this->render('permisoseguridad/permisoseguridadAjax.html.twig', array(
            'permisoSeguridads' => $permisoSeguridads,
            /*'trabajadores' => $trabajadores,*/
        ));
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
    public function ObtenerUbicacion()
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT per.lugarEjecucion FROM App\Entity\PermisoSeguridad per";
        $consulta = $em->createQuery($sql);
        $lugar = $consulta->getResult();
        return $lugar;
    }

}
