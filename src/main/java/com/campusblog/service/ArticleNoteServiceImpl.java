package com.campusblog.service;

import com.campusblog.dao.ArticleNoteDao;
import com.campusblog.entity.Articlenote;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/4/13.
 */
@Service
public class ArticleNoteServiceImpl implements ArticleNoteService {
    @Resource
    ArticleNoteDao articleNoteDao;

    @Override
    public Articlenote save(Articlenote articlenote) {
        return articleNoteDao.save(articlenote);
    }

    @Override
    public List<Articlenote> getArticlenoteListbyarticleId(Integer articleId) {
        return articleNoteDao.getArticlenoteListbyarticleId(articleId);
    }

    @Override
    public List<Articlenote> getArticlenotelistbyuId(Integer uId) {
        return articleNoteDao.getArticlenotelistbyuId(uId);
    }
}
