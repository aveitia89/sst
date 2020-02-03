<?php

namespace App\Repository;

use App\Entity\NaturalezaLesion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method NaturalezaLesion|null find($id, $lockMode = null, $lockVersion = null)
 * @method NaturalezaLesion|null findOneBy(array $criteria, array $orderBy = null)
 * @method NaturalezaLesion[]    findAll()
 * @method NaturalezaLesion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NaturalezaLesionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, NaturalezaLesion::class);
    }

    // /**
    //  * @return NaturalezaLesion[] Returns an array of NaturalezaLesion objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('n.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?NaturalezaLesion
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
