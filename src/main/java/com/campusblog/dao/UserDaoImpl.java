package com.campusblog.dao;

import com.campusblog.entity.User;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by Administrator on 2016/12/14.
 */
@Repository
public class UserDaoImpl implements UserDao{
    @PersistenceContext
    private EntityManager entityManager;
    @Resource
    UserRepository userRepository;
    @Override
    public long getSuperCounts(Integer uid, String fullname) {
        String hql="select count(1) from User u where 1=1  and u.role=1";
        if (uid != 0) {
            hql = hql + " and u.uId=" + uid;
        }

        if(fullname!=null&&!fullname.trim().isEmpty()){
            hql=hql+" and u.fullname like '%"+fullname+"%'";
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return counts;
    }

    @Override
    public List<User> getSuperAll(Integer uid, String fullname, Integer begin, Integer pageSize) {
        String hql="from User u where 1=1 and u.role=1";
        if (uid != 0) {
            hql = hql + " and u.uId=" + uid;
        }
        if(fullname!=null&&!fullname.trim().isEmpty()){
            hql=hql+" and u.fullname Like '%"+fullname+"%'";
        }
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<User> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public long getCounts(Integer uid, String fullname) {
        String hql="select count(1) from User u where 1=1";
        if (uid != 0) {
            hql = hql + " and u.uId=" + uid;
        }

        if(fullname!=null&&!fullname.trim().isEmpty()){
            hql=hql+" and u.fullname like '%"+fullname+"%'";
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return counts;
    }

    @Override
    public List<User> getAll(Integer uid, String fullname,Integer begin, Integer pageSize) {
        String hql="from User u where 1=1";
        if (uid != 0) {
            hql = hql + " and u.uId=" + uid;
        }
        if(fullname!=null&&!fullname.trim().isEmpty()){
            hql=hql+" and u.fullname Like '%"+fullname+"%'";
        }
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<User> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public Integer getuseramount(String startDate, String endDate) {
        return userRepository.getuseramount(startDate,endDate);
    }

    @Override
    public List<User> gethotuser(Integer size) {
        String hql="from User u order by u.focus desc";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(4);
        List<User> resultList = query.getResultList();
        return resultList;
    }
}
