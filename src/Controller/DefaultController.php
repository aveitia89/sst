<?php

namespace App\Controller;

use App\Entity\AccidenteLaboral;
use App\Entity\Area;
use App\Entity\Cargo;
use App\Entity\LugarEjecucionPermiso;
use App\Entity\Medicamento;
use App\Entity\PlanDeMedidas;
use App\Entity\Trabajador;
use App\Entity\Traza;
use App\Entity\UnidadOrganizativa;
use App\Entity\Usuario;
use App\utils\BackupMysql;
use App\utils\Notificaciones;
use App\utils\Trazas;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use mysqli;


class DefaultController extends AbstractController
{
    public function VacunadosInit($year)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT vt FROM  App\Entity\VacunaTrabajador vt
                INNER JOIN App\Entity\Trabajador t WITH vt.idTrabajador = t.id 
                WHERE YEAR(vt.fecha) = " . $year . " AND t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $vacunaTrabajador = $consulta->getResult();
        $vacunado = count($vacunaTrabajador);
        return $vacunado;
    }
    public function ChequeosInit($year)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT cmt FROM App\Entity\ChequeoMedico cmt 
                INNER JOIN App\Entity\Trabajador t WITH cmt.idTrabajador = t.id
                WHERE YEAR(cmt.fecha) = " . $year . " AND t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $chequeoTrabajador = $consulta->getResult();
        $chequeo = count($chequeoTrabajador);
        return $chequeo;
    }
    public function ChequeosVencidos()
    {
        $fecha = new \DateTime('now');
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT cmt FROM App\Entity\ChequeoMedico cmt 
                INNER JOIN App\Entity\Trabajador t WITH cmt.idTrabajador = t.id
                WHERE t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $chequeoTrabajador = $consulta->getResult();
        $cantChequeoVencidos = 0;
        for ($i = 0; $i < count($chequeoTrabajador); $i++) {
            if (strtotime($fecha->format('Y-m-d')) > strtotime($chequeoTrabajador[$i]->getProximoChequeo()->format('Y-m-d'))) {
                $cantChequeoVencidos++;
            }
        }
        return $cantChequeoVencidos;
    }
    public function MediosInit($year)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT mat FROM App\Entity\MediosAsignados mat 
                INNER JOIN App\Entity\Trabajador t WITH  mat.idTrabajador = t.id
                WHERE YEAR(mat.fecha) = ".$year." AND t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $mediosTrabajador = $consulta->getResult();
        $medios = count($mediosTrabajador);
        return $medios;
    }
    public function PermisoEmitidos($year)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT permiso FROM App\Entity\PermisoSeguridad permiso
                WHERE YEAR(permiso.fechaEjecucion) = " . $year . "";
        $consulta = $em->createQuery($sql);
        $permisoSeguridad = $consulta->getResult();
        $permiso = count($permisoSeguridad);
        return $permiso;
    }
    public function AccidenteLaboralInit($year)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT alt FROM App\Entity\AccidenteLaboral alt  
                INNER JOIN  App\Entity\Trabajador t WITH alt.idTrabajador = t.id 
                WHERE YEAR(alt.fechaInicio) = ".$year." AND t.idArea = ".$this->getIdAreaUsuario()."";
        $consulta = $em->createQuery($sql);
        $accidenteTrabajador = $consulta->getResult();
        $accidente = count($accidenteTrabajador);
        return $accidente;
    }
    public function CantidadRiesgo($year)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT riesgo FROM App\Entity\Riesgo riesgo 
                INNER JOIN App\Entity\Supervision super WITH  super.id = riesgo.idsupervision
                WHERE YEAR(super.fecha) = " . $year . "";
        $consulta = $em->createQuery($sql);
        $riesgoSupervision = $consulta->getResult();
        $riesgo = count($riesgoSupervision);
        return $riesgo;
    }
    public function PresupuestoMed($year)
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT medios.costo,medAsig.cantidad FROM App\Entity\MedioDeProteccion medios 
                INNER JOIN App\Entity\MediosAsignados medAsig WITH  medios.id = medAsig.idMedios
                WHERE YEAR(medAsig.fecha) = " . $year . "";
        $consulta = $em->createQuery($sql);
        $medAsig = $consulta->getResult();
        $presupuesto = 0;
        for ($i = 0; $i < count($medAsig); $i++) {
            $presupuesto = $presupuesto + ($medAsig[$i]['costo'] * $medAsig[$i]['cantidad']);
        }
        return $presupuesto;
    }
    public function CantMP()
    {
        $fechaActual = new \DateTime('today');
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT mat FROM App\Entity\MediosAsignados mat
                INNER JOIN App\Entity\MedioDeProteccion mp WITH  mat.idMedios = mp.id";
        $consulta = $em->createQuery($sql);
        $mp = $consulta->getResult();
        $cantidad = 0;
        for ($i = 0; $i < count($mp); $i++)
        {
            $fechaEntrega = $mp[$i]->getFecha();
            $vidaUtil = $mp[$i]->getIdMedios()->getVidaUtil();
            $diff = $fechaEntrega->diff($fechaActual);
            $diferencia = $diff->days;
            $dif = $vidaUtil - $diferencia;
            if ($dif < 30)
            {
                $cantidad++;
            }
        }
        return $cantidad;
    }
    public function RiesgoSinMedidas()
    {
        $em = $this->getDoctrine()->getManager();
        $medidas = $em->getRepository(PlanDeMedidas::class)->findBy(['idRiesgo' => null]);
        return count($medidas);
    }
    public function MedidasVencidas()
    {
        $fechaActual = new \DateTime('today');
        $cantidad = 0;
        $em = $this->getDoctrine()->getManager();
        $medidas = $em->getRepository(PlanDeMedidas::class)->findAll();
        for ($i = 0; $i < count($medidas); $i++)
        {
            if (strtotime($fechaActual->format('Y-m-d')) > strtotime($medidas[$i]->getFechaCumplimiento()->format('Y-m-d')))
            {
                $cantidad++;
            }
        }
        return $cantidad;
    }
    function getMes($mes)
    {
        switch ($mes)
        {
            case 1;
                return "Enero";
            case 2;
                return "Febrero";
            case 3;
                return "Marzo";
            case 4;
                return "Abril";
            case 5;
                return "Mayo";
            case 6;
                return "Junio";
            case 7;
                return "Julio";
            case 8;
                return "Agosto";
            case 9;
                return "Septiembre";
            case 10;
                return "Octubre";
            case 11;
                return "Noviembre";
            case 12;
                return "Diciembre";
            default:
                return "";
        }
    }
    /**
     * @Route("/usuario/inicio", name="inicio")
     */
    public function inicio()
    {
        $fecha = new \DateTime('today');
        $year = $fecha->format('Y');
        return $this->render('default/index.html.twig', [
            'anno' => $year,
            'vacunado' => $this->VacunadosInit($year),
            'chequeo' => $this->ChequeosInit($year),
            'medios' => $this->MediosInit($year),
            'accidente' => $this->AccidenteLaboralInit($year),
            'cantChequeoVencidos' => $this->ChequeosVencidos(),
            'cantMP' => $this->CantMP(),
            'cantRiesgoSinMedida' => $this->RiesgoSinMedidas(),
            'cantMedidasVencidas' => $this->MedidasVencidas(),
        ]);
    }
    /**
     * @Route("/especialista/cargar/trabajador", name="cargarTrabajadoresExcel")
     */
    public function cargarTrabajadoresExcel()
    {
        $tieneError = 0;
        $em = $this->getDoctrine()->getManager();

        if ($_FILES['nombreArchivo']['error'] > 0) {
            $error = $_FILES['nombreArchivo']['error'];
            $tieneError++;
        }
        if ($tieneError == 0) {
            $nombreArch = $_FILES['nombreArchivo']['name'];
            $tipoArch = $_FILES['nombreArchivo']['type'];
            $direccion = $this->getParameter('kernel.project_dir') . "/public/archivos/" . $nombreArch;
            if (($tipoArch == 'application/vnd.ms-excel') || ($tipoArch == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')) {
                move_uploaded_file($_FILES['nombreArchivo']['tmp_name'], $direccion);
                $objPHPExcel = IOFactory::load($direccion);
                $datos = $objPHPExcel->getSheet(0);
                $numeroMayorDeFila = $datos->getHighestRow();
                for ($indiceFila = 2; $indiceFila <= $numeroMayorDeFila; $indiceFila++) {
                    $trabajador = new Trabajador();
                    //$id = $datos->getCellByColumnAndRow(1, $indiceFila)->getCalculatedValue();
                    $trabajador->setNombre($datos->getCellByColumnAndRow(2, $indiceFila)->getCalculatedValue());
                    $trabajador->setApellidos($datos->getCellByColumnAndRow(3, $indiceFila)->getCalculatedValue());
                    $trabajador->setCi($datos->getCellByColumnAndRow(4, $indiceFila)->getCalculatedValue());
                    $trabajador->setSexo($datos->getCellByColumnAndRow(5, $indiceFila)->getCalculatedValue());
                    $trabajador->setRaza($datos->getCellByColumnAndRow(6, $indiceFila)->getCalculatedValue());
                    $trabajador->setNivelEscolar($datos->getCellByColumnAndRow(7, $indiceFila)->getCalculatedValue());
                    $trabajador->setNombreTitulo($datos->getCellByColumnAndRow(8, $indiceFila)->getCalculatedValue());
                    $trabajador->setAnoGraduacion($datos->getCellByColumnAndRow(9, $indiceFila)->getCalculatedValue());
                    $trabajador->setPcc($datos->getCellByColumnAndRow(10, $indiceFila)->getCalculatedValue());
                    $trabajador->setUjc($datos->getCellByColumnAndRow(11, $indiceFila)->getCalculatedValue());
                    $trabajador->setEstadoCivil($datos->getCellByColumnAndRow(12, $indiceFila)->getCalculatedValue());
                    $trabajador->setCalleYNumero($datos->getCellByColumnAndRow(13, $indiceFila)->getCalculatedValue());
                    $trabajador->setEntreCalles($datos->getCellByColumnAndRow(14, $indiceFila)->getCalculatedValue());
                    $trabajador->setMunicipio($datos->getCellByColumnAndRow(15, $indiceFila)->getCalculatedValue());
                    $trabajador->setDetalles($datos->getCellByColumnAndRow(16, $indiceFila)->getCalculatedValue());
                    $trabajador->setUbicacionDeLaDefensa($datos->getCellByColumnAndRow(17, $indiceFila)->getCalculatedValue());
                    $trabajador->setTotal($datos->getCellByColumnAndRow(18, $indiceFila)->getCalculatedValue());
                    $trabajador->setMoneda($datos->getCellByColumnAndRow(19, $indiceFila)->getCalculatedValue());
                    $trabajador->setAreaDePersonal($datos->getCellByColumnAndRow(20, $indiceFila)->getCalculatedValue());
                    $trabajador->setModuloDeRopa($datos->getCellByColumnAndRow(21, $indiceFila)->getCalculatedValue());
                    $trabajador->setTitulo($datos->getCellByColumnAndRow(22, $indiceFila)->getCalculatedValue());
                    $trabajador->setSubdivisionPersonal($datos->getCellByColumnAndRow(23, $indiceFila)->getCalculatedValue());
                    $trabajador->setNumeroPersona($datos->getCellByColumnAndRow(24, $indiceFila)->getCalculatedValue());
                    $trabajador->setClaseDeContrato($datos->getCellByColumnAndRow(25, $indiceFila)->getCalculatedValue());
                    $trabajador->setSegundoApellido($datos->getCellByColumnAndRow(26, $indiceFila)->getCalculatedValue());
                    //Buscar Datos en otras tablas
                    $nombreArea = $datos->getCellByColumnAndRow(27, $indiceFila)->getCalculatedValue();
                    $nombreUO = $datos->getCellByColumnAndRow(28, $indiceFila)->getCalculatedValue();
                    $nombreCargo = $datos->getCellByColumnAndRow(29, $indiceFila)->getCalculatedValue();

                    //print_r($nombreArea."-".$nombreUO."-".$nombreCargo);die;
                    $area = $em->getRepository(Area::class)->findOneBy(['nombre' => $nombreArea]);
                    $unidadOrganizativa = $em->getRepository(UnidadOrganizativa::class)->findOneBy(['nombre' => $nombreUO]);;
                    $cargo = $em->getRepository(Cargo::class)->findOneBy(['nombre' => $nombreCargo]);;

                    $trabajador->setIdArea($area);
                    $trabajador->setIdUnidadOrganizativa($unidadOrganizativa);
                    $trabajador->setIdCargo($cargo);
                    $trabajador->setTiempoRestanteChequeo($datos->getCellByColumnAndRow(30, $indiceFila)->getCalculatedValue());

                    $em->persist($trabajador);
                    //print_r($nombre);die;
                }
                //PARA ELIMINAR EL ARCHIVO DESPUES Q LO UTILICE
                unlink($direccion);
            } else {
                $tieneError++;
            }
        }
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nomenclador Trabajadores',$em);
        return $this->redirect($this->generateUrl('trabajador'));
    }
    /**
     * @Route("/especialista/trabajador", name="trabajador")
     */
    public function trabajador()
    {
        $em = $this->getDoctrine()->getManager();
        Traza::save($this->userTraza(), 'Vista Trabajador', $em);
        return $this->render('nomencladores/trabajador.html.twig');
    }
    /**
     * @Route("/especialista/trabajador/ajax", name="trabajadorAjax")
     */
    public function trabajadorAjax()
    {
        $em = $this->getDoctrine()->getManager();
        $trabajador = $em->getRepository(Trabajador::class)->findBy([], ['nombre' => 'ASC']);
        return $this->render('nomencladores/trabajadorAjax.html.twig', [
            'trabajador' => $trabajador,
        ]);
    }
    /**
     * @Route("/", name="login")
     */
    public function login(AuthenticationUtils $authenticationUtils)
    {
        //$aut = $this->get('security.authentication_utils');
        $error = $authenticationUtils->getLastAuthenticationError();
        $lastUsername = $authenticationUtils->getLastUsername();
        return $this->render('default/login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
        ]);
    }
    /**
     * @Route("/usuario/reporte_areas", name="reporte_areas")
     */
    /*public function reporte_areas(Request $request) {
        $em = $this->getDoctrine()->getManager();
        $permisoSeguridads = $em->getRepository(PermisoSeguridad::class)->findAll();
        $trabajadores = $em->getRepository(Trabajador::class)->findAll();
        return $this->render('default/reportesAreas.html.twig', [
            'total' => $_SESSION['total'],
            'permisoSeguridads' => $permisoSeguridads,
            'trabajadores' => $trabajadores,
            'instance' => $this,
        ]);
    }*/
    /**
     * @Route("/usuario/listarFicha", name="listarFicha")
     */
    public function listarFicha()
    {
        return $this->render('ficha/ficha_listado.html.twig', []);
    }
    /**
     * @Route("/usuario/listarFicha/ajax", name="listarFichaAjax")
     */
    public function listarFichaAjax()
    {
        $em = $this->getDoctrine()->getManager();
        $trabajadores = $em->getRepository(Trabajador::class)->findBy(['idArea' => $this->getIdAreaUsuario()], ['id' => 'DESC']);
        return $this->render('ficha/fichaAjax.html.twig', [
            'trabajadores' => $trabajadores,
        ]);
    }
    /**
     * @Route("/admin/trazas", name="trazas")
     */
    public function trazas()
    {
        $em = $this->getDoctrine()->getManager();
        $trazas = $em->getRepository(Traza::class)->findAll();
        return $this->render('nomencladores/trazas.html.twig', [
            'trazas' => $trazas,
        ]);
    }
    public function getUsuario($id)
    {
        $em = $this->getDoctrine()->getManager();
        return $em->getRepository(Usuario::class)->findOneBy(array("id" => $id));
    }
    /**
     * @Route("/admin/config", name="config")
     */
    public function config()
    {
        //system("mysqldump --user=root --password= --no-create-db --no-create-info --extended-insert --insert-ignore etecsadb ");
        $ruta = $this->getParameter('kernel.project_dir') . "/public/myphp-backup-files/";
        if (is_dir($ruta)) {
            if ($aux = opendir($ruta)) {
                while (($archivo = readdir($aux)) !== false) {
                    if ($archivo != "." && $archivo != "..") {
                        $nombrearchivo = str_replace(".sql", "", $archivo);
                        $nombrearchivo = str_replace("-", ":", $nombrearchivo);
                        $ruta_completa = $ruta . $archivo;
                        if (is_dir($ruta_completa)) {

                        } else {
                            $presta['ruta_completa'] = $ruta_completa;
                            $presta['nombrearchivo'] = $nombrearchivo;
                            $prest[] = $presta;
                        }
                    }
                }
                closedir($aux);
            }
        } else {
            echo $ruta . " No es ruta v�lida";
        }
        $prest = array_reverse($prest);
        return $this->render('default/config.html.twig', [
            'array' => $prest,
        ]);
    }
    /**
     * @Route("/admin/config/backup", name="backup")
     */
    public function backup()
    {
        $db_host = 'localhost'; //Host del Servidor MySQL
        $db_name = 'etecsadb'; //Nombre de la Base de datos
        $db_user = 'root'; //Usuario de MySQL
        $db_pass = ''; //Password de Usuario MySQL
        $db_port = 3306; //Port MySQL
        $backup = new BackupMysql($db_host, $db_user, $db_pass, $db_name, $db_port);
        $result = $backup->backupTables() ? 'OK' : 'KO';
        $em = $this->getDoctrine()->getManager();
        Traza::save($this->userTraza(), 'Salva BD', $em);
        $response = new Response(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
        /*return $this->render('default/config.html.twig', [
            'result' => $result,
        ]);*/
    }
    /**
     * @Route("/admin/config/restaura/{ruta}", name="restaura")
     */
    public function restaura($ruta)
    {
        $restorePoint = $this->limpiarCadena($ruta);
        $sql = explode(";", file_get_contents($restorePoint));
        $totalErrors = 0;
        set_time_limit(120);
        $con = mysqli_connect('localhost', 'root', '', 'etecsadb');
        $con->query("SET FOREIGN_KEY_CHECKS=0");
        for ($i = 0; $i < (count($sql) - 1); $i++) {
            if ($con->query($sql[$i] . ";")) {
            } else {
                $totalErrors++;
            }
        }
        $con->query("SET FOREIGN_KEY_CHECKS=1");
        $con->close();
        if ($totalErrors <= 0) {
            Traza::save($this->userTraza(), 'Restaurar Base de Datos');
            $result = "Restauraci�n completada con �xito.";
            $response = new Response(json_encode($result));
            $response->headers->set('Content-Type', 'application/json');
            return $response;

        } else {
            $result = "Ocurrio un error inesperado, no se pudo hacer la restauraci�n completamente.";
            $response = new Response(json_encode($result));
            $response->headers->set('Content-Type', 'application/json');
            return $response;
        }
    }
    public static function limpiarCadena($valor)
    {
        $valor = addslashes($valor);
        $valor = str_ireplace("<script>", "", $valor);
        $valor = str_ireplace("</script>", "", $valor);
        $valor = str_ireplace("SELECT * FROM", "", $valor);
        $valor = str_ireplace("DELETE FROM", "", $valor);
        $valor = str_ireplace("UPDATE", "", $valor);
        $valor = str_ireplace("INSERT INTO", "", $valor);
        $valor = str_ireplace("DROP TABLE", "", $valor);
        $valor = str_ireplace("TRUNCATE TABLE", "", $valor);
        $valor = str_ireplace("--", "", $valor);
        $valor = str_ireplace("^", "", $valor);
        $valor = str_ireplace("[", "", $valor);
        $valor = str_ireplace("]", "", $valor);
        $valor = str_ireplace("\\", "", $valor);
        $valor = str_ireplace("=", "", $valor);
        return $valor;
    }
    /**
     * @Route("/admin/config/sql", name="sql")
     */
    public static function sql($query)
    {
        $con = mysqli_connect('localhost', 'root', '', 'etecsadb');
        mysqli_set_charset($con, "utf8");
        if (mysqli_connect_errno()) {
            printf("Conexion fallida: %s\n", mysqli_connect_error());
            exit();
        } else {
            mysqli_autocommit($con, false);
            mysqli_begin_transaction($con, MYSQLI_TRANS_START_WITH_CONSISTENT_SNAPSHOT);
            if ($consul = mysqli_query($con, $query)) {
                if (!mysqli_commit($con)) {
                    print("Falla la consignación de la transacción\n");
                    exit();
                }
            } else {
                mysqli_rollback($con);
                echo "Falla la transacción";
                exit();
            }
            return $consul;
        }
    }

    public function userTraza()
    {
        $username = $this->getUser();
        if ($username != null) {
            return $usuario = $this->getUsuario($username->getId());
        } else {
            return $this->redirect($this->generateUrl('login'));
        }
    }
    /**
     * @Route("/especialista/medicamentos", name="medicamentos")
     */
    public function medicamentos()
    {

        return $this->render('medicamentos/medicamento.html.twig', [

        ]);
    }
    /**
     * @Route("/especialista/ajax/medicamentos", name="medicamentoAjax")
     */
    public function medicamentoAjax()
    {
        $em = $this->getDoctrine()->getManager();
        $medicamentos = $em->getRepository(Medicamento::class)->findAll();
        return $this->render('medicamentos/medicamentoAjax.html.twig', [
            'medicamento' => $medicamentos
        ]);
    }
    /**
     * @Route("/especialista/medicamentos/insertar/{nombre}", name="medicamentoInsertar")
     */
    public function medicamentoInsertar($nombre)
    {
        $em = $this->getDoctrine()->getManager();
        $medicamento = new Medicamento();
        $medicamento->setNombre($nombre);
        $em->persist($medicamento);
        $em->flush();
        Traza::save($this->userTraza(),'Insertó nuevo Medicamento: '.$medicamento->getNombre(),$em);
        return $this->redirect($this->generateUrl('medicamentoAjax'));
    }
    /**
     * @Route("/especialista/medicamentos/editar/{id}/{nombre}", name="medicamentoEditar")
     */
    public function medicamentoEditar($id, $nombre)
    {
        $em = $this->getDoctrine()->getManager();
        $medicamento = $em->getRepository(Medicamento::class)->findOneBy(['id' => $id]);
        $medicamento->setNombre($nombre);
        $em->persist($medicamento);
        $em->flush();
        Traza::save($this->userTraza(),'Edito Medicamento: '.$medicamento->getNombre(),$em);
        return $this->redirect($this->generateUrl('medicamentoAjax'));
    }
    /**
     * @Route("/especialista/medicamentos/editar/{id}", name="medicamentoEliminar")
     */
    public function medicamentoEliminar($id)
    {
        $em = $this->getDoctrine()->getManager();
        $medicamento = $em->getRepository(Medicamento::class)->findOneBy(['id' => $id]);
        $em->remove($medicamento);
        $em->flush();
        Traza::save($this->userTraza(),'Elimino Medicamento: '.$medicamento->getNombre(),$em);
        return $this->redirect($this->generateUrl('medicamentoAjax'));
    }
    /**
     * @Route("/usuario/comparativa", name="comparativa")
     */
    public function comparativa()
    {
        $fecha = new \DateTime('now');
        $annoActual = $fecha->format('Y');
        /*Cantidad de medios*/
        $medAnnoAnterior = $this->MediosInit($annoActual - 1);
        $medAnnoActual = $this->MediosInit($annoActual);
        /*Cantidad de accidente laborales*/
        $accAnnoAnterior = $this->AccidenteLaboralInit($annoActual - 1);
        $accAnnoActual = $this->AccidenteLaboralInit($annoActual);
        /*Permiso de seguridad emitidos*/
        $perAnnoAnterior = $this->PermisoEmitidos($annoActual - 1);
        $perAnnoActual = $this->PermisoEmitidos($annoActual);
        /*Cantidad de riesgo*/
        $riesgAnnoAnterior = $this->CantidadRiesgo($annoActual - 1);
        $riesgAnnoActual = $this->CantidadRiesgo($annoActual);
        /*Presupuesto de medios*/
        $presAnnoAnterior = $this->PresupuestoMed($annoActual - 1);
        $presAnnoActual = $this->PresupuestoMed($annoActual);
        return $this->render('default/comparativas.html.twig', [
            'annoActual' => $annoActual,
            'annoAnterior' => $annoActual - 1,
            'medAnnoAnterior' => $medAnnoAnterior,
            'medAnnoActual' => $medAnnoActual,
            'accAnnoAnterior' => $accAnnoAnterior,
            'accAnnoActual' => $accAnnoActual,
            'perAnnoAnterior' => $perAnnoAnterior,
            'perAnnoActual' => $perAnnoActual,
            'riesgAnnoAnterior' => $riesgAnnoAnterior,
            'riesgAnnoActual' => $riesgAnnoActual,
            'presAnnoAnterior' => $presAnnoAnterior,
            'presAnnoActual' => $presAnnoActual,
        ]);
    }
    /**
     * @Route("/usuario/indice/accidentes", name="indiceAccidente")
     */
    public function indiceAccidente()
    {
        $frecuencia = $this->FrecuenciaAccidentes();
        $gravedad = $this->GravedadAccidente();
        $incidenciaMes = $this->IncidenciaAccidentesMes();
        $incidenciaAnno = $this->IncidenciaAccidentesAnno();
        return $this->render('default/indice.html.twig', [
            'frecuencia' => $frecuencia,
            'gravedad' => $gravedad,
            'incidenciaMes' => $incidenciaMes,
            'incidenciaAnno' => $incidenciaAnno,
        ]);
    }
    function FrecuenciaAccidentes()
    {
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->findAll();
        $accidente = $em->getRepository(AccidenteLaboral::class)->findAll();

        $frecuencia = array();
        for ($i = 0; $i < count($area);$i++)
        {
            $cantTrabAccidentes = 0;
            for ($j = 0; $j < count($accidente);$j++)
            {
                if ($area[$i]->getId() == $accidente[$j]->getIdTrabajador()->getIdArea()->getId())
                {
                    $cantTrabAccidentes++;
                }
            }
            if ($cantTrabAccidentes != 0)
            {
                $horasTrabajadas = ($cantTrabAccidentes*8)*24;
                $indiceFrecuencia = ($cantTrabAccidentes/$horasTrabajadas)*1000000;
                $frecuencia[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => $indiceFrecuencia);
            }
            else
            {
                $frecuencia[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => 0);
            }
        }
        return $frecuencia;
    }
    public function getIdAreaUsuario()
    {
        $em = $this->getDoctrine()->getManager();
        $username = $this->getUser();
        $usuario = $em->getRepository(Usuario::class)->find($username->getId());
        return $usuario->getIdArea()->getId();
    }
    function GravedadAccidente()
    {
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->findAll();
        $accidente = $em->getRepository(AccidenteLaboral::class)->findAll();
        $gravedad = array();

        for ($i = 0; $i < count($area);$i++)
        {
            $cantTrabAccidentes = 0;
            for ($j = 0; $j < count($accidente);$j++)
            {
                if ($area[$i]->getId() == $accidente[$j]->getIdTrabajador()->getIdArea()->getId())
                {
                    $cantTrabAccidentes++;
                }
            }
            if ($cantTrabAccidentes != 0)
            {
                $horasNoTrabajadas = 8*24;
                $horasTrabajadas = ($cantTrabAccidentes*8)*24;
                $indiceFrecuencia = ($horasNoTrabajadas/$horasTrabajadas)*1000;
                $gravedad[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => $indiceFrecuencia);
            }
            else
            {
                $gravedad[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => 0);
            }
        }
        return $gravedad;
    }
    function IncidenciaAccidentesMes()
    {
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->findAll();
        $accidente = $em->getRepository(AccidenteLaboral::class)->findAll();
        $incidencia = array();

        $fecha = new \DateTime('now');
        $mes = $fecha->format('m');

        for ($i = 0; $i < count($area);$i++)
        {
            $cantTrabAccidentes = 0;
            for ($j = 0; $j < count($accidente);$j++)
            {
                $mesData = $accidente[$j]->getFechaInicio()->format('m');
                if($mes == $mesData)
                {
                    if ($area[$i]->getId() == $accidente[$j]->getIdTrabajador()->getIdArea()->getId())
                    {
                        $cantTrabAccidentes++;
                    }
                }
            }
            if ($cantTrabAccidentes != 0)
            {
                $incidenciaHombres = ($cantTrabAccidentes*12)*12;
                $incidencia[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => $incidenciaHombres);
            }
            else
            {
                $incidencia[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => 0);
            }
        }
        return $incidencia;
    }
    function IncidenciaAccidentesAnno()
    {
        $em = $this->getDoctrine()->getManager();
        $area = $em->getRepository(Area::class)->findAll();
        $accidente = $em->getRepository(AccidenteLaboral::class)->findAll();
        $incidencia = array();

        for ($i = 0; $i < count($area);$i++)
        {
            $cantTrabAccidentes = 0;
            $cantAccidentesMortal = 0;
            for ($j = 0; $j < count($accidente);$j++)
            {
                $mesData = $accidente[$j]->getFechaInicio()->format('m');
                if(1 <= $mesData && $mesData <= 12)
                {
                    if ($area[$i]->getId() == $accidente[$j]->getIdTrabajador()->getIdArea()->getId())
                    {
                        $cantTrabAccidentes++;
                    }
                    if ($accidente[$j]->getIdtipo()->getTipo() == "Mortal")
                    {
                        $cantAccidentesMortal++;
                    }
                }
            }
            if ($cantTrabAccidentes != 0)
            {
                $incidenciaHombres = ($cantAccidentesMortal/$cantTrabAccidentes)*100;
                $incidencia[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => $incidenciaHombres);
            }
            else
            {
                $incidencia[] = array('DT' => $area[$i]->getNombre(),'frecuencia' => 0);
            }
        }
        return $incidencia;
    }

    /**
     * @Route("/usuario/mapa", name="mapa")
     */
    public function mapa()
    {
        $em = $this->getDoctrine()->getManager();
        $lugares = $em->getRepository(LugarEjecucionPermiso::class)->findAll();
        return $this->render('default/mapa1.html.twig',[
            'lugares' => $lugares,
        ]);
    }





}

