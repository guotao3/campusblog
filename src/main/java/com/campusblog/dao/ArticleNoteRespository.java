package com.campusblog.dao;

import com.campusblog.entity.Articlenote;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2017/4/13.
 */
public interface ArticleNoteRespository  extends CrudRepository<Articlenote,Integer> {
}
