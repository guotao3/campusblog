package com.campusblog.controller.back;

import com.campusblog.entity.Article;
import com.campusblog.service.ArticleService;
import com.campusblog.utils.Datatool;
import com.campusblog.utils.JsonObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/13.
 */
@Controller
@RequestMapping("/back/article")
public class ArticleController {
    @Resource
    ArticleService articleService;

    /**
     * 跳转到文章管理列表
     * @return
     */
    @RequestMapping(value = "/toarticlelist")
    public String articlelist(){
        return "back/article/list";
    }

    /**
     * 跳转到热门文章管理列表
     * @return
     */
    @RequestMapping(value = "/tohotarticlelist")
    public String hotarticlelist(){
        return "back/article/hotlist";
    }

    /**
     * 跳转到文章详情页 只可读
     * @return
     */
    @RequestMapping(value = "/toread")
    public ModelAndView articlebyarticleid(Integer articleid, ModelAndView modelAndView){
        Article article = articleService.getArticleByarticleId(articleid);
        modelAndView.addObject(article);
        modelAndView.setViewName("back/article/read");
        String str = article.getContent().replaceAll("\r\n","<br>");
        article.setContent(str);
        return modelAndView;
    }

    /**
     * 对文章带条件分页
     * @param uid      学号
     * @param titile  题目
     * @param approve 热度
     * @param view    阅读数
     * @param offset   索引
     * @param limit   显示条目
     * @return     map
     */
    //带条件的分页
    @RequestMapping("/articlelist")
    @ResponseBody
    public Map articlelistinit(@RequestParam(name ="uid",required = false) Integer uid,
                        @RequestParam(name ="titile",required = false) String titile,
                        @RequestParam(name ="approve",required = false) Integer approve,
                        @RequestParam(name ="view",required = false) Integer view,Integer offset, Integer limit) {
        List<Article> articles = articleService.getArticlelistByCondition(uid,titile,approve,view,offset,limit);
        transcontent(articles);
        long totals = articleService.getCountArticlelistByCondition(uid,titile,approve,view);
        Map<String,Object> map = new HashMap<>();
        map.put("rows", articles);
        map.put("total", totals);
        return map;
    }

    /**
     * 对热门文章带条件分页
     * @param uid      学号
     * @param titile  题目
     * @param approve 热度
     * @param view    阅读数
     * @param offset   索引
     * @param limit   显示条目
     * @return     map
     */
    //带条件的分页
    @RequestMapping("/hotarticlelist")
    @ResponseBody
    public Map hotarticlelistinit(@RequestParam(name ="uid",required = false) Integer uid,
                               @RequestParam(name ="titile",required = false) String titile,
                               @RequestParam(name ="approve",required = false) Integer approve,
                               @RequestParam(name ="view",required = false) Integer view,Integer offset, Integer limit) {
        List<Article> articles = articleService.getHotArticlelistByCondition(uid,titile,approve,view,offset,limit);
        transcontent(articles);
        long totals = articleService.getHotCountArticlelistByCondition(uid,titile,approve,view);
        Map<String,Object> map = new HashMap<>();
        map.put("rows", articles);
        map.put("total", totals);
        return map;
    }

    /**
     * 持久化article
     * @param article
     * @return
     */
    @RequestMapping("/saveOrUpadate")
    public String add(Article article) {
        if(articleService.getArticleByarticleId(article.getuId())==null) {
            article.setCreateTime(Datatool.CreateTime());
            article.setUpdateTime(Datatool.UpdateDatime());
        }else{
            Article article1=articleService.getArticleByarticleId(article.getuId());
            article1.setCreateTime(Datatool.UpdateDatime());
        }
        articleService.saveOrUpdateArticleByArticleId(article);
        return "redirect:";
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
                articleService.del(id);
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
        if(!ids.isEmpty()) {
            try {
                articleService.delbyarticleIds(ids);
            } catch (Exception e) {
                jsonObj.setFlag(false);
            }
        }else {
            jsonObj.setFlag(false);
        }
        jsonObj.setFlag(true);
        return jsonObj;
    }

    /**
     * 显示content概要
     * @param articles
     * @return
     */
    List<Article> transcontent(List<Article> articles) {
        for (Article article : articles
                ) {
            Integer strlen = article.getContent().length();
            if (strlen >= 20) {
                String substring = article.getContent().substring(0, 20);
                article.setContent(substring + "......");
            }
        }
        return  articles;
    }

}
