package com.campusblog.dao;

import com.campusblog.entity.MemorynoteTEntity;

import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
public interface MemoryNoteDao {
    void add(MemorynoteTEntity memorynoteTEntity);
    List<MemorynoteTEntity> getmemorynotes(Integer uId);
    void  del(Integer memorynoteTEntityid);
}
