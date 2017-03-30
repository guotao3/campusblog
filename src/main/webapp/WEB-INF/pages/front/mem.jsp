<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/mem.css" />
<script type="text/javascript" src="/static/front/js/mem.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
	<div class="inner">
    	<p class="t">备忘录</p>
        <ul class="comment-list">
                <li class="comment-box clearfix" user="self">
                    <div class="comment-content">
                        <p class="comment-text">写的太好了。</p>
                        <p class="comment-time">
                            2014-02-19 14:36
                            <a href="javascript:;" ><img src="/static/front/img/567973.png" class="comment-operate"/></a>
                        </p>
                    </div>
                </li>
            </ul>
             <div class="text-box">
                <textarea class="comment" autocomplete="off">笔记…</textarea>
                <button class="btn ">提 交</button>
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
</body>
</html>
