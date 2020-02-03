<?php

namespace App\Repository;

use App\Entity\ChequeoMedico;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method ChequeoMedico|null find($id, $lockMode = null, $lockVersion = null)
 * @method ChequeoMedico|null findOneBy(array $criteria, array $orderBy = null)
 * @method ChequeoMedico[]    findAll()
 * @method ChequeoMedico[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ChequeoMedicoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ChequeoMedico::class);
    }

    // /**
    //  * @return ChequeoMedico[] Returns an array of ChequeoMedico objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ChequeoMedico
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
