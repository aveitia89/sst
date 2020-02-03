<?php

namespace App\Repository;

use App\Entity\DeficienciasDetectadas;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method DeficienciasDetectadas|null find($id, $lockMode = null, $lockVersion = null)
 * @method DeficienciasDetectadas|null findOneBy(array $criteria, array $orderBy = null)
 * @method DeficienciasDetectadas[]    findAll()
 * @method DeficienciasDetectadas[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DeficienciasDetectadasRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DeficienciasDetectadas::class);
    }

    // /**
    //  * @return DeficienciasDetectadas[] Returns an array of DeficienciasDetectadas objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('d')
            ->andWhere('d.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('d.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?DeficienciasDetectadas
    {
        return $this->createQueryBuilder('d')
            ->andWhere('d.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
