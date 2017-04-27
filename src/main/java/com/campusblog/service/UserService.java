package com.campusblog.service;

import com.campusblog.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2016/12/13.
 */
public interface UserService {
   public User getone(Integer uId,String password);
   public long getCounts(Integer uid, String fullname);
   public List<User> getUserPage(Integer uid, String fullname,Integer begin, Integer pageSize);
   public void saveOrUpdate(User user);
   public User getUserById(Integer uid);
   public void del(Integer uId);
   public void delUserByuIds(String ids);
   public long getSuperCounts(Integer uid, String fullname);
   public List<User> getSuperUserPage(Integer uid, String fullname,Integer begin, Integer pageSize);
   Integer getuseramount(String startDate,String endDate);
   Integer getalluserscount();
   public List<User> gethotuser(Integer size);
//front
   List<User> gethotusers(Integer pageNo,Integer pageSize);
   Long gethotuserscount();
}
