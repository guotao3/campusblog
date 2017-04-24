package com.campusblog.dao;

import com.campusblog.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2016/12/14.
 */
public interface UserDao {
    long getCounts(Integer uid, String fullname);
    List<User> getAll(Integer uid, String fullname,Integer begin, Integer pageSize);
    long getSuperCounts(Integer uid, String fullname);
    List<User> getSuperAll(Integer uid, String fullname,Integer begin, Integer pageSize);
    Integer getuseramount(String startDate,String endDate);
    List<User> gethotuser(Integer size);
}
