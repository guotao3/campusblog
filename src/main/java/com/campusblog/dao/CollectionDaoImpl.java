package com.campusblog.dao;

import com.campusblog.entity.CollectionTEntity;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
@Repository
public class CollectionDaoImpl implements CollectionDao{
    @PersistenceContext
    private EntityManager entityManager;
    @Resource
    CollectionRespository collectionRespository;

    @Override
    public void add(CollectionTEntity collectionTEntity) {
        collectionRespository.save(collectionTEntity);
    }

    @Override
    public List<CollectionTEntity> getcollections(Integer uId) {
        return collectionRespository.getcollections(uId);
    }

    @Override
    public void del(Integer collectionid) {
         collectionRespository.delete(collectionid);
    }

    @Override
    public List<Integer> gethotcollection(Integer size) {
        String hql="select c.articleId from CollectionTEntity c  order by c.createTime asc";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(size);
        List<Integer> resultList = query.getResultList();
        return resultList;

    }
}
