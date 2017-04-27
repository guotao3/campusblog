package com.campusblog.dao;

import com.campusblog.entity.Usernote;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.sql.Date;

/**
 * Created by hasee on 2017/4/16.
 */
public interface UserNoteRepository extends CrudRepository<Usernote,Integer> {
    @Query("select count (1) from Usernote u where u.createTime >=?1 and u.createTime <=?2")
    Integer getusernoteamount(Date startDate, Date endDate);
}
