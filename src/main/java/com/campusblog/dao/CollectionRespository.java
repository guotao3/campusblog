package com.campusblog.dao;

import com.campusblog.entity.CollectionTEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
public interface CollectionRespository extends CrudRepository<CollectionTEntity,Integer> {
    @Query("from CollectionTEntity c where c.uId =?1 ")
    List<CollectionTEntity> getcollections(Integer uId);
}
