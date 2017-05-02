<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统通知公告</title>
<link rel="stylesheet" href="/static/front/css/report.css" />
    <jsp:include page="./commons/nav.jsp" flush="true" />
</head>

<body>
<section>
<div class="inner">
        <div class="top">
        	<ul>
                <li><a href="/front/user/tofamous_article" class="rz">热门日志</a></li>
                <li><a href="/front/user/tofamous_picture">热门图片</a></li>
                <li><a href="/front/user/tofamous_person">人气博主</a></li>
                <li><a href="/front/user/toreport">通知公告</a></li>
            </ul>
        </div>
        <div class="below">
        	<ul>
                <c:forEach items="${pushList}" var="push">
            	<li>
                	<p class="title">${push.titile}</p>
                    <p class="content">${push.content}</p>
                    <p class="name"><fmt:formatDate value="${push.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                    <p class="time">管理员</p>
                </li>
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
</body>
</html>
