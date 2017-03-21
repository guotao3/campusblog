package com.campusblog.dao;

import com.campusblog.entity.Img;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/12/15.
 */
public interface ImgRepository extends CrudRepository<Img,Integer> {
    @Query("delete from Img as i where i.id=?1")
    void del(Integer ImgID);
}

