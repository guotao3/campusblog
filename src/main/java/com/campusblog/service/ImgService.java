package com.campusblog.service;

import com.campusblog.entity.Img;

import java.util.List;

/**
 * Created by Administrator on 2016/12/15.
 */
public interface ImgService {
   public void del(Integer id);
   public void save(Img img);
   public Img getByAlbumId(Integer albumid);
   public Img getByImgId(Integer imgid);
   public List<Img> getAlbumDetail(Integer albumid,Integer pageNo, Integer pageSize);
}
