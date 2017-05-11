<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人消息</title>
<link rel="stylesheet" href="/static/front/css/m_message.css" />
<script type="text/javascript" src="/static/front/js/m_message.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
<div class="left">
	<div class="top">
        <div class="pic">
        	<img src="http://localhost:8089/img-web/upload/${sessionScope.user.pic}" />
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
                <textarea id="pubtext" class="comment" autocomplete="off"></textarea>
                <button onclick="pub()" class="btn"><c:if test="${otheruId!=null}">留言</c:if>
                                                    <c:if test="${otheruId==null}">发表</c:if>
                                                        </button>
                <span class="word"><span class="length">0</span>/140</span>
     </div>
    <ul class="comment-list">
        <c:forEach items="${reVo}" var="revo">
                <li class="comment-box clearfix" user="other">
                    <img class="myhead" src="http://localhost:8089/img-web/upload/${revo.user.pic}" alt=""/>
                    <div class="comment-content">
                        <p class="comment-text"><span class="user">${revo.user.fullname}：</span>${revo.content}</p>
                        <p class="comment-time">

                                    <fmt:formatDate value="${revo.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <a href="javascript: void (0);" onclick="replay('${revo.uId}','${revo.flag}',this)" class="comment-operate">回复</a>
                        </p>
                    </div>
                </li>
            <c:if test="${revo.userNoteVochirldlist!=null}">
                <c:forEach items="${revo.userNoteVochirldlist}" var="chirldnote">
                    <li style="margin-left: 90px;" class="comment-box clearfix" user="other">
                        <img class="myhead" src="/static/front/img/my.jpg" alt=""/>
                        <div class="comment-content">
                            <p class="comment-text"><span class="user">${chirldnote.user.fullname}：</span>${chirldnote.content}</p>
                            <p class="comment-time">
                                <fmt:formatDate value="${chirldnote.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <%--<a href="javascript:;" class="comment-operate">回复</a>--%>
                            </p>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
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
    function pub() {
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();
        var second = date.getSeconds();
        flag=year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second+'.0';
        $.ajax({
            url: "/front/user/addmessage",
            type: "POST",
            data: {
                touId:${otheruId},
                content:$("#pubtext").val(),
                flag:flag
            },
            dataType:"json",
            success: function (data) {
                alert(data.message)
                window.location.reload();
            },
            error: function (data) {
                alert("error");
            }
        });
    }

    function replay(touid,flag,Obj) {
        $(Obj).parent().parent().append('<div id="pinglunqu" class="text-box2">'+
                '<textarea id="mycomment" class="comment" autocomplete="off">'+'</textarea>'+
                '<button class="btn">回复</button>'+
                '<span class="word"><span class="length">0</span>/140</span>'+
                '</div> ');
        $(".btn").click(function () {
            var content = $("#mycomment").val().trim();
            if(content==""){alert("评论不能为空"); return false;}else {
                send(touid,content,flag);
                $("#pinglunqu").remove();
            }
        });


    }



    function send(touid,content,flag) {
        $.ajax({
            url:"/front/user/addmessage",
            type:"POST",
            data:{
                content:content,
                touId:touid,
                flag:flag
            },
            success: function (data) {
                alert(data.message)
                if(data.flag==true){
                    //绑定动态增加的评论绑定事件 或者刷新
                    window.location.reload();
                }
            },
            error: function (data) {
                alert("error");
            }
        });
    }
</script>
</body>
</html>
