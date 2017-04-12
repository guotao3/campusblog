package com.campusblog.dao;

import com.campusblog.entity.ViewRecord;

import java.util.List;

/**
 * Created by Administrator on 2017/4/12.
 */
public interface ViewRecordDao {
    void writerecord(Integer articleId,Integer uId);
    List<ViewRecord> getuIds(Integer articleId);
}
