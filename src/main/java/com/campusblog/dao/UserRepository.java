package com.campusblog.dao;

import com.campusblog.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.sql.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/12/13.
 */
public interface UserRepository extends CrudRepository<User,Integer> {
    @Query("select u from User u where u.uId=?1 and u.password=?2")
    User findUser(Integer uid,String password);
    @Query("select (1) from User u where u.createTime>=?1 and u.createTime <=?2")
    Integer getuseramount(Date startDate, Date endDate);
}
