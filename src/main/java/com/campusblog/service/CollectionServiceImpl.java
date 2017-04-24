package com.campusblog.service;

import com.campusblog.dao.CollectionDao;
import com.campusblog.entity.CollectionTEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
@Service
public class CollectionServiceImpl implements CollectionService {
    @Resource
    CollectionDao collectionDao;
    @Override
    public void add(CollectionTEntity collectionTEntity) {
        collectionDao.add(collectionTEntity);
    }

    @Override
    public List<CollectionTEntity> getcollections(Integer uId) {
        return collectionDao.getcollections(uId);
    }

    @Override
    public void del(Integer collectionid) {
        collectionDao.del(collectionid);
    }

    @Override
    public List<Integer> gethotcollection(Integer size) {
        return collectionDao.gethotcollection(size);
    }
}
