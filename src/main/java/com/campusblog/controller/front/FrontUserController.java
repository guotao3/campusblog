package com.campusblog.controller.front;

import com.campusblog.entity.User;
import com.campusblog.service.UserService;
import com.campusblog.utils.Datatool;
import com.campusblog.utils.MyJsonObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/3/30.
 */
@Controller
@RequestMapping("/front/user")
public class FrontUserController {
    @Resource
    UserService userService;
    /**
     * 持久化user
     * @param user
     * @return MyJsonObj
     */
    @ResponseBody
    @RequestMapping("/saveOrUpadate")
    public MyJsonObj adduser(User user) {
        MyJsonObj myJsonObj = new MyJsonObj();
        if(userService.getUserById(user.getuId())==null) {
            user.setCreateTime(Datatool.CreateTime());
            user.setUpdateTime(Datatool.UpdateDatime());
        }else{
            User finduser=userService.getUserById(user.getuId());
            finduser.setCreateTime(Datatool.UpdateDatime());
        }
        try {
            userService.saveOrUpdate(user);
            myJsonObj.setMessage("注册成功！");
            myJsonObj.setFlag(true);
        }catch (Exception e){
            myJsonObj.setMessage("注册失败！");
            myJsonObj.setFlag(false);
        }

        return myJsonObj;
    }
}
