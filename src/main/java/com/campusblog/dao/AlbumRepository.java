package com.campusblog.dao;


import com.campusblog.entity.Album;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2016/12/26.
 */
public interface AlbumRepository extends CrudRepository<Album,Integer> {
}
