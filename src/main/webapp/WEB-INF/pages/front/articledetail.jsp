<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/m_articledetail.css" />
<script  type="text/javascript" src="/static/front/js/m_articledetail.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
    <div class="inner">
        <div class="left">
        <p>日志</p>
            <div class="t">
                <p>分类</p>
            </div>
            <div class="c">
                <p class="p1">所有日志(${alltotal})</p>
                <ul style="float:left;">
                    <li class="ad"><a id="add"><img src="/static/front/img/267-plus.png" /></a>
                        <ul class="lb">
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=0&pageNo=1" value="0" <c:if test="${retype==0}"> style="color: skyblue" </c:if>>所有日志</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=1&pageNo=1" value="1" <c:if test="${retype==1}"> style="color: skyblue" </c:if>>默认分类</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=2&pageNo=1" value="2" <c:if test="${retype==2}"> style="color: skyblue" </c:if>>游记</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=3&pageNo=1" value="3" <c:if test="${retype==3}"> style="color: skyblue" </c:if>>八卦</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=4&pageNo=1" value="4" <c:if test="${retype==4}"> style="color: skyblue" </c:if>>影片</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=5&pageNo=1" value="5" <c:if test="${retype==5}"> style="color: skyblue" </c:if>>情感</a></li>
                            <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=6&pageNo=1" value="6" <c:if test="${retype==6}"> style="color: skyblue" </c:if>>教育</a></li>
                                <c:if test="${!types.isEmpty()}">
                                    <c:forEach var="mtype" items="${types}">
                                        <li> <a href="/front/user/articleist?1=1&uId=${userById.uId}&type=${mtype.code}&pageNo=1">${mtype.type}</a></li>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </ul>
                    </li>    
                </ul>
                <p class="p2">默认日志(${defaluttotal})</p>
            </div> 
        </div>
        <div class="center">
        	<div class="inn">
                <p class="title">${article.titile}</p>
                <p class="time">${article.updateTime}</p>
                <div id="content">${article.content}</div>
                <div class="l">
                    <span>分类: </span>
                    <span style="border-right:1px solid #000; padding-right:2px">${article.type}</span>
                    <span id="yd" total="0" style="border-right:1px solid #000; padding-right:2px">阅读(${article.view})</span>
                    <span class="pl">评论(0)</span>
                </div>
               <div class="r">
               		<span><a href="javascript:;"class="praise" title="赞" total="${article.approve}"><img src="/static/front/img/点赞.png"/>${article.approve}
人觉得很赞</a></span>
               </div>
            </div>
            <ul class="comment-list">
                <c:forEach var="notevo" items="${articlenoteVo}">
                <li class="comment-box clearfix" user="other">
                    <img class="myhead" src="/static/front/img/my.jpg" alt=""/>
                    <div class="comment-content">
                        <p class="comment-text"><span class="user">${notevo.user.fullname}：</span>${notevo.content}</p>
                        <p class="comment-time">
                            <fmt:formatDate value="${notevo.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>1
                                ${notevo.flag}
                            <a href="javascript:void (0);" onclick="replay('${notevo.uId}','${notevo.flag}',this)" class="comment-operate">回复</a>
                        </p>
                    </div>
                </li>
                    <c:if test="${notevo.articleNoteVochirldlist!=null}">
                    <c:forEach items="${notevo.articleNoteVochirldlist}" var="chirldnote">
                        <li style="margin-left: 90px;" class="comment-box clearfix" user="other">
                            <img class="myhead" src="/static/front/img/my.jpg" alt=""/>
                            <div class="comment-content">
                                <p class="comment-text"><span class="user">${chirldnote.user.fullname}：</span>${chirldnote.content}</p>
                                <p class="comment-time">
                                    <fmt:formatDate value="${chirldnote.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <%--<a href="javascript:;" class="comment-operate">回复</a>--%>
                                </p>
                            </div>
                        </li>
                     </c:forEach>
                </c:if>
                </c:forEach>
            </ul>

            <div class="text-box">
                <textarea id="textval" class="comment" autocomplete="off">评论…</textarea>
                <button type="button" onclick="pub(this)" class="btn btn-off">提 交</button>
                <span class="word">0/140</span>
            </div>
        </div>

        <div class="right">
        	<div class="top">
        		<span class="n">热门日志</span>
        	</div>
        	<ul>
                <c:forEach var="hotarticle" items="${hotarticles}">
                    <li><a href="/front/user/toarticledetail?1=1&uId=${hotarticle.uId}&articleId=${hotarticle.articleId}">${hotarticle.titile}</a></li>
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

<script type="text/javascript">
    function replay(touid,flag,Obj) {
        $(Obj).parent().parent().append('<div id="pinglunqu" class="text-box">'+
                '<textarea id="mycomment" class="comment" autocomplete="off"></textarea>'+
        '<button class="btn ">提 交</button>'+
        '<span class="word"><span class="length">0</span>/140</span>'+
                '</div>');
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
            url:"/front/user/articenotesaveOrUpadate",
            type:"POST",
            data:{articleId:${article.articleId},
                content:content,
                toUId:touid,
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

    function pub(Obj) {
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();
        var second = date.getSeconds();
        flag=year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second+'.0';
        $.ajax({
            url:"/front/user/articenotesaveOrUpadate",
            type:"POST",
            data:{articleId:${article.articleId},
                content:$("#textval").val(),
                toUId:0,
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


    jQuery(function ($) {
        var f=0;
        $("#add").click(function () {
            if(f==1) {
                $(".lb").hide();
                f=0;
                return false;
            }
            if(f==0)
            {
                $(".lb").show();
                f=1;
                return false;
            }
        })


    })
            </script>
</body>
</html>
