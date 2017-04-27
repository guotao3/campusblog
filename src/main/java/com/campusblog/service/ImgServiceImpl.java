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
        imgRepository.delete(id);
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

    @Resource
    ImgRepository imgRepository;
    @Override
    public void save(Img img) {
        imgRepository.save(img);
    }

    @Override
    public Integer getimgamount(String startDate, String endDate) {
        java.sql.Date   begin=java.sql.Date.valueOf(startDate);
        java.sql.Date   end=java.sql.Date.valueOf(endDate);
        return imgRepository.getimgamount(begin,end);
    }

    @Override
    public long getcounts(Integer albumid) {
        return imgDao.getcounts(albumid);
    }

    @Override
    public long getcountsbyuserid(Integer uId) {
        return imgDao.getcountsbyuserid(uId);
    }

    @Override
    public List<Img> getImgs(Integer uId, Integer pageNo, Integer pageSize) {
        return imgDao.getImgs(uId,pageNo,pageSize);
    }

    @Override
    public List<Img> gethotImgs(Integer pageNo, Integer pageSize) {
        return imgDao.gethotImgs(pageNo,pageSize);
    }

    @Override
    public Long gethotImgscount() {
        return imgDao.gethotImgscount();
    }
}
