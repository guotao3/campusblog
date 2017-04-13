package com.campusblog.service;

import com.campusblog.dao.ArticleApproverecordDao;
import com.campusblog.dao.ArticleDao;
import com.campusblog.dao.ArticleRepository;
import com.campusblog.dao.ViewRecordDao;
import com.campusblog.entity.Article;
import com.campusblog.entity.ArticleApproveRecord;
import com.campusblog.entity.ViewRecord;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
    @Resource
    ArticleApproverecordDao articleApproverecordDao;
    @Resource
    ViewRecordDao viewRecordDao;

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

    @Override
    public Long getArticlecount(Integer uId) {
        return articleDao.getArticlecount(uId);
    }

    @Override
    public List<Article> getArtileListShow(Integer uId, Integer type, String front, Integer pageNo, Integer pageSize) {
        return articleDao.getArtileListShow(uId,type,front,pageNo,pageSize);
    }

    @Override
    public Long getArticlecountByconditon(Integer uId, Integer type, String front) {
        return articleDao.getArticlecountByconditon(uId,type,front);
    }

    @Override
    public void addapprove(Integer articleId,Integer uId) {
        Article article = articleDao.getArticleByarticleId(articleId);
        Integer approve = article.getApprove()+1;
        article.setApprove(approve);
        articleDao.saveOrUpdateArticleByArticleId(article);
        articleDao.addapprove(articleId,uId);
    }

    @Override
    public List<Integer> getuIds(Integer articleId) {
        List<Integer> ids = new ArrayList<>();
        List<ArticleApproveRecord> articleApproveRecords = articleApproverecordDao.getuIds(articleId);
        for (ArticleApproveRecord a:articleApproveRecords
             ) {
            ids.add(a.getuId());
        }
        return ids;
    }

    @Override
    public List<Integer> getviewuIds(Integer articleId) {
        List<Integer> ids = new ArrayList<>();
        List<ViewRecord> viewRecords = viewRecordDao.getuIds(articleId);
        for (ViewRecord a:viewRecords
                ) {
            ids.add(a.getuId());
        }
        return ids;
    }

    @Override
    public void addview(Integer articleId, Integer uId) {
        Article article = articleDao.getArticleByarticleId(articleId);
        if(article!=null) {
            if(article.getView()==null){
                article.setView(0);
            }
                Integer view = article.getView() + 1;
                article.setView(view);
                articleDao.saveOrUpdateArticleByArticleId(article);
                viewRecordDao.writerecord(articleId, uId);
        }
    }
}
