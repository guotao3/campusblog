<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/friend.css" />
<script type="text/javascript" src="/static/front/js/friend.js"></script>
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
        	<li>
            	<img src="/static/front/img/my.jpg" />
                <div class="r">
                	<p>同户名</p>
                    <a href="javascript:;" class="b1" title="取关">取关</a>
                    <a href="javascript:;" class="b2" title="踩踩">踩踩</a>
                </div>
            </li>
           <li>
            	<img src="/static/front/img/my.jpg" />
                <div class="r">
                	<p>同户名</p>
                    <a href="javascript:;" class="b1">取关</a>
                    <a href="javascript:;" class="b2">踩踩</a>
                </div>
            </li>
            <li>
            	<img src="/static/front/img/my.jpg" />
                <div class="r">
                	<p>同户名</p>
                    <a href="javascript:;" class="b1">取关</a>
                    <a href="javascript:;" class="b2">踩踩</a>
                </div>
            </li>
            <li>
            	<img src="/static/front/img/my.jpg" />
                <div class="r">
                	<p>同户名</p>
                    <a href="javascript:;" class="b1">取关</a>
                    <a href="javascript:;" class="b2">踩踩</a>
                </div>
            </li>
            <li>
            	<img src="/static/front/img/my.jpg" />
                <div class="r">
                	<p>同户名</p>
                    <a href="javascript:;" class="b1">取关</a>
                    <a href="javascript:;" class="b2">踩踩</a>
                </div>
            </li>
            
        </ul>
        <p class="below">上一页 <span class="nu">1 2 3 4 5 6</span> 下一页</p>
    </div>
    <div class="right">
    	<div class="top">
        	<span class="n">热门博主</span>
        </div>
        <ul id="list">
        	<li>
            	<div class="t">
                	<a href="javascript:;"><img src="/static/front/img/my.jpg" /></a>
                    <p>登录名</p>
                </div>
                <div class="b">
                	<p>个性签名个性签名个性签名个性签名</p>
                    <img src="/static/front/img/13020.png" /><span>共发表121篇</span>
                    <p class="p">
                    <a  href="javascript:;"><img class="care" title="关注" src="/static/front/img/care2.png" /></a>
                    </p>
                </div>  
            </li>
           <li>
            	<div class="t">
                	<a href="javascript:;"><img src="/static/front/img/my.jpg" /></a>
                    <p>登录名</p>
                </div>
                <div class="b">
                	<p>个性签名个性签名个性签名个性签名</p>
                    <img src="/static/front/img/13020.png" /><span>共发表121篇</span>
                    <p class="p"><a  href="javascript:;"><img class="care" title="关注" src="/static/front/img/care2.png" /></a></p>
                </div>  
            </li>
        </ul>
   </div>
</section>
<footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
</footer>
</body>
</html>
