package com.campusblog.service;

import com.campusblog.entity.Img;

import java.util.List;

/**
 * Created by Administrator on 2016/12/15.
 */
public interface ImgService {
   public void del(Integer id);
   public void save(Img img);
   public Img getByImgId(Integer imgid);
   public List<Img> getAlbumDetail(Integer albumid,Integer pageNo, Integer pageSize);
   public Integer getimgamount(String startDate, String endDate);
   long getcounts(Integer albumid);
   long getcountsbyuserid(Integer uId);
   List<Img> getImgs(Integer uId, Integer pageNo, Integer pageSize);
}
