package com.campusblog.service;

import com.campusblog.dao.LinkDao;
import com.campusblog.entity.Link;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2017/3/22.
 */
@Service
public class LinkServiceImpl implements LinkService {
    @Override
    public Link findone(Integer companyid) {
        return linkdao.findone(companyid);
    }

    @Resource
    LinkDao linkdao;
    @Override
    public List<Link> getLinks() {
        Iterable<Link> links = linkdao.getLinks();
        List<Link> l = new ArrayList();
        for (Iterator iter = links.iterator(); iter.hasNext();) {
            Link element = (Link) iter.next();
            l.add(element);
        }
        return l;
    }

    @Override
    public void saveOrUpdate(Link link) {
          linkdao.saveOrUpdate(link);
    }

    @Override
    public void del(Integer companyid) {
           linkdao.del(companyid);
    }
}
