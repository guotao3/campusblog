package com.campusblog.service;

import com.campusblog.dao.PushmessageDao;
import com.campusblog.entity.Push;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hasee on 2017/3/20.
 */
@Service
public class PushmessageServiceImpl implements PushmessageService {
    @Resource
    PushmessageDao pushmessageDao;
    @Override
    public Push getPushByPushId(Integer pushId) {
        return pushmessageDao.getPushByPushId(pushId);
    }

    @Override
    public Push saveOrUpdatePushByPushId(Push push) {
        return pushmessageDao.saveOrUpdatePushByPushId(push);
    }

    @Override
    public List<Push> getPushlistByCondition(Integer uid, String importfont, Integer begin, Integer pageSize) {
        return pushmessageDao.getPushlistByCondition(uid,importfont,begin,pageSize);
    }

    @Override
    public long getCountPushlistByCondition(Integer uid, String importfont) {
        return pushmessageDao.getCountPushlistByCondition(uid,importfont);
    }
}
