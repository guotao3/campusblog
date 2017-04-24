package com.campusblog.dao;

import com.campusblog.entity.Usernote;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by hasee on 2017/4/16.
 */
public interface UserNoteRepository extends CrudRepository<Usernote,Integer> {
}
