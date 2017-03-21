package com.campusblog.dao;

import com.campusblog.entity.Message;

import java.util.List;

/**
 * Created by Administrator on 2017/3/20.
 */
public interface CommunicateDao {
    Message getMessageByMessageId(Integer MessageId);
    Message saveOrUpdateMessageByMessageId(Message Message);
    List<Message> getMessagelistByCondition(Integer uid, Integer begin, Integer pageSize);
    long getCountMessagelistByCondition(Integer uid);
    void del(Integer Messageid);

}
