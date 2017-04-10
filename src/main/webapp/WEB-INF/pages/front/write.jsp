<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/write.css" />
<script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
	<div class="inner">
    	<div class="top">日志</div>
        <div class="next">
            <form name="form" method="post">
                <input type="text" id="articleId" name="articleId" style="display: none"/>
                <label>选择分类</label>
                <select id="type" name="select">
                    <option value="0">默认分类</option>
                    <option value="1">游记</option>
                    <option value="2">八卦</option>
                    <option value="3">影片</option>
                    <option value="4">情感</option>
                    <option value="5">教育</option>
                </select>
                <button><a href="javascript:;">新建分类</a></button>
                <label>权限</label>
                <select id="impose" name="select">
                    <option value="0">公开</option>
                    <option value="1">不公开</option>
                </select>
                <label>不可评论</label>
                <input name="checkbox1" type="checkbox" value="0"/>
            </form>
            <div class="below">
                标题：
                <input style="width: 300px;" name="titile" type="text" value="" />
            </div>
        </div>
        <textarea class="content">在此输入内容...</textarea>
        <div class="b">
        <button type="button" class="b2"><a>发表</a></button>
        </div>
    </div>
</section>
<footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>
<script type="application/javascript">
    jQuery(function ($) {
        var access=0;
        $("input[name='checkbox1']").click(function () {
            if ($("input[name='checkbox1']").is(':checked')) {
                 access = 1;
            } else {
                 access = 0;
            }
        })

        $(".b2").click(function (){
            $.ajax({
                url: "/front/user/articlesaveOrUpadate",
                type: "POST",
                data: {
                    uId:${sessionScope.user.uId},
                    articleId:$("#articleId").val(),
                    titile:$("input[name='titile']").val(),
                    content:$(".content").val(),
                    type:$("#type").val(),
                    impose:$("#impose").val(),
                    access:access
                },
                dataType:"json",
                success: function (data) {
                    if(data.flag==true) {
                        alert(data.message)
                        window.location.href="/front/user/toarticle";
                    }else {
                        alert(data.message)
                    }
                },
                error: function (data) {
                    alert("error");
                }
            });
        })
    })

</script>

</body>
</html>
