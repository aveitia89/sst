<?php

namespace App\Repository;

use App\Entity\LugarDeTrabajoAccidente;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method LugarDeTrabajoAccidente|null find($id, $lockMode = null, $lockVersion = null)
 * @method LugarDeTrabajoAccidente|null findOneBy(array $criteria, array $orderBy = null)
 * @method LugarDeTrabajoAccidente[]    findAll()
 * @method LugarDeTrabajoAccidente[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LugarDeTrabajoAccidenteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, LugarDeTrabajoAccidente::class);
    }

    // /**
    //  * @return LugarDeTrabajoAccidente[] Returns an array of LugarDeTrabajoAccidente objects
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
    public function findOneBySomeField($value): ?LugarDeTrabajoAccidente
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
