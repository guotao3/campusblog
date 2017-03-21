package com.campusblog.dao;

import com.campusblog.entity.Message;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by Administrator on 2017/3/20.
 */
@Service
public class CommunicateDaoImpl implements CommunicateDao {
    @Resource
    MessageRepository messageRepository;
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public Message getMessageByMessageId(Integer MessageId) {
        return messageRepository.findOne(MessageId);
    }

    @Override
    public Message saveOrUpdateMessageByMessageId(Message Message) {
        return messageRepository.save(Message);
    }

    @Override
    public List<Message> getMessagelistByCondition(Integer uid, Integer begin, Integer pageSize) {
        String hql="from Message a where 1=1";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId = "+tuid;
        }
        hql=hql+" order by creatTime desc";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Message> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public long getCountMessagelistByCondition(Integer uid) {
        String hql="select count(1) from Message a where 1=1";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId = "+tuid;
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public void del(Integer Messageid) {
        messageRepository.delete(Messageid);
    }
}
