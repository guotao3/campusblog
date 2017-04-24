package com.campusblog.dao;

import com.campusblog.entity.Usernote;

import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
public interface UserNoteDao {
    Usernote save(Usernote articlenote);
    List<Usernote> getUsernoteListbyhostuId(Integer hostuId);
    List<Usernote> getUsernotelistbyuId(Integer uId);
}
