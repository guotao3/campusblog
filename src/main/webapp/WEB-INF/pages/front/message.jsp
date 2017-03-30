<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/m_message.css" />
<script type="text/javascript" src="/static/front/js/m_message.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
<div class="left">
	<div class="top">
        <div class="pic">
        	<img src="/static/front/img/my.jpg" />
        </div>
        <p>主人寄语</p>
        
    </div>
    <div class="word">
        <textarea>你的空间就是我的空间 我的空间还是我的空间。</textarea>
        <button><a href="javascript:;">修改寄语</a></button>
    </div>
</div>
<div class="right">
	<div class="top">
    	<p>留言板</p>
    </div>
    <div class="text-box">
                <textarea class="comment" autocomplete="off"></textarea>
                <button class="btn ">发表</button>
                <span class="word"><span class="length">0</span>/140</span>
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
          <div class="text-box2">
                <textarea class="comment" autocomplete="off"></textarea>
                <button class="btn2 ">回复</button>
                <span class="word"><span class="length">0</span>/140</span>
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
