package com.campusblog.dao;

import com.campusblog.entity.Article;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.sql.Date;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface ArticleRepository extends CrudRepository<Article,Integer> {
    @Query("select count (1) from Article a where a.createTime >=?1 and a.createTime <=?2")
    Integer getarticleamount(Date startDate, Date endDate);
}
