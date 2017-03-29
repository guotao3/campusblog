<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/main.css" />
<script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/static/front/js/lb.js"></script> 
</head>

<body>
<div id="main-wrapper">
    <header>
    	<div id="logo">
        	<img src="/static/front/img/logo.jpg" />
        </div>
        <div id="right">
        	<div class="another">
            	<div class="b">
                    <button type="button" onclick="window.location.href='/front/index/tolog'"><a href="javascript:void(0);">登录</a></button>
                    <button type="button" onclick="window.location.href='/front/index/tolog'"><a href="javascript:void(0);">注册</a></button>
                </div>
            </div>
        	<nav>
            	<ul>
                	<li><a href="#" class="sy">首页</a></li>
                    <li><a href="#">日志</a></li>
                    <li><a href="#">相册</a></li>
                    <li><a href="#">博友</a></li>
                    <li><a href="#">收藏</a></li>
                    <li><a href="#">留言板</a></li>
                    <li><a href="#">备忘录</a></li>
                    <li><a href="#">个人中心</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div id="search">
    	<div class="bd">
    		<form method="post">
        		<input type="text" placeholder="请输入关键字搜索" />
            	<button><a href="#">搜索</a></button>
        	</form>
        </div>
        <div class="below">
        	<button><a href="#">热门日志</a></button>
            <button><a href="#">热门图片</a></button>
            <button><a href="#">人气博主</a></button>
            <button><a href="#">通知公告</a></button>
        </div>
    </div>
    <section class="first">
    	<div class="lb">
        	<div id="wrap"> 
             	<div class="slider"> 
                      <ul class="slider-main"> 
                          <li class="slider-panel"> 
                            <img src="/static/front/img/1.jpg">
                           </li> 
                           <li class="slider-panel"> 
                            <img  src="/static/front/img/2.jpg"> 
                           </li> 
                           <li class="slider-panel"> 
                           <img src="/static/front/img/3.jpg"> 
                           </li> 
                           <li class="slider-panel"> 
                            <img src="/static/front/img/4.jpg"> 
                           </li> 
                      </ul> 
                          <div class="slider-extra"> 
                               <ul class="slider-nav"> 
                                <li class="slider-item"></li> 
                                <li class="slider-item"></li> 
                                <li class="slider-item"></li> 
                                <li class="slider-item"></li> 
                               </ul> 
                                <div class="slider-page"> 
   									<a class="slider-pre" href="javascript:;;"><</a> 
    								<a class="slider-next" href="javascript:;;">></a> 
   								</div> 
                          </div> 
 				</div> 
 			</div> 
        </div>
        <div class="rz">
            <ul>
                <li class="f">热门日志<a href="#" class="more">更多</a></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
                <li>开学了哈哈哈<span class="time">02.20</span></li>
            </ul>
        </div>
        <div class="rb">
        	<ul>
                <li class="f">热门博主<a href="#" class="more">更多</a></li>
            </ul>
                <div class="p"><a href="#"><img src="/static/front/img/my.jpg" /></a></div>
                <div class="p"><a href="#"><img src="/static/front/img/my.jpg" /></a></div>
                <div class="p"><a href="#"><img src="/static/front/img/my.jpg" /></a></div>
                <div class="p"><a href="#"><img src="/static/front/img/my.jpg" /></a></div>
            
        </div>
    </section>
    <section class="second">
    	<p class="title">精品好文</p>
        <ul>
        	<li><a href="#"><img src="/static/front/img/my.jpg" /><p>游记</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>八卦</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>影片</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>情感</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>教育</p></a></li>
        </ul>
    </section>
    <section class="third">
    	<div class="left">
        	<div class="inner">
                <a href="#" class="name"><img src="/static/front/img/my.jpg" /><span>帆客船</span></a>
                <span class="title">明日雨水，春回大地</span>
                <p>外媒消息，印度班加罗尔 AI 医疗科技初创企业 SigTuple 完成580万美元 A 轮融资，现有投资者 Accel Partners 领投<a href="#">[详细]</a></p>
                <ul>
                	<li><img src="/static/front/img/my.jpg" /></li>
                    <li><img src="/static/front/img/my.jpg" /></li>
                    <li><img src="/static/front/img/my.jpg" /></li>
                </ul>
                <p class="bo"><span class="time">2月17日 18:21 风水</span><span style="padding-left:5px">董易林风水国学</span>
                <span class="pl">分享</span>
                <span class="share">评论(1)</span></p>
            </div>
        </div>
        <div class="left">
        	<div class="inner">
                <a href="#" class="name"><img src="/static/front/img/my.jpg" /><span>帆客船</span></a>
                <span class="title">明日雨水，春回大地</span>
                <p>外媒消息，印度班加罗尔 AI 医疗科技初创企业 SigTuple 完成580万美元 A 轮融资，现有投资者 Accel Partners 领投<a href="#">[详细]</a></p>
                <ul>
                	<li><img src="/static/front/img/my.jpg" /></li>
                    <li><img src="/static/front/img/my.jpg" /></li>
                    <li><img src="/static/front/img/my.jpg" /></li>
                </ul>
                <p class="bo"><span class="time">2月17日 18:21 风水</span><span style="padding-left:5px">董易林风水国学</span>
                <span class="pl">分享</span>
                <span class="share">评论(1)</span></p>
            </div>
        </div>
    </section>
    <footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>
</div>
</body>
</html>
