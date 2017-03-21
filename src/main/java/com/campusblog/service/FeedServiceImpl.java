package com.campusblog.service;

import com.campusblog.dao.FeedbackDao;
import com.campusblog.entity.Feedback;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/17.
 */
@Service
public class FeedServiceImpl implements FeedbackService {
    @Resource
    FeedbackDao feedbackDao;
    @Override
    public Feedback getFeedbackByFeedbackId(Integer FeedbackId) {
        return feedbackDao.getFeedbackByFeedbackId(FeedbackId);
    }

    @Override
    public Feedback saveOrUpdateFeedbackByFeedbackId(Feedback Feedback) {
        return feedbackDao.saveOrUpdateFeedbackByFeedbackId(Feedback);
    }

    @Override
    public List<Feedback> getFeedbacklistByCondition(Integer uid, String importfont, Integer begin, Integer pageSize) {
        return feedbackDao.getFeedbacklistByCondition(uid,importfont,begin,pageSize);
    }

    @Override
    public long getCountFeedbacklistByCondition(Integer uid, String importfont) {
        return feedbackDao.getCountFeedbacklistByCondition(uid,importfont);
    }
}
