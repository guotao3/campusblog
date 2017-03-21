package com.campusblog.dao;

import com.campusblog.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2016/12/13.
 */
public interface UserRepository extends CrudRepository<User,Integer> {
    @Query("select u from User u where u.uId=?1 and u.password=?2")
    User findUser(Integer uid,String password);
}
