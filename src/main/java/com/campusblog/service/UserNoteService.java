package com.campusblog.service;

import com.campusblog.entity.Usernote;

import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
public interface UserNoteService {
    Usernote save(Usernote usernote);
    List<Usernote> getUsernoteListbyhostuId(Integer hostuId);
    List<Usernote> getUsernotelistbyuId(Integer uId);
    Integer getusernoteamount(String startDate,String endDate);
}
