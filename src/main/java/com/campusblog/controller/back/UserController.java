package com.campusblog.controller.back;

import com.campusblog.entity.User;
import com.campusblog.service.UserService;
import com.campusblog.utils.Datatool;
import com.campusblog.utils.JsonObj;
import com.campusblog.utils.Upload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/13.
 */
@Controller
@RequestMapping("/back/user")
public class UserController {
    @Resource
    UserService userService;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String username,String password,HttpSession session){
        if(!String.valueOf(username).isEmpty()&&!String.valueOf(password).isEmpty()){
            User getone = userService.getone(Integer.parseInt(username),password);
            if (getone!=null){
            session.setAttribute("admin",getone);
            return "back/index";
        }else {
            return "back/login";}
        }
        else return "back/login";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session)
    {
        session.removeAttribute("admin");
        return "back/login";
    }

    /**
     * 跳转到主页
     * @return
     */
    @RequestMapping("/toindex")
    public String turn(){
        return "back/index";
    }

    /**
     * 持久化user
     * @param user
     * @return
     */
    @RequestMapping("/saveOrUpadate")
    public String add(User user) {
        if(userService.getUserById(user.getuId())==null) {
            user.setCreateTime(Datatool.CreateTime());
            user.setUpdateTime(Datatool.UpdateDatime());
        }else{
            User finduser=userService.getUserById(user.getuId());
            finduser.setCreateTime(Datatool.UpdateDatime());
        }
        userService.saveOrUpdate(user);
        return "redirect:/back/user/touserlist";
    }

    /**
     * 跳转到超级用户列表
     * @return
     */
    @RequestMapping(value = "/touserlist2")
    public String userlist2(){
        return "back/user/list2";
    }
    /**
     * 跳转到用户列表
     * @return
     */
    @RequestMapping(value = "/touserlist")
    public String userlist(){
        return "back/user/list";
    }

    /**
     * 对普通用户带条件分页
     * @param uid      学号
     * @param fullname  昵称
     * @param offset   索引
     * @param limit   显示条目
     * @return     map
     */
    //带条件的分页
    @RequestMapping("/userlist")
    @ResponseBody
    public Map listinit(@RequestParam(name ="uid",defaultValue = "0",required = false) String uid,@RequestParam(name ="fullname",defaultValue = "",required = false) String fullname, Integer offset, Integer limit) {
        List<User> users = userService.getUserPage(Integer.parseInt(uid), fullname, offset, limit);
        long totals = userService.getCounts(Integer.parseInt(uid), fullname);
        Map<String,Object> map = new HashMap<>();
        map.put("rows", users);
        map.put("total", totals);
        return map;
    }

    /**
     * 跳转到新增普通用户页面
     * @return
     */
    @RequestMapping("/toadd")
    public String toadd() {
        return "back/user/add";
    }


    /**
     * 获取id跳转到用户update页面
     * @param uid     学号
     * @param map    根据学号查出的普通用户信息
     * @return  view
     */
    @RequestMapping("/toupdate")
    public String toupdate(Integer uid,Map map) {
        User user = userService.getUserById(uid);
        map.put("user",user);
        return "back/user/update";
    }

    /**
     * 删除单条记录
     * @param id
     * @return  json
     */
    @ResponseBody
    @RequestMapping("/del/{id}")
    public JsonObj del(@PathVariable("id") Integer id) {
        JsonObj jsonObj = new JsonObj();
        jsonObj.setFlag(true);
        if(id!=0) {
            try {
                userService.del(id);
            } catch (Exception e) {
                jsonObj.setFlag(false);
            }
        }
        return jsonObj;
    }

    /**
     * 根据uId批量删除
     * @param ids
     * @return json
     */
    @ResponseBody
    @RequestMapping("/dels")
    public JsonObj del(String ids) {
        JsonObj jsonObj = new JsonObj();
        jsonObj.setFlag(true);
        if(!ids.isEmpty()) {
            try {
                userService.delUserByuIds(ids);
            } catch (Exception e) {
                jsonObj.setFlag(false);
            }
        }
        return jsonObj;
    }

    /**
     * url:服务器上位置的url
     * urlUrl：数据库保存的图片名
     * @param file
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/uploads")
    public JsonObj upload(MultipartFile file) throws IOException {
        if (file!=null) {
            JsonObj jsonObj = Upload.upload(file);
            String url = jsonObj.getUrl();
            String urlUrl = jsonObj.getUrlUrl();
            return jsonObj;
        }else {
            return new JsonObj();
        }
    }

    /**
     * 超级管理员的列表
     * @param uid
     * @param fullname
     * @param offset
     * @param limit
     * @return
     */
    //带条件的分页
    @RequestMapping("/userlist2")
    @ResponseBody
    public Map listinit2(@RequestParam(name ="uid",defaultValue = "0",required = false) String uid,@RequestParam(name ="fullname",defaultValue = "",required = false) String fullname, Integer offset, Integer limit) {
        List<User> users = userService.getSuperUserPage(Integer.parseInt(uid), fullname, offset, limit);
        long totals = userService.getSuperCounts(Integer.parseInt(uid), fullname);
        Map<String,Object> map = new HashMap<>();
        map.put("rows", users);
        map.put("total", totals);
        return map;
    }


}
