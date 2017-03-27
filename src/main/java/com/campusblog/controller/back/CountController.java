package com.campusblog.controller.back;

import com.campusblog.controller.Vo.CountVo;
import com.campusblog.service.ArticleService;
import com.campusblog.service.FeedbackService;
import com.campusblog.service.ImgService;
import com.campusblog.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/23.
 */
@Controller
@RequestMapping("/back/count")
public class CountController {
    @Resource
    UserService userService;
    @Resource
    FeedbackService feedbackService;
    @Resource
    ArticleService articleService;
    @Resource
    ImgService imgService;
    @ResponseBody
    @RequestMapping("/getCount")
    CountVo getcount(String flag) {
        //创建Date对象
        Date endDate = new Date();
        //创建基于当前时间的日历对象
        Calendar cl = Calendar.getInstance();
        cl.setTime(endDate);
        //距离今天，一个月内数据
        if (flag.equals("month")) {
            cl.add(Calendar.MONTH, -1);
        }
        //距离今天，一周内的数据
        if (flag.equals("week")) {
            cl.add(Calendar.DATE, -7);
        }
        Date startDate = cl.getTime();
        SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
//格式化开始日期和结束日期
        String start = dd.format(startDate);
        String end = dd.format(endDate);
        CountVo vo = new CountVo();
        vo.setArticleamount(articleService.getarticleamount(start,end));
        vo.setFeedbackamount(feedbackService.getfeedbackamount(start,end));
        vo.setImgamount(imgService.getimgamount(start,end));
        vo.setUseramount(userService.getuseramount(start,end));
        return vo;
    }

}
