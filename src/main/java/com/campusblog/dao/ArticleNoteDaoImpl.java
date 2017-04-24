package com.campusblog.dao;

import com.campusblog.entity.Articlenote;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Administrator on 2017/4/13.
 */
@Repository
public class ArticleNoteDaoImpl implements ArticleNoteDao {

    @PersistenceContext
    private EntityManager entityManager;
    @Resource
    ArticleNoteRespository articleNoteRespository;

    @Override
    public Articlenote save(Articlenote articlenote) {
        return articleNoteRespository.save(articlenote);
    }

    @Override
    public List<Articlenote> getArticlenoteListbyarticleId(Integer articleId) {
        String hql="from Articlenote a where 1=1";
        if(articleId!=null){
            hql=hql+" and a.articleId="+articleId;
        }
        hql=hql+" order by a.createTime asc";
        Query query = entityManager.createQuery(hql);
        List<Articlenote> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public List<Articlenote> getArticlenotelistbyuId(Integer uId) {
        String hql="from Articlenote a where 1=1";
        if(uId!=null){
            hql=hql+" and a.uId="+uId;
        }
        hql=hql+" order by a.createTime asc";
        Query query = entityManager.createQuery(hql);
        List<Articlenote> resultList = query.getResultList();
        return resultList;
    }
}
