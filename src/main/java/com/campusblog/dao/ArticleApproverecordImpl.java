package com.campusblog.dao;

import com.campusblog.entity.ArticleApproveRecord;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/4/12.
 */
@Repository
public class ArticleApproverecordImpl implements ArticleApproverecordDao {
    @Resource
    ArticleApproverecordRepository articleApproverecordRepository;
    @Override
    public void writerecord(Integer articleId, Integer uId) {
        ArticleApproveRecord articleApproveRecord=new ArticleApproveRecord();
        articleApproveRecord.setuId(uId);
        articleApproveRecord.setArticleId(articleId);
        articleApproverecordRepository.save(articleApproveRecord);
    }

    @Override
    public List<ArticleApproveRecord> getuIds(Integer articleId) {
        return articleApproverecordRepository.getuIds(articleId);
    }
}
