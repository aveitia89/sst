<?php

namespace App\Repository;

use App\Entity\PermisosSeguridadTrabajadoresEjecutan;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method PermisosSeguridadTrabajadoresEjecutan|null find($id, $lockMode = null, $lockVersion = null)
 * @method PermisosSeguridadTrabajadoresEjecutan|null findOneBy(array $criteria, array $orderBy = null)
 * @method PermisosSeguridadTrabajadoresEjecutan[]    findAll()
 * @method PermisosSeguridadTrabajadoresEjecutan[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PermisosSeguridadTrabajadoresEjecutanRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PermisosSeguridadTrabajadoresEjecutan::class);
    }

    // /**
    //  * @return PermisosSeguridadTrabajadoresEjecutan[] Returns an array of PermisosSeguridadTrabajadoresEjecutan objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?PermisosSeguridadTrabajadoresEjecutan
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
