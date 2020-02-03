<?php

namespace App\Repository;

use App\Entity\MediosAsignados;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method MediosAsignados|null find($id, $lockMode = null, $lockVersion = null)
 * @method MediosAsignados|null findOneBy(array $criteria, array $orderBy = null)
 * @method MediosAsignados[]    findAll()
 * @method MediosAsignados[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MediosAsignadosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MediosAsignados::class);
    }

    // /**
    //  * @return MediosAsignados[] Returns an array of MediosAsignados objects
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
    public function findOneBySomeField($value): ?MediosAsignados
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
