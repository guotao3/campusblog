package com.campusblog.controller;

import com.campusblog.entity.Feedback;
import com.campusblog.service.FeedbackService;
import com.campusblog.utils.Datatool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/16.
 */
@Controller
@RequestMapping(value = "/back/message")
public class MessageController {

    @Resource
    FeedbackService feedbackService;
    /**
     * 跳转到反馈消息管理列表
     *
     * @return
     */
    @RequestMapping(value = "/tofeedmessagelist")
    public String articlelist() {
        return "back/message/feedmessage";
    }

    /**
     * 跳转到系统推送消息管理列表
     *
     * @return
     */
    @RequestMapping(value = "/topushmessagelist")
    public String hotarticlelist() {
        return "back/message/pushmessage";
    }

    /**
     * 跳转到用户反馈消息详情页 只可读
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getread")
    public Feedback articlebyarticleid(Integer feedbackid) {
        Feedback feedback = feedbackService.getFeedbackByFeedbackId(feedbackid);
        return feedback;
    }

    /**
     * 对反馈消息带条件分页
     *
     * @param uid        学号
     * @param importfont 内容关键字
     * @param offset     索引
     * @param limit      显示条目
     * @return map
     */
    //带条件的分页
    @RequestMapping("/feedbacklist")
    @ResponseBody
    public Map feedmessagelistinit(@RequestParam(name = "uid", required = false) Integer uid,
                                   @RequestParam(name = "importfont", required = false) String importfont, Integer offset, Integer limit) {
        List<Feedback> feedbackList = feedbackService.getFeedbacklistByCondition(uid,importfont, offset, limit);
        long totals = feedbackService.getCountFeedbacklistByCondition(uid, importfont);
        Map<String, Object> map = new HashMap<>();
        map.put("rows", feedbackList);
        map.put("total", totals);
        return map;
    }

    /**
     * 对推送消息带条件分页
     * @param uid      学号
     * @param importfont  内容关键字
     * @param offset   索引
     * @param limit   显示条目
     * @return     map
     */
    //带条件的分页
    @RequestMapping("/articlelist")
    @ResponseBody
    public Map pushmessagelistinit(@RequestParam(name ="uid",required = false) Integer uid,
                                   @RequestParam(name ="importfont",required = false) String importfont, Integer offset, Integer limit) {
        List<Feedback> feedbackList = feedbackService.getFeedbacklistByCondition(uid,importfont,offset,limit);
        long totals = feedbackService.getCountFeedbacklistByCondition(uid,importfont);
        Map<String,Object> map = new HashMap<>();
        map.put("rows", feedbackList);
        map.put("total", totals);
        return map;
    }

    /**
     * 持久化feedback
     * @param feedback
     * @return
     */
    @RequestMapping("/saveOrUpadate")
    public String add(Feedback feedback) {
        if(feedbackService.getFeedbackByFeedbackId(Integer.valueOf(feedback.getMid()))==null) {
            feedback.setCreateTime(Datatool.CreateTime());
            feedback.setUpdateTime(Datatool.UpdateDatime());
        }else{
            feedback.setCreateTime(Datatool.UpdateDatime());
        }
        feedbackService.saveOrUpdateFeedbackByFeedbackId(feedback);
        return "redirect:";
    }




}
