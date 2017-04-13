package com.campusblog.service;

import com.campusblog.entity.Articlenote;

import java.util.List;

/**
 * Created by Administrator on 2017/4/13.
 */
public interface ArticleNoteService {
    Articlenote save(Articlenote articlenote);
    List<Articlenote> getArticlenoteListbyarticleId(Integer articleId);
    List<Articlenote> getArticlenotelistbyuId(Integer uId);

}
