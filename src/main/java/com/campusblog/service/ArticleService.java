package com.campusblog.service;

import com.campusblog.entity.Article;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public interface ArticleService {
    Article getArticleByarticleId(Integer articleId);
    Article saveOrUpdateArticleByArticleId(Article article);
    List<Article> getArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize);
    long getCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view);
    List<Article> getHotArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize);
    long getHotCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view);
    void del(Integer articleid);
    void  delbyarticleIds(String ids);
}
