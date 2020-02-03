<?php

namespace App\Repository;

use App\Entity\Medicamento;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Medicamento|null find($id, $lockMode = null, $lockVersion = null)
 * @method Medicamento|null findOneBy(array $criteria, array $orderBy = null)
 * @method Medicamento[]    findAll()
 * @method Medicamento[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MedicamentoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Medicamento::class);
    }

    // /**
    //  * @return Medicamento[] Returns an array of Medicamento objects
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
    public function findOneBySomeField($value): ?Medicamento
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
