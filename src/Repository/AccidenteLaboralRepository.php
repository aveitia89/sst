<?php

namespace App\Repository;

use App\Entity\AccidenteLaboral;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method AccidenteLaboral|null find($id, $lockMode = null, $lockVersion = null)
 * @method AccidenteLaboral|null findOneBy(array $criteria, array $orderBy = null)
 * @method AccidenteLaboral[]    findAll()
 * @method AccidenteLaboral[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AccidenteLaboralRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AccidenteLaboral::class);
    }

    // /**
    //  * @return AccidenteLaboral[] Returns an array of AccidenteLaboral objects
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
    public function findOneBySomeField($value): ?AccidenteLaboral
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
