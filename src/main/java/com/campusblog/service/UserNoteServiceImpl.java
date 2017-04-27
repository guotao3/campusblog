package com.campusblog.service;

import com.campusblog.dao.UserNoteDao;
import com.campusblog.entity.Usernote;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
@Service
public class UserNoteServiceImpl implements UserNoteService {
    @Resource
    UserNoteDao userNoteDao;

    @Override
    public Usernote save(Usernote usernote) {
        return userNoteDao.save(usernote);
    }

    @Override
    public List<Usernote> getUsernoteListbyhostuId(Integer hostuId) {
        return userNoteDao.getUsernoteListbyhostuId(hostuId);
    }

    @Override
    public List<Usernote> getUsernotelistbyuId(Integer uId) {
        return userNoteDao.getUsernotelistbyuId(uId);
    }

    @Override
    public Integer getusernoteamount(String startDate, String endDate) {
        return userNoteDao.getusernoteamount(startDate,endDate);
    }
}
