package com.campusblog.controller.interceptor.interceptor;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * Created by dengry on 2017/2/5.
 */
public class FrontInterceptor extends HandlerInterceptorAdapter {
    //不需要拦截
    private static final String[] IGNORE_URI = {"/front/user/login", "/front/user/toregister", "/front/user/kaptcha", "/front/user/logout", "/front/user/tolog",
            "/front/user/toindex","/front/user/tofamous_person","/front/user/tofamous_picture","/front/user/tofamous_article","/front/user/toothers_main","/front/user/getcode","/front/user/toreport",
            "/front/user/phonelogin","/front/user/articles","/front/user/menlist","/front/user/savemen","/front/user/deletemen","/front/user/articledetail","/front/user/saveOrUpadate","/front/user/addothermessage"};
    //需要拦截  /front/buyer/*
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object buyer = session.getAttribute("user");
        if (buyer != null) {
            return true;
        } else {
            String requestURI = request.getRequestURI();
            String queryString = request.getQueryString();
            requestURI = requestURI +"?1=1";
            if(queryString!=null) {
                if(!queryString.equals("uId=")) {
                    requestURI = requestURI + "&" + queryString;
                }
            }
            session.setAttribute("returnUrl",requestURI);
            response.sendRedirect("/front/user/tolog?returnUrl=" + requestURI);
            return false;
        }
    }


}
