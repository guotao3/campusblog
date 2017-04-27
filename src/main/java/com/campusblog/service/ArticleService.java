package com.campusblog.service;

import com.campusblog.entity.Article;
import com.campusblog.entity.ArticleApproveRecord;
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
    Integer getarticleamount(String startDate,String endDate);
    Integer getallarticlecount();
    /*front*/
    Long getArticlecount(Integer uId);
    List<Article> getArtileListShow(Integer uId,Integer type,String front,Integer pageNo,Integer pageSize);
    Long getArticlecountByconditon(Integer uId,Integer type,String front);
    void addapprove(Integer articleId,Integer uId);
    Long getArticleNotecount(Integer articleId);
    List<Article> gethotArtileListShow(String font,Integer pageNo, Integer pageSize);
    Long gethotarticleshowcount(String font);
    //手机端获取
    Long gethotarticletotalpage();


    //判断是否点过赞
    List<Integer> getuIds(Integer articleId);
    List<Integer> getviewuIds(Integer articleId);
    void addview(Integer articleId,Integer uId);
}
