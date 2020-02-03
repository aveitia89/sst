<?php

namespace App\Repository;

use App\Entity\EspecificacionesDeCausas;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method EspecificacionesDeCausas|null find($id, $lockMode = null, $lockVersion = null)
 * @method EspecificacionesDeCausas|null findOneBy(array $criteria, array $orderBy = null)
 * @method EspecificacionesDeCausas[]    findAll()
 * @method EspecificacionesDeCausas[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EspecificacionesDeCausasRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EspecificacionesDeCausas::class);
    }

    // /**
    //  * @return EspecificacionesDeCausas[] Returns an array of EspecificacionesDeCausas objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?EspecificacionesDeCausas
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
