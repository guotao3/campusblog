package com.campusblog.service;

import com.campusblog.dao.ArticleDao;
import com.campusblog.dao.ArticleRepository;
import com.campusblog.entity.Article;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Override
    public void delbyarticleIds(String ids) {
        String [] strings = ids.split(",");
        for (String id : strings) {
            articleRepository.delete(Integer.parseInt(id));
        }
    }

    @Resource
    ArticleRepository articleRepository;
    @Override
    public void del(Integer articleid) {
        articleRepository.delete(articleid);
    }

    @Resource
    ArticleDao articleDao;
    @Override
    public Article getArticleByarticleId(Integer articleId) {
        return articleDao.getArticleByarticleId(articleId);
    }

    @Override
    public Article saveOrUpdateArticleByArticleId(Article article) {
        return articleDao.saveOrUpdateArticleByArticleId(article);
    }

    @Override
    public List<Article> getArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize) {
        return articleDao.getArticlelistByCondition(uid,titile,approve,view,begin,pageSize);
    }

    @Override
    public long getCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view) {
        return articleDao.getCountArticlelistByCondition(uid,titile,approve,view);
    }

    @Override
    public List<Article> getHotArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize) {
        return articleDao.getHotArticlelistByCondition(uid,titile,approve,view,begin,pageSize);
    }

    @Override
    public long getHotCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view) {
        return articleDao.getHotCountArticlelistByCondition(uid,titile,approve,view);
    }

    @Override
    public Integer getarticleamount(String startDate, String endDate) {
        return articleDao.getarticleamount(startDate,endDate);
    }
}
