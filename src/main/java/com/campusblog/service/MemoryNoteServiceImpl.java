package com.campusblog.service;

import com.campusblog.dao.MemoryNoteDao;
import com.campusblog.entity.MemorynoteTEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
@Service
public class MemoryNoteServiceImpl implements MemoryNoteService {
    @Resource
    MemoryNoteDao memoryNoteDao;

    @Override
    public void add(MemorynoteTEntity memorynoteTEntity) {
        memoryNoteDao.add(memorynoteTEntity);
    }

    @Override
    public List<MemorynoteTEntity> getmemorynotes(Integer uId) {
        return memoryNoteDao.getmemorynotes(uId);
    }

    @Override
    public void del(Integer memorynoteTEntityid) {
       memoryNoteDao.del(memorynoteTEntityid);
    }
}
