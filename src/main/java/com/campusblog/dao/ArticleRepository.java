package com.campusblog.dao;

import com.campusblog.entity.Article;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface ArticleRepository extends CrudRepository<Article,Integer> {
}
