package com.campusblog.service;

import com.campusblog.dao.AlbumDao;
import com.campusblog.dao.AlbumRepository;
import com.campusblog.dao.ImgDao;
import com.campusblog.entity.Album;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/26.
 */
@Service
public class AlbumServiceImp implements AlbumService {
    @Override
    public void del(Integer albumid) {
        //在图片表里删除albumid = 删除图片
        imgDao.del(albumid);
        //在相册表里删除id = 删除图片
        albumDao.del(albumid);
    }

    @Override
    public long getdetailcounts(Integer albumid) {
        return imgDao.getcounts(albumid);
    }

    @Override
    public Long getCounts(Integer uid) {
        return  albumDao.getPageCounts(uid);
    }

    @Override
    public List<Album> getAlbumAll(Integer uid, Integer pageNo, Integer pageSize) {
        return albumDao.getAlbumAll(uid, pageNo, pageSize);
    }

    @Resource
    AlbumDao albumDao;
    @Resource
    ImgDao imgDao;
    @Resource
    AlbumRepository albumRepository;
    @Override
    public Album getone(Integer id) {
        return albumRepository.findOne(id);
    }
}
