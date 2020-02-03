<?php

namespace App\Repository;

use App\Entity\UnidadOrganizativa;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method UnidadOrganizativa|null find($id, $lockMode = null, $lockVersion = null)
 * @method UnidadOrganizativa|null findOneBy(array $criteria, array $orderBy = null)
 * @method UnidadOrganizativa[]    findAll()
 * @method UnidadOrganizativa[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UnidadOrganizativaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, UnidadOrganizativa::class);
    }

    // /**
    //  * @return UnidadOrganizativa[] Returns an array of UnidadOrganizativa objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('u.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?UnidadOrganizativa
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
