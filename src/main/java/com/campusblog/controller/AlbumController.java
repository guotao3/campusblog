package com.campusblog.controller;

import com.campusblog.Constants;
import com.campusblog.entity.Album;
import com.campusblog.entity.Img;
import com.campusblog.service.AlbumService;
import com.campusblog.service.ImgService;
import com.campusblog.utils.JsonObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/23.
 */
@Controller
@RequestMapping("/back/album")
public class AlbumController {
    @Resource
    AlbumService albumService;
    @Resource
    ImgService imgService;

    @RequestMapping("list")
    public String AlbumList() {
        return "redirect:/back/album/getlist";
    }

    /**
     * 获取相册列表
     *
     * @param uid
     * @param pageNo
     * @return
     */
    //带条件的分页
    @RequestMapping("/getlist")
    public ModelAndView listinit(@RequestParam(name = "uid", defaultValue = "0", required = false) String uid, @RequestParam(name = "pageNo", defaultValue = "1", required = false) Integer pageNo, ModelAndView modelAndView) {
        long totals = albumService.getCounts(Integer.parseInt(uid));
        Long totalPage = (totals + Constants.PAGE_SIZE - 1) / Constants.PAGE_SIZE;//总页数
        List<Album> albumList = albumService.getAlbumAll(Integer.parseInt(uid), pageNo, Constants.PAGE_SIZE);
        modelAndView.addObject("Albumlist", albumList);
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("pageNo", pageNo);
        modelAndView.setViewName("back/album/list");
        return modelAndView;
    }

    /**
     * 获取相册列表
     * @param albumid
     * @param pageNo
     * @return
     */
    //带条件的分页
    @RequestMapping("/detail")
    public ModelAndView detaillist(String albumid, @RequestParam(name = "pageNo", defaultValue = "1", required = false) Integer pageNo, ModelAndView modelAndView) {
        long totals = albumService.getdetailcounts(Integer.parseInt(albumid));
        Long totalPage = (totals + Constants.PAGE_SIZE - 1) / Constants.PAGE_SIZE;//总页数
        List<Img> detailList = imgService.getAlbumDetail(Integer.parseInt(albumid), pageNo, Constants.PAGE_SIZE);
        modelAndView.addObject("Albumlist", detailList);
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("pageNo", pageNo);
        modelAndView.setViewName("back/album/detail");
        return modelAndView;
    }

    /**
     * 级联删除相册以及旗下的图片
     *
     * @param albumid
     * @return
     */
    @RequestMapping("/del")
    public ModelAndView delbyid(Integer albumid) {
        JsonObj jsonObj = new JsonObj();
        if (!String.valueOf(albumid).isEmpty()) {
            albumService.del(albumid);
            jsonObj.setFlag(true);
        } else {
            jsonObj.setFlag(false);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("jsonObj", jsonObj);
        modelAndView.setViewName("back/album/list");
        return modelAndView;
    }

    /**
     * 旗下的图片
     * @param imgid
     * @return
     */
    @RequestMapping("/delimg")
    public ModelAndView delimgbyid(Integer imgid) {
        ModelAndView modelAndView = new ModelAndView();
        JsonObj jsonObj = new JsonObj();
        if (!String.valueOf(imgid).isEmpty()) {
            imgService.del(imgid);
            jsonObj.setFlag(true);
        } else {
            jsonObj.setFlag(false);
        }
        modelAndView.addObject("jsonObj", jsonObj);
        modelAndView.setViewName("back/album/detail");
        return modelAndView;
    }


}
