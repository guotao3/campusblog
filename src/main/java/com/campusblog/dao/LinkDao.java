package com.campusblog.dao;

import com.campusblog.entity.Link;

/**
 * Created by Administrator on 2017/3/22.
 */
public interface LinkDao {
    Iterable<Link> getLinks();
    void saveOrUpdate(Link link);
    void del(Integer companyid);
    Link findone(Integer companyid);
}
