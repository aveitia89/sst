<?php

namespace App\Repository;

use App\Entity\EspecificacionesDeAgentematerial;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method EspecificacionesDeAgentematerial|null find($id, $lockMode = null, $lockVersion = null)
 * @method EspecificacionesDeAgentematerial|null findOneBy(array $criteria, array $orderBy = null)
 * @method EspecificacionesDeAgentematerial[]    findAll()
 * @method EspecificacionesDeAgentematerial[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EspecificacionesDeAgentematerialRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EspecificacionesDeAgentematerial::class);
    }

    // /**
    //  * @return EspecificacionesDeAgentematerial[] Returns an array of EspecificacionesDeAgentematerial objects
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
    public function findOneBySomeField($value): ?EspecificacionesDeAgentematerial
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
