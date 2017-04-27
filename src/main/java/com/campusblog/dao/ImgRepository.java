package com.campusblog.dao;

import com.campusblog.entity.Img;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.sql.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/12/15.
 */
public interface ImgRepository extends CrudRepository<Img,Integer> {
    @Query("select count (1) from Img i where i.createTime >=?1 and i.createTime <=?2")
    Integer getimgamount(Date startDate, Date endDate);
}

