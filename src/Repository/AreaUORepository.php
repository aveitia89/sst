<?php

namespace App\Repository;

use App\Entity\AreaUO;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method AreaUO|null find($id, $lockMode = null, $lockVersion = null)
 * @method AreaUO|null findOneBy(array $criteria, array $orderBy = null)
 * @method AreaUO[]    findAll()
 * @method AreaUO[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AreaUORepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AreaUO::class);
    }

    // /**
    //  * @return AreaUO[] Returns an array of AreaUO objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?AreaUO
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
