package com.campusblog.dao;

import com.campusblog.entity.MemorynoteTEntity;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
@Repository
public class MemoryNoteDaoImpl implements MemoryNoteDao {
    @Resource
    MemoryNoteRepository memoryNoteRepository;
    @Override
    public void add(MemorynoteTEntity memorynoteTEntity) {
        memoryNoteRepository.save(memorynoteTEntity);
    }

    @Override
    public List<MemorynoteTEntity> getmemorynotes(Integer uId) {
        return memoryNoteRepository.getmemorynotes(uId);
    }

    @Override
    public void del(Integer memorynoteTEntityid) {
        memoryNoteRepository.delete(memorynoteTEntityid);
    }
}
