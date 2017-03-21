package com.campusblog.service;

import com.campusblog.dao.CommunicateDao;
import com.campusblog.entity.Message;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/20.
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Resource
    CommunicateDao communicateDao;
    @Override
    public Message getMessageByMessageId(Integer MessageId) {
        return communicateDao.getMessageByMessageId(MessageId);
    }

    @Override
    public Message saveOrUpdateMessageByMessageId(Message Message) {
        return communicateDao.saveOrUpdateMessageByMessageId(Message);
    }

    @Override
    public List<Message> getMessagelistByCondition(Integer uid, Integer begin, Integer pageSize) {
        return communicateDao.getMessagelistByCondition(uid,begin,pageSize);
    }

    @Override
    public long getCountMessagelistByCondition(Integer uid) {
        return communicateDao.getCountMessagelistByCondition(uid);
    }

    @Override
    public void del(Integer Messageid) {
        communicateDao.del(Messageid);
    }
}
