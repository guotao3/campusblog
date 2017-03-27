package com.campusblog.controller.back;

import com.campusblog.entity.Message;
import com.campusblog.service.MessageService;
import com.campusblog.utils.Datatool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/20.
 */

@Controller
@RequestMapping("/back/Communicate")
public class CommunicateController {
    @Resource
    MessageService messageService;

    /**
     * 跳转到私信消息管理列表
     *
     * @return
     */
    @RequestMapping(value = "/tomessagelist")
    public String hotarticlelist() {
        return "back/communicate/list";
    }

    /**
     * 跳转到用户黑名单详情页 只可读
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getread")
    public Message getMessagebyid(Integer Messageid) {
        Message Message = messageService.getMessageByMessageId(Messageid);
        return Message;
    }

    /**
     * 对用户消息及黑名单带条件分页
     *
     * @param uid        学号
     * @param offset     索引
     * @param limit      显示条目
     * @return map
     */
    //带条件的分页
    @RequestMapping("/Messagelist")
    @ResponseBody
    public Map Messagelistinit(@RequestParam(name = "uid", required = false) Integer uid,
                                    Integer offset, Integer limit) {
        List<Message> MessageList = messageService.getMessagelistByCondition(uid, offset, limit);
        long totals = messageService.getCountMessagelistByCondition(uid);
        List<Message> messages = transmessages(MessageList);
        Map<String, Object> map = new HashMap<>();
        map.put("rows", messages);
        map.put("total", totals);
        return map;
    }

    /**
     * 持久化Message
     * @param Message
     * @return
     */
    @RequestMapping("/saveOrUpadate")
    public String add(Message Message) {
        if(messageService.getMessageByMessageId(Message.getMid())==null) {
            Message.setCreatTime(Datatool.CreateTime());
            Message.setUpdateTime(Datatool.UpdateDatime());
            com.campusblog.entity.Message messageByMessageId = messageService.getMessageByMessageId(Message.getuId());
            String blacklist = messageByMessageId.getBlacklist();
            if(blacklist.length()%270==0){
                messageByMessageId.setBlacklist(messageByMessageId.getBlacklist()+"\\n");
            }
        }else{
            Message.setUpdateTime(Datatool.UpdateDatime());
        }
        messageService.saveOrUpdateMessageByMessageId(Message);
        return "redirect:";
    }

    /**
     * 显示message概要
     * @param messages
     * @return
     */
    List<Message> transmessages(List<Message> messages) {
        for (Message message : messages
                ) {
            Integer strlen = message.getBlacklist().length();
            if (strlen >= 25) {
                String substring = message.getBlacklist().substring(0, 20);
                message.setBlacklist(substring + "......");
            }
        }
        return  messages;
    }
}
