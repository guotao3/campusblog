package com.campusblog.dao;

import com.campusblog.entity.Img;

import java.util.List;

/**
 * Created by Administrator on 2016/12/28.
 */
public interface ImgDao {
    List<Img> getAlbumDetail(Integer albumid,Integer pageNo, Integer pageSize);
    long getcounts(Integer albumid);
    void del(Integer albumid);
}
