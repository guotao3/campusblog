package com.campusblog.dao;

import com.campusblog.entity.Feedback;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by Administrator on 2017/3/17.
 */
@Repository
public class FeedbackDaoImpl implements FeedbackDao {

    @PersistenceContext
    private EntityManager entityManager;
    @Resource
    FeedbackRepository feedbackRepository;
    @Override
    public Feedback getFeedbackByFeedbackId(Integer feedbackid) {
        return feedbackRepository.findOne(feedbackid);
    }

    @Override
    public Feedback saveOrUpdateFeedbackByFeedbackId(Feedback feedback) {
        return feedbackRepository.save(feedback);
    }

    @Override
    public List<Feedback> getFeedbacklistByCondition(Integer uid, String importfont, Integer begin, Integer pageSize) {
        String hql="from Feedback a where 1=1";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId Like "+tuid;
        }
        if(!importfont.isEmpty()){
            hql=hql+" and a.content Like '%"+importfont+"%'";
        }
        hql=hql+" order by createTime desc";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Feedback> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public long getCountFeedbacklistByCondition(Integer uid, String importfont) {
        String hql="select count(1) from Feedback a where 1=1";
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

    @Override
    public Integer getfeedbackamount(String startDate, String endDate) {
        return feedbackRepository.getfeedbackamount(startDate,endDate);
    }
}
