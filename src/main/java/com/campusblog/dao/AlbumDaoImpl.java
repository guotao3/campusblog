package com.campusblog.dao;

import com.campusblog.entity.Album;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by Administrator on 2016/12/26.
 */
@Service
public class AlbumDaoImpl implements AlbumDao {
    @Override
    public void del(Integer albumid) {
        String hql="delete from Album as a where a.id=:t";
        Query query = entityManager.createQuery(hql);
        query.setParameter("t",albumid);
        query.executeUpdate();
    }

    @Resource
    ImgDao imgDao;
    public void delimg(Integer albumid){
        imgDao.del(albumid);
    }

    @Resource
    AlbumRepository albumRepository;
    @Override
    public Long getPageCounts(Integer uid) {
        String hql="select count(1) from Album a where 1=1";
        if (uid != 0) {
            hql = hql + " and a.uid=" + uid;
        }
        else {
            long count = albumRepository.count();
            return count;
        }

        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return counts;
    }

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Album> getAlbumAll(Integer uid, Integer pageNo, Integer pageSize) {
        int end = pageNo * pageSize;
        int begin = end - pageSize;
        String hql="from Album a where 1=1";
        if (uid != 0) {
            hql = hql + " and a.uid=" + uid;
        }
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Album> resultList = query.getResultList();
        return resultList;

    }
}
