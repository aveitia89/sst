<?php

namespace App\Repository;

use App\Entity\FormaDeAccidente;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method FormaDeAccidente|null find($id, $lockMode = null, $lockVersion = null)
 * @method FormaDeAccidente|null findOneBy(array $criteria, array $orderBy = null)
 * @method FormaDeAccidente[]    findAll()
 * @method FormaDeAccidente[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FormaDeAccidenteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, FormaDeAccidente::class);
    }

    // /**
    //  * @return FormaDeAccidente[] Returns an array of FormaDeAccidente objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('f.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?FormaDeAccidente
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
