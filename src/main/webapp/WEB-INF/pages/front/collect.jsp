<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/collect.css" />
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
	<div class="left">
    	<div class="top">
        	<span class="n">我的收藏</span><span>(${total})</span>
        </div>
        <ul>
            <c:forEach var="article" items="${collectarticles}">
        	<li>
            	<img src="http://localhost:8089/img-web/upload/${article.pic}" />
                <div class="center">
                <p class="t"><a href="/front/user/toarticledetail?1=1&uId=${article.uId}&articleId=${article.articleId}"> ${article.titile}</a></p>
                    <c:if test="${article.content.length()>50}">
                <p class="c">${article.content.substring(0,200)}</p>
                    </c:if>
                    <c:if test="${article.content.length()<=50}">
                        <p class="c">${article.content}</p>
                    </c:if>
                </div>
                <div class="r">
                	<p>2017-02-21 09:11:23 收藏</p>
                    <a href="javascript:void(0);" onclick="delcid('${article.view}')">删除</a>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>
    <div class="right">
    	<div class="top">
        	<span class="n">热门收藏</span>
        </div>
        <ul>
            <c:forEach items="${hotcollectionsVos}" var="collection">
        	<li>
                <p class="t"><a href="/front/user/toarticledetail?1=1&uId=${collection.uId}&articleId=${collection.articleId}"> ${collection.titile}</a></p>
                <c:if test="${collection.titile.length()>15}">
            	<p class="t">${collection.content.substring(0,15)}${collection.titile}</p>
                </c:if>
                <p class="n">收藏排行：${collection.view}</p>
            </li>
            </c:forEach>
        </ul>
    </div>
</section>
<footer>
     <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
</footer>
<script type="application/javascript">
    function  delcid(cid){
        $.ajax({
            url: "/front/user/delcollection",
            type: "POST",
            data: {
                id:cid
            },
            dataType:"json",
            success: function (data) {
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
