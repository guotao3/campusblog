package com.campusblog.dao;

import com.campusblog.entity.ViewRecord;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/4/12.
 */
@Repository
public class ViewRecordDaoImpl implements ViewRecordDao {
    @Resource
    ViewRecordRepository viewRecordRepository;
    @Override
    public void writerecord(Integer articleId, Integer uId) {
        ViewRecord viewRecord=new ViewRecord();
        viewRecord.setuId(uId);
        viewRecord.setArticleId(articleId);
        viewRecordRepository.save(viewRecord);
    }

    @Override
    public List<ViewRecord> getuIds(Integer articleId) {
        return viewRecordRepository.getuIds(articleId);
    }
}
