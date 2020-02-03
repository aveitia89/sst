<?php

namespace App\Repository;

use App\Entity\MedioDeProteccion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method MedioDeProteccion|null find($id, $lockMode = null, $lockVersion = null)
 * @method MedioDeProteccion|null findOneBy(array $criteria, array $orderBy = null)
 * @method MedioDeProteccion[]    findAll()
 * @method MedioDeProteccion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MedioDeProteccionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MedioDeProteccion::class);
    }

    // /**
    //  * @return MedioDeProteccion[] Returns an array of MedioDeProteccion objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('m')
            ->andWhere('m.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('m.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?MedioDeProteccion
    {
        return $this->createQueryBuilder('m')
            ->andWhere('m.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
