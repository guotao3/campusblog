package com.campusblog.controller.front;

import com.campusblog.entity.User;
import com.campusblog.service.UserService;
import com.campusblog.utils.*;
import com.campusblog.utils.miaodiyun.httpApiDemo.IndustrySMS;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * Created by Administrator on 2017/3/30.
 */
@Controller
@RequestMapping("/front/user")
public class FrontUserController {
    @Autowired
    Producer producer;
    @Resource
    UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(String username,String password,String captcha,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (code.equals(captcha)) {
            if (!String.valueOf(username).isEmpty() && !String.valueOf(password).isEmpty()) {
                User getone = userService.getone(Integer.parseInt(username), password);
                if (getone != null) {
                    session.setAttribute("user", getone);
                    modelAndView.setViewName("front/index");
                    return modelAndView;
                } else {
                    modelAndView.addObject("message","账号或密码错误");
                    modelAndView.setViewName("front/log");
                    return modelAndView;
                }
            } else {
                modelAndView.addObject("message","请输入账号和密码");
                modelAndView.setViewName("front/log");
                return modelAndView;
            }
        }else {
            modelAndView.setViewName("front/log");
            modelAndView.addObject("message","验证码错误！");
            return modelAndView;
        }
    }

    /**
     * 持久化user
     * @param user
     * @return MyJsonObj
     */
    @ResponseBody
    @RequestMapping("/saveOrUpadate")
    public MyJsonObj adduser(User user,HttpSession session ){
        MyJsonObj myJsonObj = new MyJsonObj();
        String code =session.getAttribute("code").toString();
        System.out.println(code);
        if (user.getName() != null && code.equals(code)) {
            if (userService.getUserById(user.getuId()) == null) {
                user.setCreateTime(Datatool.CreateTime());
                user.setUpdateTime(Datatool.UpdateDatime());
            } else {
                User finduser = userService.getUserById(user.getuId());
                finduser.setCreateTime(Datatool.UpdateDatime());
            }
            try {
                userService.saveOrUpdate(user);
                myJsonObj.setMessage("注册成功！");
                myJsonObj.setFlag(true);
            } catch (Exception e) {
                myJsonObj.setMessage("注册失败！");
                myJsonObj.setFlag(false);
            }
            return myJsonObj;
        }else {
            myJsonObj.setMessage("验证码错误！");
            return myJsonObj;
        }
    }

    /**
     * url:服务器上位置的url
     * urlUrl：数据库保存的图片名
     * @param gt
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/upload")
    public JsonObj upload( String gt,HttpSession session) throws IOException {
        JsonObj jsonObj = new JsonObj();
        jsonObj.setFlag(false);
        if (!gt.isEmpty()){
            try{
                jsonObj = Upload.upload(gt);
                jsonObj.setFlag(true);
            }catch (Exception e){
                jsonObj.setFlag(false);
                return jsonObj;
            }
        }else {
            jsonObj.setFlag(false);
            return jsonObj;
        }

        return jsonObj;
    }


    @RequestMapping("/kaptcha")
    public void img(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.out.println("******************验证码是: " + code + "******************");

        response.setDateHeader("Expires", 0);

        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");

        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");

        // return a jpeg
        response.setContentType("image/jpeg");

        // create the text for the image
        String capText = producer.createText();

        // store the text in the session
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

        // create the image with the text
        BufferedImage bi = producer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();

        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }

    }

    /**
     * 获取短信验证码
     * @return
     */
    @ResponseBody
    @RequestMapping("/getcode")
        Result getcode(String tel,HttpSession session){
        IndustrySMS industrySMS=new IndustrySMS();
        industrySMS.setTo(tel);
        String str="0123456789";
        StringBuilder code=new StringBuilder(4);
        for(int i=0;i<5;i++)
        {
            char ch=str.charAt(new Random().nextInt(str.length()));
            code.append(ch);
        }
        industrySMS.setSmsContent("【帆船博客】登录验证码："+code+"，如非本人操作，请忽略此短信。");
        Result result = industrySMS.execute();
        if("00000".equals(result.getRespcode())) {
            session.setAttribute("code",code);
            return result;
        }else
        {
            return result;
        }
    }


}
