<?php

namespace App\Repository;

use App\Entity\TipoTallas;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method TipoTallas|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoTallas|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoTallas[]    findAll()
 * @method TipoTallas[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoTallasRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoTallas::class);
    }

    // /**
    //  * @return TipoTallas[] Returns an array of TipoTallas objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?TipoTallas
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
