package com.campusblog.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/3/24.
 */
@Controller
@RequestMapping("/front/index")
public class IndexController {
    @RequestMapping("/toindex")
    public String toIndex(){
        return "front/index";
    }

    @RequestMapping("/tolog")
    public String toLog(){
        return "front/log";
    }
}
