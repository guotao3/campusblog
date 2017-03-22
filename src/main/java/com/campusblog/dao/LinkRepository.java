package com.campusblog.dao;

import com.campusblog.entity.Link;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2017/3/22.
 */
public interface LinkRepository extends CrudRepository<Link,Integer> {
}
