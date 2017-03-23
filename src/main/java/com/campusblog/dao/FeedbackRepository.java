package com.campusblog.dao;

import com.campusblog.entity.Feedback;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2017/3/17.
 */
public interface FeedbackRepository extends CrudRepository<Feedback,Integer> {
    @Query("from Feedback f where f.createTime >=?1 and f.createTime <=?2")
    Integer getfeedbackamount(String startDate,String endDate);
}
