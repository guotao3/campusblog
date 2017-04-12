package com.campusblog.dao;

import com.campusblog.entity.CodeType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2017/4/10.
 */
public interface CodeTypeRespository extends CrudRepository<CodeType,Integer> {
    @Query("from CodeType  c where c.uId=?1")
    List<CodeType> gettypebyuid(Integer uId);
    @Query("select c.type from CodeType  c where c.code=?1")
    String gettypestring(Integer code);
}
