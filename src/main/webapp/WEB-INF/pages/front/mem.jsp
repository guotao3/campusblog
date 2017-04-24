<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/mem.css" />
<script type="text/javascript" src="/static/front/js/mem.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
	<div class="inner">
    	<p class="t">备忘录</p>
        <ul class="comment-list">
            <c:forEach items="${mvo}" var="mem">
                <li class="comment-box clearfix" user="self">
                    <div class="comment-content">
                        <p class="comment-text">${mem.content}</p>
                        <p class="comment-time">
                                <fmt:formatDate value="${mem.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <a  href="javascript:;void (0)" onclick="delmem(this,${mem.id})" ><img src="/static/front/img/567973.png" class="comment-operate"/></a>
                        </p>
                    </div>
                </li>
            </c:forEach>
            </ul>
             <div class="text-box">
                <textarea class="comment" autocomplete="off">笔记…</textarea>
                <button id="send" class="btn ">提 交</button>
                <span class="word"><span class="length">0</span>/140</span>
            </div>
            <div class="below">
            <img src="/static/front/img/1192130.png" class="add"/>
            </div>
    </div>
</section>
 <footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>
<script type="application/javascript">
    $("#send").click(function () {
        $.ajax({
            url: "/front/user/addmem",
            type: "POST",
            data: {
                content:$(".comment").val(),
            },
            dataType:"json",
            success: function (data) {
                if(data.flag==false){
                    $(obj).parent().parent().parent().remove();
                }
                window.location.reload();
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });
    })

    function delmem(obj,id) {
        $.ajax({
            url: "/front/user/delmem",
            type: "POST",
            data: {
                id:id,
            },
            dataType:"json",
            success: function (data) {
                if(data.flag==true){
                    $(obj).parent().parent().parent().remove();
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
