package com.campusblog.ArticleServiceTest;

import com.campusblog.dao.ArticleDao;
import com.campusblog.dao.ImgDao;
import com.campusblog.entity.Album;
import com.campusblog.entity.Article;
import com.campusblog.service.AlbumService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:bean.xml")
public class ArticleServiceTest {
    @Resource
    ArticleDao articleDao;

    @Test
    public void getArticleByarticleId(){
        Article byarticleId = articleDao.getArticleByarticleId(1);
        System.out.println(byarticleId);
    }
    @Test
    public void saveOrUpdateArticleByArticleId(){
        Article article= new Article();
        article.setArticleId(4);
        Article byarticleId = articleDao.saveOrUpdateArticleByArticleId(article);
        System.out.println(byarticleId);
    }
    @Test
    public void getArticlelistByCondition(){
        List<Article> articleList = articleDao.getArticlelistByCondition(1,"",null,null,0,1);
        System.out.println(articleList);
    }
    @Test
    public void getCountArticlelistByCondition(){
        long countArticlelistByCondition = articleDao.getCountArticlelistByCondition(1, "", null, null);
        System.out.println(countArticlelistByCondition);
    }
}
