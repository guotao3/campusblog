package com.campusblog.dao;

import com.campusblog.entity.Album;

import java.util.List;

/**
 * Created by Administrator on 2016/12/26.
 */
public interface AlbumDao {
    public List<Album> getAlbumAll(Integer uid, Integer pageNo,Integer pageSize);
    public Long getPageCounts(Integer uid);
    public void del(Integer albumid);
}
