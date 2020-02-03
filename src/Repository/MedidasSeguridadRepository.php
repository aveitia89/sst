<?php

namespace App\Repository;

use App\Entity\MedidasSeguridad;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method MedidasSeguridad|null find($id, $lockMode = null, $lockVersion = null)
 * @method MedidasSeguridad|null findOneBy(array $criteria, array $orderBy = null)
 * @method MedidasSeguridad[]    findAll()
 * @method MedidasSeguridad[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MedidasSeguridadRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MedidasSeguridad::class);
    }

    // /**
    //  * @return MedidasSeguridad[] Returns an array of MedidasSeguridad objects
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
    public function findOneBySomeField($value): ?MedidasSeguridad
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
