package com.campusblog.controller.front;

import com.campusblog.controller.Vo.ArticleNoteVo;
import com.campusblog.controller.Vo.ArticleVo;
import com.campusblog.controller.Vo.MemoryNoteVo;
import com.campusblog.controller.Vo.UserNoteVo;
import com.campusblog.entity.*;
import com.campusblog.service.*;
import com.campusblog.utils.*;
import com.campusblog.utils.miaodiyun.httpApiDemo.IndustrySMS;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import javax.servlet.http.Cookie;
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
    CollectionService collectionService;
    @Resource
    ArticleNoteService articleNoteService;
    @Resource
    ArticleService articleService;
    @Autowired
    Producer producer;
    @Resource
    UserService userService;
    @Resource
    CodeTypeService codeTypeService;
    @Resource
    MemoryNoteService memoryNoteService;
    @Resource
    UserNoteService userNoteService;
    @Resource
    AlbumService albumService;
    @Resource
    ImgService imgService;
    @Resource
    PushmessageService pushmessageService;

    @RequestMapping("/toregister")
    String toregister(){
        return "front/register";
    }

    @RequestMapping("/tolog")
    String tolog(){return "front/log";
    }

    @RequestMapping("/toreport")
    String toreport(Map map){
        List<Push> pushList = pushmessageService.getPushlistByCondition(null, null, 0, 5);
        map.put("pushList",pushList);
        return "front/report";
    }

    @RequestMapping("/toindex")
    public ModelAndView toIndex(){
        ModelAndView modelAndView = new ModelAndView();
        //热门文章
        List<Article> hotArticlelistByCondition = articleService.gethotArtileListShow(null,1,10);
        List<User> hotuserlist = userService.gethotuser(4);
        modelAndView.addObject("hotuserlist",hotuserlist);
        modelAndView.setViewName("front/index");
        modelAndView.addObject("hotarticlelist",hotArticlelistByCondition);
        return modelAndView;
    }

    @RequestMapping("/tofamous_person")
    public ModelAndView tofamous_person(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo){
        ModelAndView modelAndView = new ModelAndView();
        //热门博主
        Long totals = userService.gethotuserscount();
        Long totalPage = (totals + 8 - 1) / 8;//总页数
        List<User> users = userService.gethotusers(pageNo, 8);
        modelAndView.setViewName("front/famous_person");
        modelAndView.addObject("users",users);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo",pageNo);
        return modelAndView;
    }

    @RequestMapping("/tofamous_picture")
    public ModelAndView tofamous_picture(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo){
        ModelAndView modelAndView = new ModelAndView();
        //热门图片
        Long totals = imgService.gethotImgscount();
        Long totalPage = (totals + 8 - 1) / 8;//总页数
        List<Img> imgList = imgService.gethotImgs(pageNo, 8);
        modelAndView.setViewName("front/famous_picture");
        modelAndView.addObject("imgList",imgList);
        modelAndView.addObject("totalPage",totalPage);
       modelAndView.addObject("pageNo",pageNo);
        return modelAndView;
    }

    @RequestMapping("/tofamous_article")
    public ModelAndView famous_articlelist(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                                           @RequestParam(value = "font", required = false, defaultValue = "") String font){
        ModelAndView modelAndView = new ModelAndView();
        Long totals = articleService.gethotarticleshowcount(font);
        Long totalPage = (totals + 8 - 1) / 8;//总页数
        //热门文章
        List<Article> hotArticlelistByCondition = articleService.gethotArtileListShow(font,pageNo,8);
        for (Article a:hotArticlelistByCondition
             ) {
            String gettypestring = codeTypeService.gettypestring(Integer.parseInt(a.getType()));
            a.setType(gettypestring);
        }
        modelAndView.setViewName("front/famous_article");
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo",pageNo);
        modelAndView.addObject("hotarticlelist",hotArticlelistByCondition);
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping("/delarticle")
    MyJsonObj delarticle(Integer articleId){
        MyJsonObj myJsonObj =new MyJsonObj();
        try {
            articleService.del(articleId);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("删除成功");
        }catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("数据正在被使用");
        }
        return myJsonObj;
    }

    @RequestMapping("/logout")
    String logout (HttpSession session){
        session.removeAttribute("user");
        return "front/log";
    }

    @RequestMapping("/tousercenter")
    ModelAndView tousercenter (HttpSession session){
        User user = (User) session.getAttribute("user");
        User userById = userService.getUserById(user.getuId());
        session.setAttribute("user",userById);
        Long articlecount = articleService.getArticlecount(userById.getuId());
        long imgcount = imgService.getcountsbyuserid(userById.getuId());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("articlecount",articlecount);
        modelAndView.addObject("imgcount",imgcount);
        modelAndView.setViewName("front/center_person");
        return modelAndView;
    }

    @RequestMapping("/toothers_main")
    ModelAndView toothers_main (Integer uId){
        User otheruser = userService.getUserById(uId);
        List<Article> articles = articleService.getArtileListShow(uId, null, null, 1, 1);
        List<Img> imgs = imgService.getImgs(uId, 1, 6);
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("otheruser",otheruser);
        modelAndView.addObject("articles",articles);
        modelAndView.addObject("imgs",imgs);
        Long notecount = 0L;
        String gettypestring ="";
            if(articles != null && articles.size() >= 1){
                notecount = articleService.getArticleNotecount(articles.get(0).getArticleId());
                gettypestring = codeTypeService.gettypestring(Integer.parseInt(articles.get(0).getType()));
            }
        modelAndView.addObject("otheruId",uId);
        modelAndView.addObject("otheruser",otheruser);
        modelAndView.addObject("type",gettypestring);
        modelAndView.addObject("notecount",notecount);
        modelAndView.setViewName("front/others_main");
        return modelAndView;
    }

    @RequestMapping("/tophoto")
    ModelAndView tophoto (HttpSession session){
        ModelAndView modelAndView =new ModelAndView();
        User user = (User) session.getAttribute("user");
        Long totals = albumService.getCounts(user.getuId());
        Long totalPage = (totals + 10 - 1) / 10;//总页数
        List<Album> albumList = albumService.getAlbumAll(user.getuId(),1, 10);
        modelAndView.addObject("albumList",albumList);
        modelAndView.setViewName("front/photo");
        modelAndView.addObject("pageNo",1);
        modelAndView.addObject("totalPage",totalPage);
        return modelAndView;
    }

    @RequestMapping("/tootherphoto")
    ModelAndView tootherphoto (Integer otheruId){
        ModelAndView modelAndView =new ModelAndView();
        Long totals = albumService.getCounts(otheruId);
        Long totalPage = (totals + 10 - 1) / 10;//总页数
        List<Album> albumList = albumService.getAlbumAll(otheruId,1, 10);
        modelAndView.addObject("albumList",albumList);
        modelAndView.setViewName("front/photo");
        modelAndView.addObject("pageNo",1);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("otheruId",otheruId);
        return modelAndView;
    }

    @RequestMapping("/photolist")
     ModelAndView photolist(Integer pageNo,HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        Long totals = albumService.getCounts(user.getuId());
        Long totalPage = (totals + com.campusblog.Constants.PAGE_SIZE - 1) / com.campusblog.Constants.PAGE_SIZE;//总页数
        List<Album> albumList = albumService.getAlbumAll(user.getuId(), pageNo, com.campusblog.Constants.PAGE_SIZE);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo",pageNo);
        modelAndView.addObject("albumList",albumList);
        modelAndView.setViewName("front/photo");
        return modelAndView;
    }


    @RequestMapping("/toalubmdetail")
    ModelAndView toalubmdetail (Integer albumid){
        ModelAndView modelAndView =new ModelAndView();
        /*long totals = imgService.getcounts(albumid);*/
        //Long totalPage = (totals + com.campusblog.Constants.PAGE_SIZE - 1) / com.campusblog.Constants.PAGE_SIZE;//总页数
        List<Img> imgList = imgService.getAlbumDetail(albumid, 1, 10000);
        Album album = albumService.getone(albumid);
        album.setNum(imgList.size());
        Integer view = 0;
        Integer approve =0;
        for (Img i:imgList
             ) {
            if(i.getView()==null){i.setView(0);}
            if(i.getApprove()==null){i.setApprove(0);}
            view = view + i.getView();
            approve = approve +i.getApprove();
        }
        modelAndView.addObject("view",view);
        modelAndView.addObject("approve",approve);
        modelAndView.addObject("imgList",imgList);
        modelAndView.addObject("album",album);
        modelAndView.setViewName("front/picturedetail");
        //modelAndView.addObject("pageNo",1);
        //modelAndView.addObject("totalPage",totalPage);
        return modelAndView;
    }

    /**
     * 待开发
     * @param albumid
     * @param pageNo
     * @param session
     * @return
     */
    @RequestMapping("/alubmdetaillist")
    ModelAndView alubmdetaillist(Integer albumid,Integer pageNo,HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        long totals = imgService.getcounts(albumid);
        Long totalPage = (totals + com.campusblog.Constants.PAGE_SIZE - 1) / com.campusblog.Constants.PAGE_SIZE;//总页数
        List<Img> imgList = imgService.getAlbumDetail(albumid, pageNo, com.campusblog.Constants.PAGE_SIZE);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo",pageNo);
        modelAndView.addObject("imgList",imgList);
        modelAndView.setViewName("front/picturedetail");
        return modelAndView;
    }

    /**
     * 保存图片到数据库
     * @param albumid
     * @param urlname 名字
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/addimg")
    MyJsonObj addimg(Integer albumid,String urlname,HttpSession session){
        MyJsonObj jsonObj = new MyJsonObj();
        User user = (User) session.getAttribute("user");
        Img img = new Img();
        img.setuId(user.getuId());
        img.setUrl(urlname);
        img.setAlbumId(albumid);
        img.setCreateTime(Datatool.CreateTime());
        img.setUpdateTime(Datatool.UpdateDatime());
        try {
            imgService.save(img);
            jsonObj.setFlag(true);
            jsonObj.setMessage("OK!");
        }catch (Exception e){
            jsonObj.setFlag(false);
            jsonObj.setMessage("Fail!");
        }
        return jsonObj;
    }

    /**
     * 自己发布留言板留言
     * @param content
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/addmessage")
    MyJsonObj addmessage(String content,Integer touId,String flag,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        User user = (User)session.getAttribute("user");
        Usernote usernote = new Usernote();
        usernote.setuId(user.getuId());
        usernote.setHostuid(user.getuId());
        usernote.setCreateTime(Datatool.CreateTime());
        usernote.setUpdateTime(Datatool.UpdateDatime());
        if (null!=content&&!content.isEmpty()){
            usernote.setContent(content);
        }else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("评论不能为空");
            return myJsonObj;
        }
        if(null!=touId&&touId!=0){
            usernote.setToUId(touId);
        }
        if (flag!=null&&!flag.isEmpty()){
            usernote.setFlag(flag);
        }
        try {
            userNoteService.save(usernote);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("success");
        }catch (Exception e)
        {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("fail");
        }
        return myJsonObj;
    }

    /**
     * 在别人留言板留言
     * @param content
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/addothermessage")
    MyJsonObj addothermessage(String content,Integer touId,String flag,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        User user = (User)session.getAttribute("user");
        Usernote usernote = new Usernote();
        usernote.setuId(user.getuId());
        usernote.setHostuid(touId);
        usernote.setCreateTime(Datatool.CreateTime());
        usernote.setUpdateTime(Datatool.UpdateDatime());
        if (null!=content&&!content.isEmpty()){
            usernote.setContent(content);
        }else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("评论不能为空");
            return myJsonObj;
        }
        if(null!=touId&&touId!=0){
            usernote.setToUId(touId);
        }
        if (flag!=null&&!flag.isEmpty()){
            usernote.setFlag(flag);
        }
        try {
            userNoteService.save(usernote);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("success");
        }catch (Exception e)
        {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("fail");
        }
        return myJsonObj;
    }

    @RequestMapping("/tomessage")
    ModelAndView tomessage (HttpSession session){
        User user = (User) session.getAttribute("user");
            List<UserNoteVo> reVo= new ArrayList();
            List<Usernote> usernotes = userNoteService.getUsernoteListbyhostuId(user.getuId());
            if (null != usernotes && usernotes.size() > 0) {
                for (Usernote n : usernotes
                        ) {
                    UserNoteVo userNoteVo=new UserNoteVo();
                    userNoteVo.setHostuid(n.getHostuid());
                    userNoteVo.setuId(n.getuId());
                    User sendparentuser = userService.getUserById(n.getuId());
                    userNoteVo.setUser(sendparentuser);
                    userNoteVo.setContent(n.getContent());
                    userNoteVo.setCreateTime(n.getCreateTime());
                    userNoteVo.setFlag(n.getFlag());

                    for (Usernote t : usernotes) {
                        if(t.getToUId()==null && n.getFlag()==null){continue;}
                        if(null!=t.getFlag() && t.getFlag().equals(n.getFlag())) {
                            if(t.getId()==n.getId()){continue;}
                            UserNoteVo at = new UserNoteVo();
                            at.setHostuid(t.getHostuid());
                            at.setuId(t.getuId());
                            User sendchirlduser = userService.getUserById(t.getuId());
                            at.setUser(sendchirlduser);
                            at.setContent(t.getContent());
                            at.setCreateTime(t.getCreateTime());
                            userNoteVo.setUserNoteVochirldlist(at);
                        }
                    }
                    if(n.getToUId()==null) {
                        reVo.add(userNoteVo);
                    }
                }
        }
        ModelAndView modelAndView= new ModelAndView();
        modelAndView.addObject("reVo",reVo);
        modelAndView.setViewName("front/message");
        return modelAndView;
    }

    /*
    去别人的留言板
     */
    @RequestMapping("/toothermessage")
    ModelAndView toothermessage (Integer otheruId){
        List<UserNoteVo> reVo= new ArrayList();
        List<Usernote> usernotes = userNoteService.getUsernoteListbyhostuId(otheruId);
        if (null != usernotes && usernotes.size() > 0) {
            for (Usernote n : usernotes
                    ) {
                UserNoteVo userNoteVo=new UserNoteVo();
                userNoteVo.setHostuid(n.getHostuid());
                userNoteVo.setuId(n.getuId());
                User sendparentuser = userService.getUserById(n.getuId());
                userNoteVo.setUser(sendparentuser);
                userNoteVo.setContent(n.getContent());
                userNoteVo.setCreateTime(n.getCreateTime());
                userNoteVo.setFlag(n.getFlag());

                for (Usernote t : usernotes) {
                    if(t.getToUId()==null && n.getFlag()==null){continue;}
                    if(null!=t.getFlag() && t.getFlag().equals(n.getFlag())) {
                        if(t.getId()==n.getId()){continue;}
                        UserNoteVo at = new UserNoteVo();
                        at.setHostuid(t.getHostuid());
                        at.setuId(t.getuId());
                        User sendchirlduser = userService.getUserById(t.getuId());
                        at.setUser(sendchirlduser);
                        at.setContent(t.getContent());
                        at.setCreateTime(t.getCreateTime());
                        userNoteVo.setUserNoteVochirldlist(at);
                    }
                }
                if(n.getToUId()==null) {
                    reVo.add(userNoteVo);
                }
            }
        }
        ModelAndView modelAndView= new ModelAndView();
        modelAndView.addObject("reVo",reVo);
        modelAndView.setViewName("front/message");
        modelAndView.addObject("otheruId",otheruId);
        return modelAndView;
    }

    @RequestMapping("/tofriend")
    ModelAndView tofriend (HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        String friendIds = user.getFriendId();
        String[] strings = friendIds.split(",");
        List<User> friends = new ArrayList();
        Integer people =strings.length;
        if(null!=friendIds&&!friendIds.isEmpty()) {
            for (String uId : strings
                    ) {
                if(uId==null||uId.equals("")){break;}
                User userById = userService.getUserById(Integer.parseInt(uId));
                friends.add(userById);
            }
        }
        List<User> hotuserlist = userService.gethotuser(5);
        modelAndView.addObject("hotuserlist",hotuserlist);
        modelAndView.setViewName("front/friend");
        modelAndView.addObject("friends",friends);
        modelAndView.addObject("people",people);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/addcollection")
    MyJsonObj addcollection(Integer articleId,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        CollectionTEntity collectionTEntity = new CollectionTEntity();
        collectionTEntity.setArticleId(articleId);
        User user = (User)session.getAttribute("user");
        collectionTEntity.setuId(user.getuId());
        collectionTEntity.setArticleId(articleId);
        collectionTEntity.setCreateTime(Datatool.CreateTime());
        try {
            collectionService.add(collectionTEntity);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("已收藏");
        }catch (Exception e)
        {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("收藏失败");
        }
        return myJsonObj;
    }


    @RequestMapping("/tocollection")
    ModelAndView tocollection (HttpSession session){
        ModelAndView modelandview = new ModelAndView();
        User user = (User) session.getAttribute("user");
        List<CollectionTEntity> collectionTEntities = collectionService.getcollections(user.getuId());
        List<ArticleVo> articleVos = new ArrayList<>();
        for (CollectionTEntity c:collectionTEntities
             ) {
            Article articleByarticleId = articleService.getArticleByarticleId(c.getArticleId());
            ArticleVo articleVo = new ArticleVo();
            articleVo.setTitile(articleByarticleId.getTitile());
            articleVo.setArticleId(articleByarticleId.getArticleId());
            articleVo.setContent(articleByarticleId.getContent());
            articleVo.setuId(articleByarticleId.getuId());
            articleVo.setCreateTime(articleByarticleId.getCreateTime());
            articleVo.setView(c.getId());
            articleVos.add(articleVo);
        }
        List<ArticleVo> hotcollectionsVos = new ArrayList<>();
        List<Integer> gethotcollection = collectionService.gethotcollection(5);
        int v = 1;
        for (Integer i:gethotcollection
             ) {
            Article articleByarticleId = articleService.getArticleByarticleId(i);
            ArticleVo articleVo = new ArticleVo();
            articleVo.setTitile(articleByarticleId.getTitile());
            articleVo.setArticleId(articleByarticleId.getArticleId());
            articleVo.setContent(articleByarticleId.getContent());
            articleVo.setuId(articleByarticleId.getuId());
            articleVo.setCreateTime(articleByarticleId.getCreateTime());
            articleVo.setView(v);
            hotcollectionsVos.add(articleVo);
            v=v+1;
        }

        modelandview.addObject("collectarticles",articleVos);
        modelandview.addObject("hotcollectionsVos",hotcollectionsVos);
        modelandview.addObject("total",articleVos.size());
        modelandview.setViewName("front/collect");
        return modelandview;
    }

    @ResponseBody
    @RequestMapping("/delcollection")
    MyJsonObj delcollection (Integer id,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        try {
            collectionService.del(id);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("已删除");
        }catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("删除失败");
        }
        return myJsonObj;
    }

    /**
     * 博友浏览页关注
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/addfriend")
    MyJsonObj addfriend(Integer uId,HttpSession session){
        User user = (User) session.getAttribute("user");
        MyJsonObj myJsonObj = new MyJsonObj();
        if (null == user.getFriendId() || user.getFriendId().isEmpty()) {
            user.setFriendId(uId.toString());
            if(user.getFocus()==null){
                user.setFocus(0);
            }
            user.setFocus(user.getFocus()+1);
            userService.saveOrUpdate(user);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("已经添加到了您的关注列表中");
        } else {
            String s =user.getFriendId();
            String[] strings = s.split(",");
            List<String> list=Arrays.asList(strings);
            if(!list.contains(uId.toString())) {
                String friendstring = user.getFriendId() + "," + uId;
                user.setFriendId(friendstring);
                if(user.getFocus()==null){
                    user.setFocus(0);
                }
                user.setFocus(user.getFocus()+1);
                userService.saveOrUpdate(user);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("已经添加到了您的关注列表中");
            }else {
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("已经在您的关注列表中");
            }
        }
        return myJsonObj;

    }

    @ResponseBody
    @RequestMapping("/removefriend")
    MyJsonObj removefriend(Integer uId,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        User user = (User) session.getAttribute("user");
        if (null != user.getFriendId() && !user.getFriendId().isEmpty()) {
            String s =user.getFriendId();
            String[] strings = s.split(",");
            StringBuffer sb = new StringBuffer();
            for(int i = 0;i<strings.length;i++) {
                if (!uId.toString().equals(strings[i])) {
                    sb.append(strings[i] + ",");        //append String并不拥有该方法，所以借助StringBuffer
                }
            }
            user.setFriendId(sb.toString());
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("移除成功");
            userService.saveOrUpdate(user);
        }
        return myJsonObj;

    }

    @RequestMapping("/towrite")
    public ModelAndView towrite(HttpSession session){
        User user =(User) session.getAttribute("user");
        List<CodeType> types = codeTypeService.gettypebyuid(user.getuId());
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("front/write");
        modelAndView.addObject("types",types);
        return modelAndView;
    }

    @RequestMapping("/tomen")
    public ModelAndView tomen(HttpSession session){
        User user =(User) session.getAttribute("user");
        ModelAndView modelAndView=new ModelAndView();
        List<MemorynoteTEntity> list = memoryNoteService.getmemorynotes(user.getuId());
        List<MemoryNoteVo> mvo = new ArrayList<>();
        for (MemorynoteTEntity m:list
             ) {
            MemoryNoteVo memoryNoteVo = new MemoryNoteVo();
            memoryNoteVo.setId(m.getId());
            memoryNoteVo.setuId(m.getuId());
            memoryNoteVo.setContent(m.getContent());
            memoryNoteVo.setCreateTime(m.getCreateTime());
            mvo.add(memoryNoteVo);
        }
        modelAndView.setViewName("front/mem");
        modelAndView.addObject("mvo",mvo);
        return modelAndView;
    }
/*
手机端备忘录
 */
