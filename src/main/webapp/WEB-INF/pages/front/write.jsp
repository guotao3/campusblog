<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="../css/write.css" />
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
	<div class="inner">
    	<div class="top">日志</div>
        <div class="next">
            <form name="form" method="post">
                <label>选择分类</label>
                <select name="select">
                    <option>默认分类</option>
                    <option>游记</option>
                    <option>八卦</option>
                    <option>影片</option>
                    <option>情感</option>
                    <option>教育</option>
                </select>
                <button><a href="javascript:;">新建分类</a></button>
                <label>权限</label>
                <select name="select">
                    <option>公开</option>
                    <option>不公开</option>
                </select>
                <label>不可评论</label>
                <input name="checkbox1" type="checkbox" value="checkbox"/>
            </form>
            <div class="below">
            </div>
        </div>
        <textarea class="content">主题</textarea>
        <div class="b">
        <button class="b2"><a href="javascript:;">发表</a></button>
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
