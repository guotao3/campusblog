package com.campusblog.ImgServiceTest;

import com.campusblog.entity.Img;
import com.campusblog.service.ImgService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/*Created by Administrator on 2016/12/15.*/


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:bean.xml")
public class ImgServiceTest {
    @Resource
    ImgService imgService;
    @Test
    public void imgsave(){
        Img img= new Img();
        img.setUrl("www.bbb.257.com");
        img.setView(20);
        imgService.save(img);
    }
    @Test
    public void imgfindone(){
        System.out.println(imgService.getByImgId(1).toString());
    }
    @Test
    public void albumfindone(){
        Img imgs = imgService.getByAlbumId(1);
        System.out.println(imgs);
        System.out.println(imgs.getAblum().toString());

    }
    @Test
    public void getdefbyalbumid(){
        List<Img> imgs = imgService.getAlbumDetail(1,1,1);
        System.out.println(imgs.toString());

    }


}
