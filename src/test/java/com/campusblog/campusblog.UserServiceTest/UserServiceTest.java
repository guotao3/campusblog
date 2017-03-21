package com.campusblog.UserServiceTest;

import com.campusblog.entity.User;
import com.campusblog.service.UserService;
import com.campusblog.utils.Datatool;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.data.auditing.CurrentDateTimeProvider;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:bean.xml")
public class UserServiceTest {
    @Resource
    UserService userService;
    @Test
    public void login(){
        User user = userService.getone(1, "1");
        System.out.println(user.toString());
    }

    @Test
    public void getAllcount(){
        long counts = userService.getCounts(0, "大大");
        System.out.println(counts);
    }

    @Test
    public void getAllpage(){
        List<User> userPage = userService.getUserPage(1,"大大",0,1);
        for (User u:userPage
                ) {
            System.out.println(u.toString());
        }
    }

    @Test
    public void findonebyId(){
        User user = userService.getUserById(1340610227);
            user.setLove(2);
        userService.saveOrUpdate(user);
            System.out.println(user.toString());
    }
    @Test
    public void saveUser(){
        User user = new User();
        user.setuId(4);
        user.setFullname("中中");
        user.setdescription("0000");
        Date dt=new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.sql.Timestamp dateTime = new java.sql.Timestamp(dt.getTime());
        System.out.println(dateTime.getTime());
        user.setCreateTime(dateTime);
        System.out.println(user.toString());
        userService.saveOrUpdate(user);
        System.out.println(user.toString());
    }

    @Test
    public void datatool(){
    }
}

