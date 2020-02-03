<?php

namespace App\Repository;

use App\Entity\TrabajadorEscala;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method TrabajadorEscala|null find($id, $lockMode = null, $lockVersion = null)
 * @method TrabajadorEscala|null findOneBy(array $criteria, array $orderBy = null)
 * @method TrabajadorEscala[]    findAll()
 * @method TrabajadorEscala[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TrabajadorEscalaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TrabajadorEscala::class);
    }

    // /**
    //  * @return TrabajadorEscala[] Returns an array of TrabajadorEscala objects
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
    public function findOneBySomeField($value): ?TrabajadorEscala
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
