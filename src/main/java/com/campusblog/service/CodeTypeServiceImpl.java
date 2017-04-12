package com.campusblog.service;

import com.campusblog.dao.CodeTypeDao;
import com.campusblog.entity.CodeType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/4/10.
 */
@Service
public class CodeTypeServiceImpl implements CodeTypeService {
    @Override
    public String gettypestring(Integer code) {
        return codeTypeDao.gettypestring(code);
    }

    @Override
    public List<CodeType> gettypebyuid(Integer uId) {
        return  codeTypeDao.gettypebyuid(uId);
    }

    @Resource
    CodeTypeDao codeTypeDao;
    @Override
    public CodeType savecodetype(CodeType codeType) {
        return codeTypeDao.savecodetype(codeType);
    }
}
