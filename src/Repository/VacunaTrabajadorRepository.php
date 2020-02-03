<?php

namespace App\Repository;

use App\Entity\VacunaTrabajador;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method VacunaTrabajador|null find($id, $lockMode = null, $lockVersion = null)
 * @method VacunaTrabajador|null findOneBy(array $criteria, array $orderBy = null)
 * @method VacunaTrabajador[]    findAll()
 * @method VacunaTrabajador[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VacunaTrabajadorRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, VacunaTrabajador::class);
    }

    // /**
    //  * @return VacunaTrabajador[] Returns an array of VacunaTrabajador objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('v.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?VacunaTrabajador
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
