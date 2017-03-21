package com.campusblog.AlbumServiceTest;

import com.campusblog.dao.ImgDao;
import com.campusblog.entity.Album;
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
public class AlbumServiceTest {
    @Resource
    AlbumService albumService;
    @Resource
    ImgDao imgDao;
    @Test
    public void findone(){
        Album getone = albumService.getone(1);
        System.out.println(getone.toString());
    }
    @Test
    public void getcounts(){
        Long toals= albumService.getCounts(1340610226);
        System.out.println(toals);
    }

    @Test
    public void getalbumlist(){
        List<Album> albumList = albumService.getAlbumAll(1340610226,1,21);
        for (Album a:albumList
             ) {
            System.out.println(a.toString());
        }
    }

    @Test
    public void getdetailcounts(){
        long getcounts = imgDao.getcounts(1);
        System.out.println(getcounts);

    }

    @Test
    public void delalbum(){
        albumService.del(1);

    }


}
