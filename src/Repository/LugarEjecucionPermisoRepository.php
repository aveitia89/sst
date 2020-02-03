<?php

namespace App\Repository;

use App\Entity\LugarEjecucionPermiso;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method LugarEjecucionPermiso|null find($id, $lockMode = null, $lockVersion = null)
 * @method LugarEjecucionPermiso|null findOneBy(array $criteria, array $orderBy = null)
 * @method LugarEjecucionPermiso[]    findAll()
 * @method LugarEjecucionPermiso[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LugarEjecucionPermisoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, LugarEjecucionPermiso::class);
    }

    // /**
    //  * @return LugarEjecucionPermiso[] Returns an array of LugarEjecucionPermiso objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('l.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?LugarEjecucionPermiso
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
