<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>他的主页</title>
<link rel="stylesheet" href="/static/front/css/others_main.css" />
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
<%--<script type="text/livescript" src="/static/front/js/others_main.js"></script>--%>

</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
    <div id="search">
        <div class="below">
        	<button><a href="#">Ta的首页</a></button>
            <button type="button" onclick="window.location.href='/front/user/toarticle?uId=${otheruser.uId}'"><a href="javascript:void(0);">Ta的日志</a></button>
            <button type="button" onclick="window.location.href='/front/user/tootherphoto?otheruId=${otheruser.uId}'"><a href="javascript:void(0);">Ta的相册</a></button>
            <button type="button" onclick="window.location.href='/front/user/toothermessage?otheruId=${otheruser.uId}'"><a href="javascript:void(0);">Ta的留言板</a></button>
        </div>
    </div>
    <section>
    	<div class="left">
        	<div class="author">
            	<div class="pic">
    				<img src="http://localhost:8089/img-web/upload/${otheruser.pic}" />
        		</div>
    			<div class="name">
        			<div class="n">
                		<h3>${otheruser.fullname}</h3>`
               			<a onclick="add(this)"><img title="关注" src="/static/front/img/care2.png" id="care"/></a>
           			</div>
       			</div>
        		<div class="more">
                    <h4>个人资料</h4>
                    <p>性别：${otheruser.sex}</p>
                    <p>学校：${otheruser.school}</p>
                    <p>爱好：${otheruser.love}</p>
                    <p>个性签名：${otheruser.popmoods}</p>
        		</div>
            </div>
            <div class="article">
            	<div class="zr">
                	<h4>TA的最新日志</h4>
                </div>
                <c:if test="${articles.isEmpty()}">主人很懒，什么也没留下~~</c:if>
                <c:forEach items="${articles}" var="article">
                <div class="zw">
                	<div class="title"><h2>${article.titile}</h2></div>
                    <p class="time"><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                    <div id="content"> <c:if test="${article.content.length()>30}">${article.content.substring(0,30)}</c:if>
                        <c:if test="${article.content.length()<=30}">${article.content}</c:if></div>
                    <a href="/front/user/toarticledetail?1=1&articleId=${article.articleId}&uId=${otheruser.uId}" id="read" title="展开">阅读全文<img src="/static/front/img/2.png" /><img src="/static/front/img/2.png" /></a>
                    <div class="zw-below">
                    	<div class="l">
                        	<span>分类: </span>
                            <span style="border-right:1px solid #000; padding-right:2px">${type}</span>
                            <span id="yd" total="0">阅读(${article.view})</span>
                            <span class="pl">评论(${notecount})</span>
                        </div>
                        <div class="right">
                        	<span><a href="javascript:void(0);" onclick="collecte('${article.articleId}',this)"><img src="/static/front/img/收藏.png" />收藏</a></span>
                            <span><a href="javascript:;"><img src="/static/front/img/转发.png" />转发</a></span>
                            <span><a href="javascript:void(0)" onclick="clickaprove('${article.articleId}',this)" id="praise" title="赞"><img src="/static/front/img/点赞.png" />点赞</a></span>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="b2">
            	<div class="inner">
                	<div class="bj">给他留言</div>
                    <textarea class="word" id="pubtext"></textarea>
                    <button onclick="pub()"><a href="javascript:void(0)">留言</a></button>
                </div>
            </div>
        </div>
        <div class="new-picture">
        	<div class="inner">
            	<div class="zz">
                	<h4>TA的最新照片</h4>
                </div>
                <c:if test="${imgs.isEmpty()}">主人的也是相册空空哒~~</c:if>
                <ul><c:forEach items="${imgs}" var="img">
                	<li><img src="http://localhost:8089/img-web/upload/${img.url}" /><p><fmt:formatDate value="${img.createTime}" pattern="yyyy-MM-dd"/></p></li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </section>
<%--    <script type="application/javascript">
        function add() {
            alert("add")
        }
        </script>--%>
    <footer>
        <p>帆船BLOG意见反馈留言板</p>
        <p>Copyright &copy; GT LH LYD LSQ</p>
        <p>该组成员 版权所有</p>
    </footer>
    <script type="application/javascript">
            function add(Obj) {
                $.ajax({
                    contentType: "application/json",
                    url: "/front/user/addfriend",
                    type: "POST",
                    data: {
                        uId:${otheruId},
                    },
                    dataType:"json",
                    success: function (data) {
                        if(data.flag==true){
                            $(Obj).removeAttr("onclick");
                            $("#care").attr("src","/static/front/img/care1.png");
                        }
                        alert(data.message)
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    }
                });
            }

            function  collecte(articleId,obj) {
                $.ajax({
                    url: "/front/user/addcollection",
                    type: "POST",
                    data: {
                        articleId:articleId,
                    },
                    dataType:"json",
                    success: function (data) {
                        if(data.type==3){
                            window.location.href="http://localhost:8080/front/user/tolog";
                        }
                        if(data.flag==true){
                            $(obj).text("已收藏");
                        }
                        alert(data.message)
                    },
                    error: function (data) {
                        alert("error");
                    }
                });
            }

            function clickaprove(articleId,Object) {
                $.ajax({
                    url: "/front/user/clickapprove",
                    type: "POST",
                    data: {
                articleId:articleId,
                    },
                    dataType:"json",
                    success: function (data) {
                        if(data.flag==true){
                            $(Object).removeAttr("onclick");
                            $(Object).text("已点赞");
                        }
                        if(data.flag==false){
                            $(Object).removeAttr("onclick");
                            $(Object).text("已点赞");
                        }
                        if(data.type==3){
                            window.location.href="http://localhost:8080/front/user/tolog";
                        }
                        alert(data.message)
                    },
                    error: function (data) {
                        alert("error");
                    }
                });

            }

            function pub() {
                var date = new Date();
                var year = date.getFullYear();
                var month = date.getMonth()+1;
                var day = date.getDate();
                var hour = date.getHours();
                var minute = date.getMinutes();
                var second = date.getSeconds();
                flag=year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second+'.0';
                $.ajax({
                    url: "/front/user/addothermessage",
                    type: "POST",
                    data: {
                        touId:${otheruId},
                        content:$("#pubtext").val(),
                        flag:flag
                    },
                    dataType:"json",
                    success: function (data) {
                        if(data.type==3){
                            window.location.href="http://localhost:8080/front/user/tolog";
                        }
                        $("#pubtext").val("");
                        alert(data.message)
                        window.location.reload();
                    },
                    error: function (data) {
                        alert("error");
                    }
                });
            }

                </script>

</body>
</html>
