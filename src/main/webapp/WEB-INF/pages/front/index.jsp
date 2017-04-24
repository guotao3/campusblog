<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/main2.css" />
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
            <c:choose>
            <c:when test="${sessionScope.user==null}">
                <div class="another">
                    <div class="b">
                        <button type="button" onclick="window.location.href='/front/user/tolog'"><a href="javascript:void(0);">登录</a></button>
                        <button type="button" onclick="window.location.href='/front/user/toregister'"><a href="javascript:void(0);">注册</a></button>
                    </div>
                </div>
            </c:when>
            <c:when test="${sessionScope.user!=null}">
            <div class="dl">
                <button>头像</button>
                <p>登录名</p>
            </div>
            </c:when>
                <c:otherwise>暂无</c:otherwise>
            </c:choose>
        	<nav>
                <ul>
                    <li><a href="/front/user/toindex">首页</a></li>
                    <li><a href="/front/user/toarticle?uId=${sessionScope.user.uId}">日志</a></li>
                    <li><a href="/front/user/tophoto">相册</a></li>
                    <li><a href="/front/user/tofriend">博友</a></li>
                    <li><a href="/front/user/tocollection">收藏</a></li>
                    <li><a href="/front/user/tomessage">留言板</a></li>
                    <li><a href="/front/user/tomen">备忘录</a></li>
                    <li><a href="/front/user/tousercenter">个人中心</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div id="search">
    	<div class="bd">
    		<form method="post">
        		<input id="font" type="text" placeholder="请输入关键字搜索" />
            	<button><a href="/front/user/tofamous_article">搜索</a></button>
        	</form>
        </div>
        <div class="below">
        	<button onclick="window.location.href='/front/user/tofamous_article'"><a href="#">热门日志</a></button>
            <button onclick="window.location.href='/front/user/tofamous_picture'"><a href="#">热门图片</a></button>
            <button  onclick="window.location.href='/front/user/tofamous_person'"><a href="#">人气博主</a></button>
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
                <li class="f">热门日志<a href="/front/user/tofamous_article" class="more">更多</a></li>
                <c:forEach items="${hotarticlelist}" var="article">
                    <c:if test="${article.content.length()>15}">
                        <li>${article.content.substring(0,15)}<span class="time"><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd"/></span></li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="rb">
        	<ul>
                <li class="f">热门博主<a href="/front/user/tofamous_person" class="more">更多</a></li>
            </ul>
            <c:forEach items="${hotuserlist}" var="hotuser">
                <div class="p"><a href="/front/user/toothers_main?uId=${hotuser.uId}"><img src="http://localhost:8089/img-web/upload/${hotuser.pic}" /></a></div>
            </c:forEach>
            
        </div>
    </section>
    <section class="tuijian">
        <ul>
        <li></li>
        </ul>
    </section>
    <section class="second">
    	<p class="title">精品好文</p>
        <ul>
        	<li><a href="#"><img src="/static/front/img/my.jpg" /><p>游记</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>八卦</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>影片</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>情感</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>教育</p></a></li>
            <li><a href="#"><img src="/static/front/img/my.jpg" /><p>jgjg</p></a></li>
        </ul>
    </section>
    <footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>
</div>
<script>
    function jump(pageNo) {
        var font= $("#font").val();
        window.location.href="/front/user/tofamous_article?1=1"+"&font="+font+"&pageNo="+pageNo;
    }
</script>
</body>
</html>
