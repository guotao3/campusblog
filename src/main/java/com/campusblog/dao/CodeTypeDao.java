package com.campusblog.dao;

import com.campusblog.entity.CodeType;

import java.util.List;

/**
 * Created by Administrator on 2017/4/10.
 */
public interface CodeTypeDao {
    CodeType savecodetype(CodeType codeType);
    List<CodeType> gettypebyuid(Integer uId);
    String gettypestring(Integer code);
}
