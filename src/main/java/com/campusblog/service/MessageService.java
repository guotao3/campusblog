package com.campusblog.service;

import com.campusblog.entity.Message;

import java.util.List;

/**
 * Created by Administrator on 2017/3/20.
 */
public interface MessageService {
    Message getMessageByMessageId(Integer MessageId);
    Message saveOrUpdateMessageByMessageId(Message Message);
    List<Message> getMessagelistByCondition(Integer uid, Integer begin, Integer pageSize);
    long getCountMessagelistByCondition(Integer uid);
    void del(Integer Messageid);
}
