<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的博友</title>
<link rel="stylesheet" href="/static/front/css/friend.css" />
<%--<script type="text/javascript" src="/static/front/js/friend.js"></script>--%>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
	<div class="left">
    	<div class="top">
        	<span class="n">关注列表</span>
            <input type="text" placeholder="请输入关键字搜索" />
            <img src="/static/front/img/1158475.png" />
        </div>
        <ul id="lis">
            <c:forEach  items="${friends}" var="friend">
        	<li><div class="r">
            	<a href="/front/user/toothers_main?uId=${friend.uId}"> <img src="http://localhost:8089/img-web/upload/${sessionScope.user.pic}" /></a>
                </div>
                <div class="r">
                    <a href="javascript:; void (0)"  onclick="removefriend(this,${friend.uId})" class="b1" title="取关">取关</a>
                    <a href="/front/user/toothers_main?uId=${friend.uId}" class="b2" title="踩踩">踩踩</a>
                </div>
            </li>
            </c:forEach>
        </ul>
        <p class="below">共${people}个博友</p>
    </div>
    <div class="right">
    	<div class="top">
        	<span class="n">热门博主</span>
        </div>
        <ul id="list">
            <c:forEach items="${hotuserlist}" var="hotuser">
        	<li>
            	<div class="t">
                	<a href="/front/user/toothers_main?uId=${hotuser.uId}"><img src="/static/front/img/my.jpg" /></a>
                    <p>${hotuser.fullname}</p>
                </div>
                <div class="b">
                	<p>${hotuser.popmoods}</p>
                    <img src="/static/front/img/13020.png" /><span>共发表121篇</span>
                    <p class="p">
                    <a  href="javascript:; void (0)" onclick="addfriend(this,${hotuser.uId})"><img class="care" title="关注" src="/static/front/img/care2.png" /></a>
                    </p>
                </div>  
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
    function removefriend(obj,uId) {
        $.ajax({
            url: "/front/user/removefriend",
            type: "POST",
            data: {
                uId:uId,
            },
            dataType:"json",
            success: function (data) {
                if(data.flag==true){
                    $(obj).parent().siblings().remove();
                    $(obj).parent().remove();
                }
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });
    }

    function addfriend(Obj,uId) {
        $.ajax({
            url: "/front/user/addfriend",
            type: "POST",
            data: {
                uId:uId,
            },
            dataType:"json",
            success: function (data) {
                alert(data.flag)
                if(data.flag==true){
                    $(Obj).removeAttr("onclick");
                    $(Obj).children().attr("src","/static/front/img/care1.png");
                    window.location.reload();
                }
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });

    }

</script>
</body>
</html>
