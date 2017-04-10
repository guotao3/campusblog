package com.campusblog.dao;

import com.campusblog.entity.CodeType;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/4/10.
 */
@Repository
public class CodeTypeDaoImpl implements CodeTypeDao {
    @Override
    public List<CodeType> gettypebyuid(Integer uId) {
        return codeTypeRespository.gettypebyuid(uId);
    }

    @Resource
    CodeTypeRespository codeTypeRespository;
    @Override
    public CodeType savecodetype(CodeType codeType) {
        CodeType save = codeTypeRespository.save(codeType);
        return save;
    }
}
