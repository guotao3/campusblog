package com.campusblog.controller.front;

import com.campusblog.entity.User;
import com.campusblog.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/24.
 */
@Controller
@RequestMapping("/front/index")
public class IndexController {
    @Resource
    UserService userService;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String username,String password,HttpSession session){
        if(!String.valueOf(username).isEmpty()&&!String.valueOf(password).isEmpty()){
            User getone = userService.getone(Integer.parseInt(username),password);
            if (getone!=null) {
                session.setAttribute("user", getone);
                return "redirect:/front/index/toindex";
            }else {
                return "front/log";
            }
        }
        else return "front/log";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session)
    {
        session.removeAttribute("admin");
        return "back/login";
    }

    @RequestMapping("/toindex")
    public String toIndex(Map map,HttpSession session){
        User user = (User) session.getAttribute("user");
        map.put("user",user);
        return "front/index";
    }

    @RequestMapping("/tolog")
    public String toLog(){
        return "front/log";
    }

    @RequestMapping("/toregister")
    public String toregister(){
        return "front/register";
    }

    @RequestMapping("/todaylog")
    public String todaylog(){
        return "front/article";
    }

    @RequestMapping("/tophoto")
    public String tophoto(){
        return "front/photo";
    }

    @RequestMapping("/tofriend")
    public String tofriend(){
        return "front/friend";
    }

    @RequestMapping("/tocollect")
    public String tocollect(){
        return "front/collect";
    }

    @RequestMapping("/tomem")
    public String tomem(){
        return "front/mem";
    }

    @RequestMapping("/tomessage")
    public String tomessage(){
        return "front/message";
    }

    @RequestMapping("/tocenter_person")
    public String tocenter_person(){
        return "front/center_person";
    }


}
