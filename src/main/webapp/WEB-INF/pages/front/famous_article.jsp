<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/famous_article.css" />
<script type="text/javascript" src="/static/front/js/famous_article.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<style type="text/css">
    .pagination {
        float: right;
        padding: 5px;
        margin-right: 11px;
    }

    .pagination a, .pagination a:link, .pagination a:visited {
        border: 1px solid #aaaadd;
        color: #006699;
        margin: 2px;
        padding: 2px 5px;
        text-decoration: none;
    }

    .pagination span.current {
        background-color: #006699;
        border: 1px solid #006699;
        color: #fff;
        font-weight: bold;
        margin: 2px;
        padding: 2px 5px;
    }

    .pagination span.disabled {
        border: 1px solid #eee;
        color: #ddd;
        margin: 2px;
        padding: 2px 5px;
    }
</style>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<section>
    <input type="hidden" value="${pageNo}" id="pageNo">
	<div class="inner">
        <div class="top">
        	<ul>
            	<li><a href="/front/user/tofamous_article" class="rz">热门日志</a></li>
                <li><a href="/front/user/tofamous_picture">热门图片</a></li>
                <li><a href="/front/user/tofamous_person">人气博主</a></li>
            </ul>
        </div>
        <div class="search">
            <input id="font" type="text" placeholder="请输入关键字搜索" />
            <a href="javascript:void(0);" id="sousuo"><img src="/static/front/img/1158475.png" /></a>
        </div>
        <div class="left">
        	<ul id="l">
<c:forEach items="${hotarticlelist}" var="article">
            	<li>
                	<img src="/static/front/img/1.jpg" />
                    <div class="r">
                    	<p class="title"><a href="/front/user/toarticledetail?1=1&articleId=${article.articleId}&uId=${sessionScope.user.uId}"> ${article.titile}</a></p>
                        <p class="c">${article.content}</p>
                        <div class="l">
                        	<span>分类: </span>
                            <span style="border-right:1px solid #000; padding-right:2px">${article.type}</span>
                            <span id="yd" total="0" style="border-right:1px solid #000; padding-right:2px">阅读(${article.view})</span>
                            <span class="pl">评论(0)</span>
                        </div>
                        <div class="right">
                        	<span><a href="javascript:void(0);" onclick="collecte('${article.articleId}',this)"><img src="/static/front/img/收藏.png" />收藏</a></span>
                            <span><a href="javascript:;"><img src="/static/front/img/转发.png" />转发</a></span>
                            <span><a href="javascript:void(0)" onclick="clickaprove('${article.articleId}',this)" id="praise" title="赞" class="praise"><img src="/static/front/img/点赞.png" />点赞</a></span>
                        </div>
                    </div>
                </li>
    </c:forEach>
            </ul>
            <div class="footer">
                <div class="footer-inner">
                    <!-- #section:basics/footer -->
                    <div class="footer-content">
                        <div class="pull-right pagination">
                            <div class="pagination">
                                <c:if test="${pageNo==1}">
                                    <span class="disabled prev_page">« 上一页</span>
                                </c:if>
                                <c:if test="${pageNo!=1}">
                                    <%--<a href="/front/search?pageNo=${pageNo-1}">« 上一页</a>--%>
                                    <a href="javascript:void(0)" onclick="jump('${pageNo-1}')">« 上一页</a>
                                </c:if>


                                <c:forEach begin="1" end="${requestScope.totalPage}" var="pageNow">
                                    <c:if test="${pageNo==pageNow}">
                                        <span class="current">${pageNow}</span>
                                    </c:if>
                                    <c:if test="${pageNo!=pageNow}">
                                        <%--<a href="/front/search?pageNo=${pageNow}">${pageNow}</a>--%>
                                        <a href="javascript:void(0)" onclick="jump(${pageNow})">${pageNow}</a>
                                    </c:if>
                                </c:forEach>


                                <c:if test="${pageNo==totalPage}">
                                    <span class="disabled prev_page">下一页 »</span>
                                </c:if>
                                <c:if test="${pageNo!=totalPage}">
                                    <%--<a href="/front/search?pageNo=${pageNo+1}">下一页 »</a>--%>
                                    <a href="javascript:void(0)" onclick="jump('${pageNo+1}')">下一页 »</a>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- /section:basics/footer -->
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function jump(pageNo) {
        var font= $("#font").val();
        window.location.href="/front/user/tofamous_article?1=1"+"&font="+font+"&pageNo="+pageNo;
    }
    function clickaprove(articleId,Object) {
        $.ajax({
            url: "/front/user/clickapprove",
            type: "POST",
            data: {
                uId:${sessionScope.user.uId},
                articleId:articleId,
            },
            dataType:"json",
            success: function (data) {
                if(data.flag==true){
                    $(Object).removeAttr("onclick");
                    $(Object).text("已点赞");
                }else {
                    $(Object).removeAttr("onclick");
                    $(Object).text("已点赞");
                }
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });

    }

    function  collecte(articleId,obj) {
        $.ajax({
            url: "/front/user/addcollection",
            type: "POST",
            data: {
                articleId:articleId,
            },
            dataType:"json",
            success: function (data) {
                if(data.flag==true){
                    $(obj).text("已收藏");
                }
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });
    }

    $("#sousuo").click(function () {
        jump();
    })
</script>
<footer>
     <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
</footer>
</body>
</html>
