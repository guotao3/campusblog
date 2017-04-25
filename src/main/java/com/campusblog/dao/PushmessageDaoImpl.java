package com.campusblog.dao;

import com.campusblog.entity.Push;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by hasee on 2017/3/20.
 */
@Repository
public class PushmessageDaoImpl implements  PushmessageDao {

    @PersistenceContext
    private EntityManager entityManager;
    @Resource
    PushmesssageRepository pushmesssageRepository;
    @Override
    public Push getPushByPushId(Integer pushId) {
        return pushmesssageRepository.findOne(pushId);
    }

    @Override
    public Push saveOrUpdatePushByPushId(Push push) {
        return pushmesssageRepository.save(push);
    }

    @Override
    public List<Push> getPushlistByCondition(Integer uid, String importfont, Integer begin, Integer pageSize) {
        String hql="from  Push a where 1=1";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId Like "+tuid;
        }
        if(importfont!=null&&!importfont.isEmpty()){
            hql=hql+" and a.content Like '%"+importfont+"%'";
        }
        hql=hql+" order by createTime desc";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Push> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public long getCountPushlistByCondition(Integer uid, String importfont) {
        String hql="select count(1) from Push a where 1=1";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId Like "+tuid;
        }
        if(!importfont.isEmpty()){
            hql=hql+" and a.content Like '%"+importfont+"%'";
        }
        hql=hql+" order by createTime desc";
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }
}
