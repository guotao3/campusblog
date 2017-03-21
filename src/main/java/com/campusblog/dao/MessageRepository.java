package com.campusblog.dao;

import com.campusblog.entity.Message;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2017/3/20.
 */
public interface MessageRepository extends CrudRepository<Message,Integer> {
}
