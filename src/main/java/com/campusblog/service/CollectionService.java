package com.campusblog.service;

import com.campusblog.entity.CollectionTEntity;

import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
public interface CollectionService {
    void add(CollectionTEntity collectionTEntity);
    List<CollectionTEntity> getcollections(Integer uId);
    void  del(Integer collectionid);
    List<Integer> gethotcollection(Integer size);
}
