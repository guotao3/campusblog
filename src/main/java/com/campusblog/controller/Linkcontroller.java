package com.campusblog.controller;

import com.campusblog.entity.Link;
import com.campusblog.service.LinkService;
import com.campusblog.utils.JsonObj;
import com.campusblog.utils.MyJsonObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/22.
 */
@Controller
@RequestMapping("/back/link")
public class Linkcontroller {
    @Resource
    LinkService linkService;
    /**
     * 跳转到友情链接管理列表
     *
     * @return
     */
    @RequestMapping(value = "/tolink")
    public ModelAndView linklist(ModelAndView modelAndView) {
        List<Link> links = linkService.getLinks();
        modelAndView.addObject("links",links);
        modelAndView.setViewName("back/link/link");
        return modelAndView;
    }

    /**
     *
     * @param companyid
     * @param campanyname
     * @param Email
     * @param logo
     * @return
     */
    @RequestMapping(value = "/addlink")
    @ResponseBody
    public Link addlink(Integer companyid,String campanyname,String Email, String logo,Map map ) {
        Link link = new Link();
        MyJsonObj myJsonObj = new MyJsonObj();
        myJsonObj.setFlag(true);
        if (!String.valueOf(companyid).isEmpty()&&!String.valueOf(campanyname).isEmpty()) {
            Link findone = linkService.findone(companyid);
            if(findone==null) {
                link.setCompanyregId(companyid);
                link.setCampanyname(campanyname);
                link.setEmail(Email);
                link.setLogo(logo);
                try {
                    linkService.saveOrUpdate(link);
                } catch (Exception e) {
                    myJsonObj.setFlag(false);
                }
            }else {
                myJsonObj.setFlag(false);
            }
        }else {
            myJsonObj.setFlag(false);
        }

       if (myJsonObj.isFlag()==true){
           Link findone = linkService.findone(companyid);
           return findone;
       }else {
           link=null;
           return link;
       }
    }

    @RequestMapping(value = "/dellink")
    @ResponseBody
    JsonObj del(Integer companyid){
        JsonObj jsonObj = new  JsonObj();
        jsonObj.setFlag(true);
        if (!String.valueOf(companyid).isEmpty()){
            try {
                linkService.del(companyid);
            }catch (Exception e){
                jsonObj.setFlag(false);
            }

        }else {
            jsonObj.setFlag(false);
            return jsonObj;
        }
        return jsonObj;
    }
}
