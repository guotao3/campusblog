package com.campusblog.dao;

import com.campusblog.entity.ViewRecord;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2017/4/12.
 */
public interface ViewRecordRepository extends CrudRepository<ViewRecord,Integer> {
    @Query("from ViewRecord a where a.articleId=?1")
    List<ViewRecord> getuIds(Integer articleId);
}