@ResponseBody
@RequestMapping("/menlist")
public List<MemoryNoteVo> menlist(HttpSession session){
    User user =(User) session.getAttribute("user");
    List<MemorynoteTEntity> list = memoryNoteService.getmemorynotes(user.getuId());
    List<MemoryNoteVo> mvo = new ArrayList<>();
    for (MemorynoteTEntity m:list
            ) {
        MemoryNoteVo memoryNoteVo = new MemoryNoteVo();
        memoryNoteVo.setId(m.getId());
        memoryNoteVo.setuId(m.getuId());
        memoryNoteVo.setContent(m.getContent());
        memoryNoteVo.setCreateTime(m.getCreateTime());
        mvo.add(memoryNoteVo);
    }
    return mvo;
}

    /*
    手机端新增备忘录
     */
    @ResponseBody
    @RequestMapping("/savemen")
    public MyJsonObj savemen(String content,HttpSession session){
        User user = (User) session.getAttribute("user");
        MyJsonObj myJsonObj = new MyJsonObj();
        if(content!=null && !content.equals("")){
            MemorynoteTEntity memorynoteTEntity =new MemorynoteTEntity();
            memorynoteTEntity.setuId(user.getuId());
            memorynoteTEntity.setContent(content);
            memorynoteTEntity.setCreateTime(Datatool.CreateTime());
            try {
                memoryNoteService.add(memorynoteTEntity);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("保存成功");
            }catch (Exception e){
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("数据正在被使用");
            }
        }
            else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("内容不能为空");
        }
        return myJsonObj;
    }

    /*
    手机端删除备忘录
     */
    @ResponseBody
    @RequestMapping("/deletemen")
    public MyJsonObj deletemen(Integer id,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        if(id!=null && id!=0){
            try {
                memoryNoteService.del(id);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("移除成功");
            }catch (Exception e){
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("数据正在被使用");
            }
        }
        else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("Id不能为空");
        }
        return myJsonObj;
    }

    @ResponseBody
    @RequestMapping("/addmem")
    MyJsonObj addmen(String content,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        User user =(User) session.getAttribute("user");
        MemorynoteTEntity memorynoteTEntity =new MemorynoteTEntity();
        memorynoteTEntity.setContent(content);
        memorynoteTEntity.setuId(user.getuId());
        memorynoteTEntity.setCreateTime(Datatool.CreateTime());
        memorynoteTEntity.setUpdateTime(Datatool.UpdateDatime());
        try {
            memoryNoteService.add(memorynoteTEntity);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("已备忘");
        }catch (Exception e)
        {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("备忘失败");
        }
        return myJsonObj;
    }

    @ResponseBody
    @RequestMapping("/delmem")
    MyJsonObj delmem (Integer id,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        try {
            memoryNoteService.del(id);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("已删除");
        }catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("删除失败");
        }
        return myJsonObj;
    }


    @RequestMapping("/toarticle")
    public ModelAndView toarticle(Integer uId,HttpSession session){
            ModelAndView modelAndView=new ModelAndView();
            Long totals = articleService.getArticlecount(uId);
            Long totalPage = (totals + com.campusblog.Constants.PAGE_SIZE - 1) / com.campusblog.Constants.PAGE_SIZE;//总页数
            List<Article> articleListsql = articleService.getArtileListShow(uId, null, null, 1, com.campusblog.Constants.PAGE_SIZE);
            List<ArticleVo> articleList =new ArrayList<>();
            for (Article a:articleListsql
                ) {
            String gettypestring = codeTypeService.gettypestring(Integer.parseInt(a.getType()));
            Timestamp createTime = a.getCreateTime();
            Timestamp updateTime = a.getUpdateTime();
            Date createtime = new Date(createTime.getTime());
            Date updatetime = new Date(updateTime.getTime());

            ArticleVo articleVo = new ArticleVo();
            articleVo.setType(gettypestring);
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
        List<CodeType> types = codeTypeService.gettypebyuid(uId);
        modelAndView.addObject("types",types);
        // 所有日志
        Long alltotal = articleService.getArticlecountByconditon(uId,0,"");
        // 默认日志
        Long defaluttotal = articleService.getArticlecountByconditon(uId,1,"");
        //热门文章
        List<Article> hotArticlelistByCondition = articleService.getHotArticlelistByCondition(null, null, null, null, 0, 5);
        //是否被关注用户
        User user = (User) session.getAttribute("user");
        Boolean flag=false;
        String friendId = user.getFriendId();
        if(friendId!=null&&!friendId.isEmpty()){
            String[] strings = friendId.split(",");
            List<String> list=Arrays.asList(strings);
            if(list.contains(uId.toString())){
                flag=true;
            }
        }
        User userById = userService.getUserById(uId);
        modelAndView.addObject("flag",flag);
        modelAndView.addObject("hotarticles",hotArticlelistByCondition);
        modelAndView.addObject("alltotal",alltotal);
        modelAndView.addObject("defaluttotal",defaluttotal);
        modelAndView.addObject("totals",totals);
        modelAndView.addObject("articles",articleList);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo", 1);
        modelAndView.addObject("userById",userById);
        modelAndView.setViewName("front/article");
        return modelAndView;
    }

    @RequestMapping("/toarticledetail")
    public ModelAndView toarticledetail(Integer articleId,Integer uId){
        ModelAndView modelAndView = new ModelAndView();
        User userById = userService.getUserById(uId);
        List<Integer> viewuids = articleService.getviewuIds(articleId);
        if (!viewuids.contains(uId)) {
                articleService.addview(articleId,uId);
        }
        Article a = articleService.getArticleByarticleId(articleId);
        String gettypestring = codeTypeService.gettypestring(Integer.parseInt(a.getType()));
        Timestamp createTime = a.getCreateTime();
        Timestamp updateTime = a.getUpdateTime();
        Date createtime = new Date(createTime.getTime());
        Date updatetime = new Date(updateTime.getTime());

        ArticleVo articleVo = new ArticleVo();
        articleVo.setType(gettypestring);
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
        articleVo.setArticleId(a.getArticleId());
        // 所有日志
        Long alltotal = articleService.getArticlecountByconditon(uId,0,"");
        // 默认日志
        Long defaluttotal = articleService.getArticlecountByconditon(uId,1,"");
        //热门文章
        List<Article> hotArticlelistByCondition = articleService.getHotArticlelistByCondition(null, null, null, null, 0, 5);
        //获取当前页的评论
        Long notecount = articleService.getArticleNotecount(articleId);
        List<ArticleNoteVo> articlenoteVo = getArticlenoteVo(articleId);
        modelAndView.addObject("notecount",notecount);
        modelAndView.addObject("articlenoteVo",articlenoteVo);
        modelAndView.addObject("hotarticles",hotArticlelistByCondition);
        modelAndView.addObject("alltotal",alltotal);
        modelAndView.addObject("defaluttotal",defaluttotal);
        List<CodeType> types = codeTypeService.gettypebyuid(uId);
        modelAndView.addObject("types",types);
        modelAndView.addObject("article",articleVo);
        modelAndView.setViewName("front/articledetail");
        modelAndView.addObject("userById",userById);
        return modelAndView;
    }

    /*
    手机端日志详情
     */
    @RequestMapping("/articledetail")
    public ArticleVo toarticledetail(Integer articleId){
        Article a = articleService.getArticleByarticleId(articleId);
        String gettypestring = codeTypeService.gettypestring(Integer.parseInt(a.getType()));
        Timestamp createTime = a.getCreateTime();
        Timestamp updateTime = a.getUpdateTime();
        Date createtime = new Date(createTime.getTime());
        Date updatetime = new Date(updateTime.getTime());

        ArticleVo articleVo = new ArticleVo();
        articleVo.setType(gettypestring);
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
        articleVo.setArticleId(a.getArticleId());
        return articleVo;
    }

    @RequestMapping("/login")
    public ModelAndView login(String username,String password,String captcha,String returnUrl,Integer auto,HttpSession session,HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (code.equals(captcha)) {
            if (!String.valueOf(username).isEmpty() && !String.valueOf(password).isEmpty()) {
                User getone = userService.getone(Integer.parseInt(username), password);
                if (getone != null) {
                    session.setAttribute("user", getone);
                    if(auto!=null&&auto!=1){
                        String Json = "";
                        try {
                            ObjectMapper mapper = new ObjectMapper();
                            Json = mapper.writeValueAsString(getone);//一个对象转换  json 字符串
                        } catch (JsonProcessingException e) {
                            e.printStackTrace();
                        }
                        Cookie cookie = new Cookie("user", Json);
                        cookie.setMaxAge(60 * 60 * 24);
                        cookie.setPath("/"); //保证不同的url请求还可以读cookie,否则其他页面读不到
                        response.addCookie(cookie);
                    }
                    if (returnUrl != null && !returnUrl.isEmpty()) {
                        String returnurl="redirect:"+returnUrl+"?uId="+getone.getuId();
                        modelAndView.setViewName(returnurl);
                        return modelAndView;
                    }
                    modelAndView.setViewName("forward:/front/user/toindex");
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
/*
手机端登录
 */
    @ResponseBody
    @RequestMapping("/phonelogin")
    public MyJsonObj phonelogin(String username,String password,HttpSession session) {
        /*String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);*/
        MyJsonObj myJsonObj=new MyJsonObj();
        /*if (code.equals(captcha)) {*/
            if (!String.valueOf(username).isEmpty() && !String.valueOf(password).isEmpty()) {
                User getone = userService.getone(Integer.parseInt(username), password);
                if (getone != null) {
                    session.setAttribute("user", getone);
                    myJsonObj.setType(1);
                    myJsonObj.setMessage("登录成功");
                } else {
                    myJsonObj.setType(0);
                    myJsonObj.setMessage("账号或密码错误");
                }
            } else {
                myJsonObj.setType(0);
                myJsonObj.setMessage("请输入账号和密码");
            }
    /*    }else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("验证码错误");
        }*/
        return myJsonObj;
    }

    /*
    手机端热门日志列表
     */
    @ResponseBody
    @RequestMapping("/articles")
    Map getarticlesbypage(Integer pageNo) {
        int end = pageNo * 10;
        int begin = end - 10;
        long totals = articleService.gethotarticletotalpage();
        Long totalPage = (totals + 10 - 1) / 10;//总页数
        List<Article> hotArticlelist =articleService.getHotArticlelistByCondition(null, null, null, null,begin,end);
        for (Article a:hotArticlelist
             ) {
            User byId = userService.getUserById(a.getuId());
            String fullname = byId.getFullname();
            a.setimpose(fullname);
        }
        Map<String,Object> map = new HashMap<>();
        map.put("totalPage",totalPage);
        map.put("hotArticlelist",hotArticlelist);
        return map;
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
        user.setPic("/static/front/img/my.jpg");
   /*     String wcode = session.getAttribute("code")+"";
        if (code != null && code.equals(wcode)) {*/
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
   /*     }else {
            myJsonObj.setMessage("验证码错误！");
            return myJsonObj;
        }*/
    }

    /**
     * 文章评论
     * 持久化articenote
     * @param
     * @return MyJsonObj
     */
    @ResponseBody
    @RequestMapping("/articenotesaveOrUpadate")
    public MyJsonObj articenotesav(Integer articleId,String content,Integer toUId,String flag,HttpSession session ){
        MyJsonObj myJsonObj = new MyJsonObj();
        User user = (User)session.getAttribute("user");
        if(user==null){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("请登录后评论");
            return myJsonObj;
        }
        Articlenote articlenote =new Articlenote();
        articlenote.setuId(user.getuId());
        if(toUId!=null&&toUId!=0){
        articlenote.setToUId(toUId);}
        articlenote.setArticleId(articleId);
        articlenote.setContent(content);
        articlenote.setCreateTime(Datatool.CreateTime());
        articlenote.setFlag(flag);
        try {
            articleNoteService.save(articlenote);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("评论成功");
        }catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("评论错误，数据库save异常");
        }
        return myJsonObj;
    }

    /**
     * 持久化article
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/articlesaveOrUpadate")
    public MyJsonObj addarticle( String uId,Integer articleId,String titile,String content,@RequestParam(defaultValue = "1", required = false)String type,String impose,Integer access,HttpSession session) {
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
    public ModelAndView articleList(Integer uId,String front,Integer type,Integer pageNo){
        ModelAndView modelAndView=new ModelAndView();
        Long totals = articleService.getArticlecountByconditon(uId,type,front);
        Long totalPage = (totals + com.campusblog.Constants.PAGE_SIZE - 1) / com.campusblog.Constants.PAGE_SIZE;//总页数
        List<Article> articleListsql = articleService.getArtileListShow(uId, type, front, pageNo, com.campusblog.Constants.PAGE_SIZE);
        // 所有日志
        Long alltotal = articleService.getArticlecountByconditon(uId,0,"");
        // 默认日志
        Long defaluttotal = articleService.getArticlecountByconditon(uId,1,"");
        List<ArticleVo> articleList =new ArrayList<>();
        for (Article a:articleListsql
             ) {
            String gettypestring = codeTypeService.gettypestring(Integer.parseInt(a.getType()));
            Timestamp createTime = a.getCreateTime();
            Timestamp updateTime = a.getUpdateTime();
            Date createtime = new Date(createTime.getTime());
            Date updatetime = new Date(updateTime.getTime());

            ArticleVo articleVo = new ArticleVo();
            articleVo.setType(gettypestring);
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
        //热门文章
        List<Article> hotArticlelistByCondition = articleService.getHotArticlelistByCondition(null, null, null, null, 0, 5);
        modelAndView.addObject("hotarticles",hotArticlelistByCondition);
        User userById = userService.getUserById(uId);
        List<CodeType> types = codeTypeService.gettypebyuid(uId);
        modelAndView.addObject("types",types);
        modelAndView.addObject("totals",totals);
        modelAndView.addObject("alltotal",alltotal);
        modelAndView.addObject("defaluttotal",defaluttotal);
        modelAndView.addObject("articles",articleList);
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("pageNo", pageNo);
        modelAndView.addObject("retype", type);
        modelAndView.addObject("refront", front);
        modelAndView.addObject("userById", userById);
        modelAndView.setViewName("front/article");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/clickapprove")
    public MyJsonObj clickapprove(Integer uId,Integer articleId) {
        MyJsonObj myJsonObj = new MyJsonObj();
        List<Integer> ids = articleService.getuIds(articleId);
        if (!ids.contains(uId)) {
            try {
                articleService.addapprove(articleId, uId);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("点赞成功！");
                return myJsonObj;
            } catch (Exception e) {
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("点赞失败了");
                return myJsonObj;
            }
        } else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("您已经点过赞了，谢谢");
            return myJsonObj;
        }
    }

    /**
     * 文章浏览页关注
     * @param
     * @return
     */
    @RequestMapping("/fcous")
    String fcous(Integer uId,HttpSession session) {
        User user = (User) session.getAttribute("user");
            if (user.getFriendId() == null || user.getFriendId().isEmpty()) {
                user.setFriendId(uId.toString());
                if(user.getFocus()==null){
                    user.setFocus(0);
                }
                user.setFocus(user.getFocus()+1);
                userService.saveOrUpdate(user);
                return "forward:/front/user/toarticle";
            } else {
                String s =user.getFriendId();
                String[] strings = s.split(",");
                List<String> list=Arrays.asList(strings);
                if(!list.contains(uId.toString())) {
                    String friendstring = user.getFriendId() + "," + uId;
                    user.setFriendId(friendstring);
                    if(user.getFocus()==null){
                        user.setFocus(0);
                    }
                    user.setFocus(user.getFocus()+1);
                    userService.saveOrUpdate(user);
                }
            }
            return "forward:/front/user/toarticle";

    }

    /**
     * 热门博主浏览页关注
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/hotfcous")
    MyJsonObj hotfcous(Integer uId,HttpSession session) {
        MyJsonObj myJsonObj= new MyJsonObj();
        User user = (User) session.getAttribute("user");
        if (user.getFriendId() == null || user.getFriendId().isEmpty()) {
            user.setFriendId(uId.toString());
            if(user.getFocus()==null){
                user.setFocus(0);
            }
            user.setFocus(user.getFocus()+1);
            userService.saveOrUpdate(user);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("关注成功");
            return myJsonObj;
        } else {
            String s =user.getFriendId();
            String[] strings = s.split(",");
            List<String> list=Arrays.asList(strings);
            if(!list.contains(uId.toString())) {
                String friendstring = user.getFriendId() + "," + uId;
                user.setFriendId(friendstring);
                if(user.getFocus()==null){
                    user.setFocus(0);
                }
                user.setFocus(user.getFocus()+1);
                userService.saveOrUpdate(user);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("关注成功");
                return myJsonObj;
            }else {
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("该博主已经在您的关注列表");
                return myJsonObj;
            }
        }
    }

    @ResponseBody
    @RequestMapping("/addalubm")
    MyJsonObj addalubm(String name,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        User user = (User)session.getAttribute("user");
        Album album = new Album();
        album.setUid(user.getuId());
        album.setAlbname(name);
        album.setCreateTime(Datatool.CreateTime());
        album.setUpdateTime(Datatool.UpdateDatime());
        album.setDef("/static/front/img/4.jpg");
        try {
            albumService.save(album);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("已新增");
        }catch (Exception e)
        {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("新建失败");
        }
        return myJsonObj;
    }

    @ResponseBody
    @RequestMapping("/delalubm")
    MyJsonObj delalubm (Integer id,HttpSession session){
        MyJsonObj myJsonObj = new MyJsonObj();
        try {
            albumService.del(id);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("已删除");
        }catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("删除失败");
        }
        return myJsonObj;
    }

    /*
    相片详情点赞
     */
    @ResponseBody
    @RequestMapping("/imgapprove")
    public MyJsonObj imgapprove(Integer iId) {
        MyJsonObj myJsonObj = new MyJsonObj();
        Img img = imgService.getByImgId(iId);
        if (img!=null) {
            try {
                Integer approve = img.getApprove();
                if(approve==null){
                    approve=0;
                }
                Integer view = img.getView();
                if(view==null){
                    view=0;
                }
                img.setView(view+1);
                img.setApprove(approve+1);
                imgService.save(img);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("点赞成功！");
                return myJsonObj;
            } catch (Exception e) {
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("点赞失败了");
                return myJsonObj;
            }
        } else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("数据库查询异常");
            return myJsonObj;
        }
    }

    /*
   相片详情删除
    */
    @ResponseBody
    @RequestMapping("/imgdel")
    public MyJsonObj imgdel(Integer iId) {
        MyJsonObj myJsonObj = new MyJsonObj();
        Img img = imgService.getByImgId(iId);
        if (img != null) {
            try {
                imgService.del(iId);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("删除成功！");
                return myJsonObj;
            } catch (Exception e) {
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("删除失败了");
                return myJsonObj;
            }
        }
        return myJsonObj;
    }


    public List<ArticleNoteVo> getArticlenoteVo(Integer articleId){
        List<ArticleNoteVo> reVo= new ArrayList();
        List<Articlenote> articlenotes = articleNoteService.getArticlenoteListbyarticleId(articleId);
        if (null != articlenotes && articlenotes.size() > 0) {
            for (Articlenote n : articlenotes
                    ) {
                ArticleNoteVo articleNoteVo=new ArticleNoteVo();
                articleNoteVo.setArticleId(n.getArticleId());
                articleNoteVo.setuId(n.getuId());
                User sendparentuser = userService.getUserById(n.getuId());
                articleNoteVo.setUser(sendparentuser);
                articleNoteVo.setContent(n.getContent());
                articleNoteVo.setCreatetime(n.getCreateTime());
                articleNoteVo.setFlag(n.getFlag());

                for (Articlenote t : articlenotes) {
                        if(t.getToUId()==null && n.getFlag()==null){continue;}
                            if(null!=t.getFlag() && t.getFlag().equals(n.getFlag())) {
                                if(t.getId()==n.getId()){continue;}
                                ArticleNoteVo at = new ArticleNoteVo();
                                at.setArticleId(t.getArticleId());
                                at.setuId(t.getuId());
                                User sendchirlduser = userService.getUserById(t.getuId());
                                at.setUser(sendchirlduser);
                                at.setContent(t.getContent());
                                at.setCreatetime(t.getCreateTime());
                                articleNoteVo.setArticleNoteVochirldlist(at);
                            }
                }
                if(n.getToUId()==null) {
                    reVo.add(articleNoteVo);
                }
            }


        }
        return reVo;
    }

}
