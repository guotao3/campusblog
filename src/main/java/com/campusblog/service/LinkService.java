package com.campusblog.service;

import com.campusblog.entity.Link;

import java.util.List;

/**
 * Created by Administrator on 2017/3/22.
 */
public interface LinkService {
    List<Link> getLinks();
    void saveOrUpdate(Link link);
    void del(Integer companyid);
    Link findone(Integer companyid);
}
