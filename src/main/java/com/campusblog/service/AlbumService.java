package com.campusblog.service;

import com.campusblog.entity.Album;

import java.util.List;

/**
 * Created by Administrator on 2016/12/26.
 */
public interface AlbumService {
    public Album getone(Integer id);
    public List<Album> getAlbumAll(Integer uid, Integer pageNo, Integer pageSize);
    public Long getCounts(Integer uid);
    public long getdetailcounts(Integer albumid);
    public void del(Integer albumid);
    void save(Album album);
}
