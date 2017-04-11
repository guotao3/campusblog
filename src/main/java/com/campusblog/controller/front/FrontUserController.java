package com.campusblog.controller.front;

import com.campusblog.controller.Vo.ArticleVo;
import com.campusblog.entity.Article;
import com.campusblog.entity.CodeType;
import com.campusblog.entity.User;
import com.campusblog.service.ArticleService;
import com.campusblog.service.CodeTypeService;
import com.campusblog.service.UserService;
import com.campusblog.utils.*;
import com.campusblog.utils.miaodiyun.httpApiDemo.IndustrySMS;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
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
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by Administrator on 2017/3/30.
 */
@Controller
@RequestMapping("/front/user")
public class FrontUserController {
    @Resource
    ArticleService articleService;
    @Autowired
    Producer producer;
    @Resource
    UserService userService;
    @Resource
    CodeTypeService codeTypeService;
    @RequestMapping("towrite")
    public ModelAndView towrite(HttpSession session){
        User user =(User) session.getAttribute("user");
        List<CodeType> types = codeTypeService.gettypebyuid(user.getuId());
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("front/write");
        modelAndView.addObject("types",types);
        return modelAndView;
    }

    @RequestMapping("/toarticle")
    public ModelAndView toarticle(Integer uId){
            ModelAndView modelAndView=new ModelAndView();
            Long totals = articleService.getArticlecount(uId);
            Long totalPage = (totals + com.campusblog.Constants.PAGE_SIZE - 1) / com.campusblog.Constants.PAGE_SIZE;//总页数
            List<Article> articleListsql = articleService.getArtileListShow(uId, null, null, 1, com.campusblog.Constants.PAGE_SIZE);
            List<ArticleVo> articleList =new ArrayList<>();
            for (Article a:articleListsql
                ) {
            Timestamp createTime = a.getCreateTime();
            Timestamp updateTime = a.getUpdateTime();
            Date createtime = new Date(createTime.getTime());
            Date updatetime = new Date(updateTime.getTime());

            ArticleVo articleVo = new ArticleVo();
            articleVo.setType(a.getType());
            articleVo.setAccess(a.getAccess());
            articleVo.setApprove(a.getApprove());
            articleVo.setArticleId(a.getArticleId());
            articleVo.setContent(a.getContent());
            articleVo.setImpose(a.getimpose());
            articleVo.setTitile(a.getTitile());
            articleVo.setCreateTime(createtime);
            articleVo.setUpdateTime(updatetime);
            articleVo.setView(a.getView());
            articleVo.setuId(a.getuId());
            articleList.add(articleVo);
        }
        modelAndView.addObject("totals",totals);
        modelAndView.addObject("articles",articleList);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo", 1);
        modelAndView.setViewName("front/article");
        return modelAndView;
    }

    @RequestMapping("/logout")
    String logout (HttpSession session){
        session.removeAttribute("user");
        return "front/log";
    }
    @RequestMapping("/tousercenter")
    String tousercenter (HttpSession session){
        User user = (User) session.getAttribute("user");
        User userById = userService.getUserById(user.getuId());
        session.setAttribute("user",userById);
        return "front/center_person";
    }

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
     * 个人中心修改
     * 持久化user
     * @param user
     * @return
     */
    @RequestMapping("/saveOrUpadateUser")
    public String add(User user) {
        if(userService.getUserById(user.getuId())==null) {
            user.setCreateTime(Datatool.CreateTime());
            user.setUpdateTime(Datatool.UpdateDatime());
        }else{
            User finduser=userService.getUserById(user.getuId());
            finduser.setCreateTime(Datatool.UpdateDatime());
        }
        userService.saveOrUpdate(user);
        return "redirect:/front/user/tousercenter";
    }


