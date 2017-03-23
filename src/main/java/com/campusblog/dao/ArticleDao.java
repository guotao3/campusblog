package com.campusblog.dao;

import com.campusblog.entity.Article;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface ArticleDao {
     Article getArticleByarticleId(Integer articleId);
     Article saveOrUpdateArticleByArticleId(Article article);
     List<Article> getArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize);
     long getCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view);
     List<Article> getHotArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize);
     long getHotCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view);
     void del(Integer articleid);
     Integer getarticleamount(String startDate,String endDate);
}
