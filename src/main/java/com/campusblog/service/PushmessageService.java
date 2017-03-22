package com.campusblog.service;

import com.campusblog.entity.Push;

import java.util.List;

/**
 * Created by hasee on 2017/3/20.
 */
public interface PushmessageService {
    Push getPushByPushId(Integer pushId);
    Push saveOrUpdatePushByPushId(Push push);
    List<Push> getPushlistByCondition(Integer uid, String importfont, Integer begin, Integer pageSize);
    long getCountPushlistByCondition(Integer uid, String importfont);
}
