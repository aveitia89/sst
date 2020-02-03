<?php

namespace App\Repository;

use App\Entity\PlanDeMedidas;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method PlanDeMedidas|null find($id, $lockMode = null, $lockVersion = null)
 * @method PlanDeMedidas|null findOneBy(array $criteria, array $orderBy = null)
 * @method PlanDeMedidas[]    findAll()
 * @method PlanDeMedidas[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PlanDeMedidasRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PlanDeMedidas::class);
    }

    // /**
    //  * @return PlanDeMedidas[] Returns an array of PlanDeMedidas objects
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
    public function findOneBySomeField($value): ?PlanDeMedidas
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
