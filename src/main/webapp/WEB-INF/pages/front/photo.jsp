<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/m_photo.css" />
<script type="text/livescript" src="/static/front/js/ta_photo.js"></script>
</head>

<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
<div class="left">
	<div class="inner">
        <div class="top">
        	<p>相册</p>
        </div>
        <div class="bt">
        	<button class="b1"><a href="#">上传照片</a></button>
            <button class="b2"><a href="#">上传视频</a></button>
            <button class="b3"><a href="#">创建相册</a></button>
            </div>
        <ul>
        	<li>
            	<a  class="pic" href="#"><img src="/static/front/img/4.jpg"/>
                <div class="praise">
                <img src="/static/front/img/567973.png" />
                </div>
                <p class="time">2015-12-13</p></a>
            </li>
            <li>
            	<a  class="pic" href="#"><img src="/static/front/img/4.jpg"/>
                <div class="praise">
                <img src="/static/front/img/567973.png" />
                </div>
                <p class="time">2015-12-13</p></a>
            </li>
            <li>
            	<a  class="pic" href="#"><img src="/static/front/img/4.jpg"/>
                <div class="praise">
                <img src="/static/front/img/567973.png" />
                </div>
                <p class="time">2015-12-13</p></a>
            </li>
            <li>
            	<a  class="pic" href="#"><img src="/static/front/img/4.jpg"/>
                <div class="praise">
                <img src="/static/front/img/567973.png" />
                </div>
                <p class="time">2015-12-13</p></a>
            </li>
            <li>
            	<a  class="pic" href="#"><img src="/static/front/img/4.jpg"/>
                <div class="praise">
                <img src="/static/front/img/567973.png" />
                </div>
                <p class="time">2015-12-13</p></a>
            </li>
        </ul>
        <p class="ym">上一页 <span class="num">1 2 3 4 5</span> 下一页</p>
    </div>
</div>
<div class="right">
	<div class="inn">
        	<div class="pic">
    				<img src="/static/front/img/3.png" />
        		</div>
    			<div class="name">
                		<h3>作者名</h3>`
               			<a href="javascript:;"title="关注" id="care"><img src="/static/front/img/care2.png" /></a>
       			</div>
                <p>最近文章</p>
        	<ul>
                <li><a href="javascript:;">第三节课奶萨说的那家爱上你的技能简单介绍那就等你山东卷三的</a></li>
                <li><a href="javascript:;">第三节课奶萨说的那家爱上你的技能简单介绍那就等你山东卷三的</a></li>
                <li><a href="javascript:;">第三节课奶萨说的那家爱上你的技能简单介绍那就等你山东卷三的</a></li>
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
