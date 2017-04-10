package com.campusblog.service;

import com.campusblog.entity.CodeType;

import java.util.List;

/**
 * Created by Administrator on 2017/4/10.
 */
public interface CodeTypeService {
    public CodeType savecodetype(CodeType codeType);
    List<CodeType> gettypebyuid(Integer uId);
}
