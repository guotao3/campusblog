package com.campusblog.dao;

import com.campusblog.entity.Feedback;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2017/3/17.
 */
public interface FeedbackRepository extends CrudRepository<Feedback,Integer> {
}
