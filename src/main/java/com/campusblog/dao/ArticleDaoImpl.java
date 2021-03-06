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
    @Resource
    ArticleApproverecordDao articleApproverecordDao;
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
        String hql="from Article a where 1=1";
        if(uid!=null&&uid!=0){
            hql=hql+" and a.uId = "+uid;
        }
        if(titile!=null&&!titile.isEmpty()){
            hql=hql+" and a.titile Like '%"+titile+"%'";
        }
        if(approve!=null&&approve!=0){
            String tapprove = approve.toString().trim();
            hql=hql+" and a.approve ="+tapprove;
        }
        if(view!=null&&view!=0){
            hql=hql+" and a.view ="+view;
        }
        hql = hql+" ORDER BY a.view DESC";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Article> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public long getHotCountArticlelistByCondition(Integer uid, String titile, Integer approve, Integer view) {
        String hql="select count(1) from Article a where 1=1";
        if(uid!=null&&uid!=0){
            hql=hql+" and a.uId = "+uid;
        }
        if(titile!=null&&!titile.isEmpty()){
            hql=hql+" and a.titile Like '%"+titile+"%'";
        }
        if(approve!=null&&approve!=0){
            String tapprove = approve.toString().trim();
            hql=hql+" and a.approve ="+tapprove;
        }
        if(view!=null&&view!=0){
            hql=hql+" and a.view ="+view;
        }
        hql = hql+" ORDER BY a.view DESC";
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public Integer getarticleamount(String startDate, String endDate) {
        java.sql.Date   begin=java.sql.Date.valueOf(startDate);
        java.sql.Date   end=java.sql.Date.valueOf(endDate);
        return articleRepository.getarticleamount(begin,end);
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
        int end = pageNo * pageSize;
        int begin = end - pageSize;
        String hql="from Article a where 1=1";
        if(uId!=null){
            hql=hql+" and a.uId="+uId;
        }
        if(type!=null&&type!=0){
            hql=hql+" and a.type="+type;
        }
        if(front!=null&&!front.isEmpty()){
            hql=hql+" and a.titile Like '%"+front+"%'";
        }
        hql = hql+" ORDER BY a.createTime DESC";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Article> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public Long getArticlecountByconditon(Integer uId, Integer type, String front) {
        String hql="select count(1) from Article a where 1=1";
        if(uId!=null){
            hql=hql+" and a.uId="+uId;
        }
        if(type!=null&&type!=0){
            hql=hql+" and a.type="+type;
        }
        if(front!=null&&!front.isEmpty()){
            hql=hql+" and a.titile Like '%"+front+"%'";
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public void addapprove(Integer articleId,Integer uId) {
        articleApproverecordDao.writerecord(articleId,uId);
    }

    @Override
    public Long getArticleNotecount(Integer articleId) {
        String hql="select count(1) from Articlenote a where 1=1";
        if(articleId!=null){
            hql=hql+" and a.articleId="+articleId;
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public Long gethotarticletotalpage() {
        String hql="select count(1) from Article";
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public List<Article> gethotArtileListShow(String font,String type,Integer pageNo, Integer pageSize) {
        int end = pageNo * pageSize;
        int begin = end - pageSize;
        String hql="from Article a where 1=1";
        if(font!=null&&!font.isEmpty()){
            hql=hql+" and a.titile Like '%"+font+"%'";
        }
        if(type!=null&&!type.isEmpty()){
            hql=hql+" and a.type="+type;
        }
        hql = hql+" ORDER BY a.view DESC";
        Query query = entityManager.createQuery(hql);
        query.setFirstResult(begin);
        query.setMaxResults(pageSize);
        List<Article> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public Long gethotarticleshowcount(String font) {
        String hql="select count(1) from Article a where 1=1";
        if(font!=null&&!font.isEmpty()){
            hql=hql+" and a.titile Like '%"+font+"%'";
        }
        Query query = entityManager.createQuery(hql);
        long counts = new BigInteger(query.getSingleResult().toString()).longValue();
        return  counts;
    }

    @Override
    public Integer getallarticlecount() {
        return new Integer(Long.toString(articleRepository.count()));
    }
}
