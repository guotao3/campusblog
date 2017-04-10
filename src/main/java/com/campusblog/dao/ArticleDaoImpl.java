package com.campusblog.dao;

import com.campusblog.entity.Article;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Repository
public class ArticleDaoImpl implements ArticleDao {
    @Override
    public void del(Integer articleid) {
        articleRepository.delete(articleid);
    }

    @Resource ArticleRepository articleRepository;
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public Article getArticleByarticleId(Integer articleId) {
        return articleRepository.findOne(articleId);
    }

    @Override
    public Article saveOrUpdateArticleByArticleId(Article article){
        return articleRepository.save(article);
    }

    @Override
    public List<Article> getArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize) {
        String hql="from Article a where 1=1";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId Like '%"+tuid+"%'";
        }
        if(!titile.isEmpty()){
            hql=hql+" and a.titile Like '%"+titile+"%'";
        }
        if(approve!=null){
            String tapprove = approve.toString().trim();
            hql=hql+" and a.approve ="+tapprove;
        }
        if(view!=null){
            hql=hql+" and a.view ="+view;
        }
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Article> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public long getCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view) {
        String hql="select count(1) from Article a where 1=1";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId Like '%"+tuid+"%'";
        }
        if(!titile.isEmpty()){
            hql=hql+" and a.titile Like '%"+titile+"%'";
        }
        if(approve!=null){
            String tapprove = approve.toString().trim();
            hql=hql+" and a.approve ="+tapprove;
        }
        if(view!=null){
            hql=hql+" and a.view ="+view;
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public List<Article> getHotArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view, Integer begin, Integer pageSize) {
        String hql="from Article a where a.approve>=100";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId Like '%"+tuid+"%'";
        }
        if(!titile.isEmpty()){
            hql=hql+" and a.titile Like '%"+titile+"%'";
        }
        if(approve!=null){
            String tapprove = approve.toString().trim();
            hql=hql+" and a.approve ="+tapprove;
        }
        if(view!=null){
            hql=hql+" and a.view ="+view;
        }
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Article> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public long getHotCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view) {
        String hql="select count(1) from Article a where a.approve>=100";
        if(uid!=null){
            String tuid = uid.toString().trim();
            hql=hql+" and a.uId Like '%"+tuid+"%'";
        }
        if(!titile.isEmpty()){
            hql=hql+" and a.titile Like '%"+titile+"%'";
        }
        if(approve!=null){
            String tapprove = approve.toString().trim();
            hql=hql+" and a.approve ="+tapprove;
        }
        if(view!=null){
            hql=hql+" and a.view ="+view;
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public Integer getarticleamount(String startDate, String endDate) {
        return articleRepository.getarticleamount(startDate,endDate);
    }

    @Override
    public Long getArticlecount(Integer uId) {
        String hql="select count(1) from Article a where 1=1";
        if(uId!=null){
            hql=hql+" and a.uId="+uId;
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public List<Article> getArtileListShow(Integer uId, Integer type, String front, Integer pageNo, Integer pageSize) {
        String hql="from Article a where 1=1";
        if(uId!=null){
            hql=hql+" and a.uId="+uId;
        }
        if(uId!=null||uId!=0){
            hql=hql+" and a.uId="+uId;
        }
        if(front!=null&&!front.isEmpty()){
            hql=hql+" and a.titile Like '%"+front+"%'";
        }
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(pageNo);
        query.setMaxResults(pageSize);
        List<Article> resultList = query.getResultList();
        return resultList;
    }
}
