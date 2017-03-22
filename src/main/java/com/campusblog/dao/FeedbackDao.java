package com.campusblog.dao;

import com.campusblog.entity.Feedback;

import java.util.List;

/**
 * Created by Administrator on 2017/3/17.
 */
public interface FeedbackDao {
    Feedback getFeedbackByFeedbackId(Integer FeedbackId);
    Feedback saveOrUpdateFeedbackByFeedbackId(Feedback Feedback);
    List<Feedback> getFeedbacklistByCondition(Integer uid, String importfont, Integer begin, Integer pageSize);
    long getCountFeedbacklistByCondition(Integer uid, String importfont);

}
