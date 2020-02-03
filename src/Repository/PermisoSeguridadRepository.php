<?php

namespace App\Repository;

use App\Entity\PermisoSeguridad;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method PermisoSeguridad|null find($id, $lockMode = null, $lockVersion = null)
 * @method PermisoSeguridad|null findOneBy(array $criteria, array $orderBy = null)
 * @method PermisoSeguridad[]    findAll()
 * @method PermisoSeguridad[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PermisoSeguridadRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PermisoSeguridad::class);
    }

    // /**
    //  * @return PermisoSeguridad[] Returns an array of PermisoSeguridad objects
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
    public function findOneBySomeField($value): ?PermisoSeguridad
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
