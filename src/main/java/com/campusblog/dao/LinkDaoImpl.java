package com.campusblog.dao;

import com.campusblog.entity.Link;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/3/22.
 */
@Service
public class LinkDaoImpl implements LinkDao {
    @Override
    public Link findone(Integer companyid) {
        return linkRepository.findOne(companyid);
    }

    @Resource
    LinkRepository linkRepository;
    @Override
    public Iterable<Link> getLinks() {
        Iterable<Link> all = linkRepository.findAll();
        return all;
    }

    @Override
    public void saveOrUpdate(Link link) {
        linkRepository.save(link);
    }

    @Override
    public void del(Integer companyid) {
        linkRepository.delete(companyid);
    }
}
