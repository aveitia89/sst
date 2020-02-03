<?php

namespace App\Repository;

use App\Entity\SupervisionNivel1;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method SupervisionNivel1|null find($id, $lockMode = null, $lockVersion = null)
 * @method SupervisionNivel1|null findOneBy(array $criteria, array $orderBy = null)
 * @method SupervisionNivel1[]    findAll()
 * @method SupervisionNivel1[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SupervisionNivel1Repository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SupervisionNivel1::class);
    }

    // /**
    //  * @return SupervisionNivel1[] Returns an array of SupervisionNivel1 objects
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
    public function findOneBySomeField($value): ?SupervisionNivel1
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
