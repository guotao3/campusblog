package com.campusblog.dao;

import com.campusblog.entity.ArticleApproveRecord;

import java.util.List;

/**
 * Created by Administrator on 2017/4/12.
 */
public interface ArticleApproverecordDao {
    void writerecord(Integer articleId,Integer uId);
    List<ArticleApproveRecord> getuIds(Integer articleId);
}
