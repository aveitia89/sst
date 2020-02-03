<?php

namespace App\Repository;

use App\Entity\AgenteMaterial;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method AgenteMaterial|null find($id, $lockMode = null, $lockVersion = null)
 * @method AgenteMaterial|null findOneBy(array $criteria, array $orderBy = null)
 * @method AgenteMaterial[]    findAll()
 * @method AgenteMaterial[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AgenteMaterialRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AgenteMaterial::class);
    }

    // /**
    //  * @return AgenteMaterial[] Returns an array of AgenteMaterial objects
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
    public function findOneBySomeField($value): ?AgenteMaterial
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
