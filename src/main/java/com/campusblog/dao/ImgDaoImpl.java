package com.campusblog.dao;

import com.campusblog.entity.Img;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
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
    @Resource
    ImgRepository imgRepository;
    @Override
    public void del(Integer albumid) {
        String hql = "delete from Img a where a.albumId=:a";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a", albumid);
        query.executeUpdate();
    }


    @Override
    public long getcounts(Integer albumid) {
        String hql="select count(1) from Img a where a.albumId=:a";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a",albumid);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return counts;
    }

    @Override
    public long getcountsbyuserid(Integer uId) {
        String hql="select count(1) from Img a where a.uId=:a";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a",uId);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return counts;
    }

    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<Img> getAlbumDetail(Integer albumid,Integer pageNo, Integer pageSize) {
        int end = pageNo * pageSize;
        int begin = end - pageSize;
        String hql="select d from Img d where d.albumId=:a";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a",albumid);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List imglist = query.getResultList();
        return imglist;
    }

    @Override
    public Integer getimgamount(String startDate, String endDate) {
        return imgRepository.getimgamount(startDate,endDate);
    }

    @Override
    public List<Img> getImgs(Integer uId, Integer pageNo, Integer pageSize) {
        int end = pageNo * pageSize;
        int begin = end - pageSize;
        String hql="select i from Img i where i.uId=:a";
        hql = hql+" ORDER BY i.createTime DESC";
        Query query = entityManager.createQuery(hql);
        query.setParameter("a",uId);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List imglist = query.getResultList();
        return imglist;
    }

    @Override
    public List<Img> gethotImgs(Integer pageNo, Integer pageSize) {
        int end = pageNo * pageSize;
        int begin = end - pageSize;
        String hql="select i from Img i";
        hql = hql+" ORDER BY i.approve DESC";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List imglist = query.getResultList();
        return imglist;
    }

    @Override
    public Long gethotImgscount() {
        String hql="select count(1) from Img";
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return counts;
    }
}
