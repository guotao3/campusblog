package com.campusblog.service;

import com.campusblog.dao.ImgDao;
import com.campusblog.dao.ImgRepository;
import com.campusblog.entity.Img;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/15.
 */
@Service
public class ImgServiceImpl implements ImgService {
    @Override
    public void del(Integer id) {
        imgRepository.del(id);
    }

    @Resource
    ImgDao imgDao;
    @Override
    public List<Img> getAlbumDetail(Integer albumid,Integer pageNo, Integer pageSize) {
        return imgDao.getAlbumDetail(albumid,pageNo,pageSize);
    }

    @Override
    public Img getByImgId(Integer imgid) {
        return imgRepository.findOne(imgid);
    }

    @Override
    public Img getByAlbumId(Integer albumid) {
        return imgRepository.findOne(albumid);
    }

    @Resource
    ImgRepository imgRepository;
    @Override
    public void save(Img img) {
        imgRepository.save(img);
    }

    @Override
    public Integer getimgamount(String startDate, String endDate) {
        return imgRepository.getimgamount(startDate,endDate);
    }
}
