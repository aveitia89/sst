<?php

namespace App\Repository;

use App\Entity\PartesDelCuerpoLesionado;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method ParteDelCuerpoLesionado|null find($id, $lockMode = null, $lockVersion = null)
 * @method ParteDelCuerpoLesionado|null findOneBy(array $criteria, array $orderBy = null)
 * @method ParteDelCuerpoLesionado[]    findAll()
 * @method ParteDelCuerpoLesionado[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PartesDelCuerpoLesionadoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PartesDelCuerpoLesionado::class);
    }

    // /**
    //  * @return ParteDelCuerpoLesionado[] Returns an array of ParteDelCuerpoLesionado objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ParteDelCuerpoLesionado
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
