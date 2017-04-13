<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/m_articledetail.css" />
<script  type="text/javascript" src="/static/front/js/m_articledetail.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
    <div class="inner">
        <div class="left">
        <p>日志</p>
            <div class="t">
                <p>分类</p>
            </div>
            <div class="c">
                <p class="p1">所有日志(${alltotal})</p>
                <ul style="float:left;">
                    <li class="ad"><a id="add"><img src="/static/front/img/267-plus.png" /></a>
                        <ul class="lb">
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=0&pageNo=1" value="0" <c:if test="${retype==0}"> style="color: skyblue" </c:if>>所有日志</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=1&pageNo=1" value="1" <c:if test="${retype==1}"> style="color: skyblue" </c:if>>默认分类</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=2&pageNo=1" value="2" <c:if test="${retype==2}"> style="color: skyblue" </c:if>>游记</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=3&pageNo=1" value="3" <c:if test="${retype==3}"> style="color: skyblue" </c:if>>八卦</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=4&pageNo=1" value="4" <c:if test="${retype==4}"> style="color: skyblue" </c:if>>影片</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=5&pageNo=1" value="5" <c:if test="${retype==5}"> style="color: skyblue" </c:if>>情感</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=6&pageNo=1" value="6" <c:if test="${retype==6}"> style="color: skyblue" </c:if>>教育</a></li>
                                <c:if test="${!types.isEmpty()}">
                                    <c:forEach var="mtype" items="${types}">
                                        <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=${mtype.code}&pageNo=1">${mtype.type}</a></li>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </ul>
                    </li>    
                </ul>
                <p class="p2">默认日志(${defaluttotal})</p>
            </div> 
        </div>
        <div class="center">
        	<div class="inn">
                <p class="title">${article.titile}</p>
                <p class="time">${article.updateTime}</p>
                <div id="content">${article.content}</div>
                <div class="l">
                    <span>分类: </span>
                    <span style="border-right:1px solid #000; padding-right:2px">${article.type}</span>
                    <span id="yd" total="0" style="border-right:1px solid #000; padding-right:2px">阅读(${article.view})</span>
                    <span class="pl">评论(0)</span>
                </div>
               <div class="r">
               		<span><a href="javascript:;"class="praise" title="赞" total="${article.approve}"><img src="/static/front/img/点赞.png"/>${article.approve}
人觉得很赞</a></span>
               </div>
            </div>
            <ul class="comment-list">
                <li class="comment-box clearfix" user="other">
                    <img class="myhead" src="/static/front/img/my.jpg" alt=""/>
                    <div class="comment-content">
                        <p class="comment-text"><span class="user">老鹰：</span>我也想去三亚。</p>
                        <p class="comment-time">
                            2014-02-19 14:36 
                            <a href="javascript:;" class="comment-operate">回复</a>
                        </p>
                    </div>
                </li>
            </ul>
            
            <div class="text-box">
                <textarea class="comment" autocomplete="off">评论…</textarea>
                <button class="btn ">提 交</button>
                <span class="word"><span class="length">0</span>/140</span>
            </div>
        </div>
        <div class="right">
        	<div class="top">
        		<span class="n">热门日志</span>
        	</div>
        	<ul>
                <c:forEach var="hotarticle" items="${hotarticles}">
                    <li><a href="/front/user/toarticledetail?1=1&uId=${hotarticle.uId}&articleId=${hotarticle.articleId}">${hotarticle.titile}</a></li>
                </c:forEach>
        	</ul>
        </div>
    </div>
</section>
<footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>

<script type="text/javascript">
    jQuery(function ($) {
        var f=0;
        $("#add").click(function () {
            if(f==1) {
                $(".lb").hide();
                f=0;
                return false;
            }
            if(f==0)
            {
                $(".lb").show();
                f=1;
                return false;
            }
        })


    })
            </script>
</body>
</html>
