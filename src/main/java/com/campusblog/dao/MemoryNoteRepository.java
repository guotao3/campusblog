package com.campusblog.dao;

import com.campusblog.entity.MemorynoteTEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
public interface MemoryNoteRepository extends CrudRepository<MemorynoteTEntity,Integer> {
    @Query("from MemorynoteTEntity c where c.uId =?1 ")
    List<MemorynoteTEntity> getmemorynotes(Integer uId);
}