    /**
     * 注册
     * 持久化user
     * @param
     * @return MyJsonObj
     */
    @ResponseBody
    @RequestMapping("/saveOrUpadate")
    public MyJsonObj adduser(@RequestParam(name = "id") Integer uId,String password,String tel,String code,String pic,HttpSession session ){
        MyJsonObj myJsonObj = new MyJsonObj();
        User user=new User();
        user.setuId(uId);
        user.setPassword(password);
        user.setTel(tel);
        user.setPic(pic);
        String wcode = session.getAttribute("code")+"";
        if (code != null && code.equals(wcode)) {
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
     * 持久化article
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/articlesaveOrUpadate")
    public MyJsonObj addarticle( String uId,Integer articleId,String titile,String content,String type,String impose,Integer access,HttpSession session) {
        Article article=new Article();
        MyJsonObj myJsonObj =new MyJsonObj();
        User user =(User) session.getAttribute("user");
        article.setuId((user.getuId()));
        if(articleId!=null){
        article.setArticleId(articleId);
        }
        article.setTitile(titile);
        article.setContent(content);
        article.setType(type);
        article.setimpose(impose);
        article.setAccess(access);
        if(uId!=null&&!uId.equals("")) {
            if (articleService.getArticleByarticleId(Integer.parseInt(uId)) == null) {
                article.setCreateTime(Datatool.CreateTime());
                article.setUpdateTime(Datatool.UpdateDatime());
            } else {
                Article article1 = articleService.getArticleByarticleId(Integer.parseInt(uId));
                article1.setCreateTime(Datatool.UpdateDatime());
            }
        }else {
            article.setCreateTime(Datatool.CreateTime());
            article.setUpdateTime(Datatool.UpdateDatime());
        }
        try{
        articleService.saveOrUpdateArticleByArticleId(article);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("保存成功！");
        }
        catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("发布失败！");
        }
        return myJsonObj;
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
            result.setRespcode("00000");
            session.setAttribute("code",code);
            return result;
        }else
        {
            return result;
        }
    }

    @ResponseBody
    @RequestMapping("/savecodetype")
    public MyJsonObj savecodetype(Integer uId,String type){
        CodeType codeType = new CodeType();
        codeType.setuId(uId);
        codeType.setType(type);
        MyJsonObj myJsonObj =new MyJsonObj();
        if (codeType.getType()==null||codeType.getType()==""){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("新建分类为空，请输入后操作");
            return myJsonObj;
        }else {
            List<CodeType> types = codeTypeService.gettypebyuid(codeType.getuId());
            boolean contains = types.contains(codeType);
            if(contains==true){
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("已存在的分类名");
                return myJsonObj;
            }
            else {
                try{
                    CodeType savecodetype = codeTypeService.savecodetype(codeType);
                }catch (Exception e){
                    myJsonObj.setFlag(false);
                    myJsonObj.setMessage("存储异常");
                    return myJsonObj;
                 }
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("ok！");
                return myJsonObj;
            }
        }
    }

    @RequestMapping("/articleist")
    public ModelAndView articleList(Integer uId,String front,Integer type,Integer pageNo,Integer pageSize){
        ModelAndView modelAndView=new ModelAndView();
        Long totals = articleService.getArticlecount(uId);
        Long totalPage = (totals + com.campusblog.Constants.PAGE_SIZE - 1) / com.campusblog.Constants.PAGE_SIZE;//总页数
        List<Article> articleListsql = articleService.getArtileListShow(uId, type, front, pageNo, com.campusblog.Constants.PAGE_SIZE);
        List<ArticleVo> articleList =new ArrayList<>();
        for (Article a:articleListsql
             ) {
            Timestamp createTime = a.getCreateTime();
            Timestamp updateTime = a.getUpdateTime();
            Date createtime = new Date(createTime.getTime());
            Date updatetime = new Date(updateTime.getTime());

            ArticleVo articleVo = new ArticleVo();
            articleVo.setType(a.getType());
            articleVo.setAccess(a.getAccess());
            articleVo.setApprove(a.getApprove());
            articleVo.setArticleId(a.getArticleId());
            articleVo.setContent(a.getContent());
            articleVo.setImpose(a.getimpose());
            articleVo.setTitile(a.getTitile());
            articleVo.setCreateTime(createtime);
            articleVo.setUpdateTime(updatetime);
            articleVo.setView(a.getView());
            articleVo.setuId(a.getuId());
            articleList.add(articleVo);
        }
        modelAndView.addObject("articles",articleList);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo", pageNo);
        modelAndView.setViewName("front/article");
        return modelAndView;
    }



}
