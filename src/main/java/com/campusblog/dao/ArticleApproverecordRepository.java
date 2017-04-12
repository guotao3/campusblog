package com.campusblog.dao;

import com.campusblog.entity.ArticleApproveRecord;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2017/4/12.
 */
public interface ArticleApproverecordRepository extends CrudRepository<ArticleApproveRecord,Integer> {
    @Query("from ArticleApproveRecord a where a.articleId=?1")
    List<ArticleApproveRecord> getuIds(Integer articleId);
}
