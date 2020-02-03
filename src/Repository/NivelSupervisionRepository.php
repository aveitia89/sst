<?php

namespace App\Repository;

use App\Entity\NivelSupervision;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method NivelSupervision|null find($id, $lockMode = null, $lockVersion = null)
 * @method NivelSupervision|null findOneBy(array $criteria, array $orderBy = null)
 * @method NivelSupervision[]    findAll()
 * @method NivelSupervision[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NivelSupervisionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, NivelSupervision::class);
    }

    // /**
    //  * @return NivelSupervision[] Returns an array of NivelSupervision objects
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
    public function findOneBySomeField($value): ?NivelSupervision
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
