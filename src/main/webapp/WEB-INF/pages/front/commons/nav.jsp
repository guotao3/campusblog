<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="/static/front/css/nav.css" />
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>

<body>
<header>
    <div id="logo">
        <img src="/static/front/img/logo.jpg" />
    </div>
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

        <button><img style="width: 52px;height: 52px;border-radius:26px;margin-top: -3px;margin-left: -2px;" src="http://localhost:8089/img-web/upload/${sessionScope.user.pic}"></button>

        <p><a href="/front/user/logout" style="color:gray">注销</a> || ${sessionScope.user.fullname}</p>
    </div>
    </c:when>
</c:choose>
    <div class="text">
        <input name="number" id="uId" type="text" placeholder="搜索博主"/>
        <a href="javascript:void(0);" id="cha"><img src="/static/front/img/1158475.png" /></a>
    </div>
</header>
<script type="text/javascript">
    $("#cha").click(function () {
        var uId= $("#uId").val();
        if(uId==""){
            alert("不能空查")
            return false;
        }
        window.location.href="/front/user/toothers_main?1=1"+"&uId="+uId;
    })
</script>
</body>
</html>
