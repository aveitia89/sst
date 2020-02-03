<?php

namespace App\Repository;

use App\Entity\Supervision;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Supervision|null find($id, $lockMode = null, $lockVersion = null)
 * @method Supervision|null findOneBy(array $criteria, array $orderBy = null)
 * @method Supervision[]    findAll()
 * @method Supervision[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SupervisionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Supervision::class);
    }

    // /**
    //  * @return Supervision[] Returns an array of Supervision objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Supervision
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
