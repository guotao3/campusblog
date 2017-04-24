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
    Integer getimgamount(String startDate,String endDate);
    long getcountsbyuserid(Integer uId);
    /*获取最近图片*/
    List<Img> getImgs(Integer uId,Integer pageNo, Integer pageSize);
    /*获取热门图片*/
    List<Img> gethotImgs(Integer pageNo, Integer pageSize);
    Long gethotImgscount();


}
