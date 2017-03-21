package com.campusblog.dao;

import com.campusblog.entity.Img;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by Administrator on 2016/12/28.
 */
@Repository
public class ImgDaoImpl implements ImgDao {
    @Override
    public void del(Integer albumid) {
        String hql = "delete from Img a where a.ablum.id=:a";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a", albumid);
        query.executeUpdate();
    }


    @Override
    public long getcounts(Integer albumid) {
        String hql="select count(1) from Img a where a.ablum.id=:a";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a",albumid);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return counts;
    }

    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<Img> getAlbumDetail(Integer albumid,Integer pageNo, Integer pageSize) {
        int end = pageNo * pageSize;
        int begin = end - pageSize;
        String hql="select defimg from Img defimg where defimg.ablum.id=:a";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a",albumid);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List imglist = query.getResultList();
        return imglist;
    }
}
