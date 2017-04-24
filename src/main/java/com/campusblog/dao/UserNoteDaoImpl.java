package com.campusblog.dao;

import com.campusblog.entity.Usernote;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
@Repository
public class UserNoteDaoImpl implements UserNoteDao{
    @Resource
    UserNoteRepository userNoteRepository;
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Usernote save(Usernote articlenote) {
        return  userNoteRepository.save(articlenote);
    }

    @Override
    public List<Usernote> getUsernoteListbyhostuId(Integer hostuId) {
        String hql="from Usernote a where 1=1";
        if(hostuId!=null){
            hql=hql+" and a.hostuid="+hostuId;
        }
        hql=hql+" order by a.createTime asc";
        Query query = entityManager.createQuery(hql);
        List<Usernote> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public List<Usernote> getUsernotelistbyuId(Integer uId) {
        String hql="from Usernote a where 1=1";
        if(uId!=null){
            hql=hql+" and a.uId="+uId;
        }
        hql=hql+" order by a.createTime asc";
        Query query = entityManager.createQuery(hql);
        List<Usernote> resultList = query.getResultList();
        return resultList;
    }
}
