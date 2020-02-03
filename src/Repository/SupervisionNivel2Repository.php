<?php

namespace App\Repository;

use App\Entity\SupervisionNivel2;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method SupervisionNivel2|null find($id, $lockMode = null, $lockVersion = null)
 * @method SupervisionNivel2|null findOneBy(array $criteria, array $orderBy = null)
 * @method SupervisionNivel2[]    findAll()
 * @method SupervisionNivel2[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SupervisionNivel2Repository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SupervisionNivel2::class);
    }

    // /**
    //  * @return SupervisionNivel2[] Returns an array of SupervisionNivel2 objects
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
    public function findOneBySomeField($value): ?SupervisionNivel2
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
