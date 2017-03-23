package com.campusblog.service;

import com.campusblog.dao.UserDao;
import com.campusblog.dao.UserRepository;
import com.campusblog.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/13.
 */
@Service
public class UserServiceImpl implements UserService {
    @Override
    public long getSuperCounts(Integer uid, String fullname) {
        return userDao.getSuperCounts(uid,fullname);
    }

    @Override
    public List<User> getSuperUserPage(Integer uid, String fullname, Integer begin, Integer pageSize) {
        return userDao.getSuperAll(uid,fullname,begin,pageSize);
    }

    @Override
    public void delUserByuIds(String ids) {
        String [] strings = ids.split(",");
        for (String id : strings) {
            userRepository.delete(Integer.parseInt(id));
        }
    }

    @Override
    public void del(Integer uId) {
        userRepository.delete(uId);
    }

    @Override
    public User getUserById(Integer uid) {
        return userRepository.findOne(uid);
    }

    @Override
    public void saveOrUpdate(User user) {

        userRepository.save(user);
    }

    @Resource
    UserDao userDao;
    @Override
    public List<User> getUserPage(Integer uid, String fullname,Integer begin, Integer pageSize) {
        return userDao.getAll(uid,fullname,begin,pageSize);
    }

    @Override
    public long getCounts(Integer uid, String fullname) {
        return userDao.getCounts(uid,fullname);
    }

    @Resource
    UserRepository userRepository;
    @Override
    public User getone(Integer uId,String password) {
        return userRepository.findUser(uId,password);
    }

    @Override
    public Integer getuseramount(String startDate, String endDate) {
        return userDao.getuseramount(startDate,endDate);
    }
}
