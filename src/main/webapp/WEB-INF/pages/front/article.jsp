<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/ta_article.css" />
<script type="text/livescript" src="/static/front/js/ta_article.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
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
<body>
<div id="search">
    <input type="hidden" value="${pageNo}" id="pageNo">
</div>
<section>
    <div class="inner">
        <div class="left">
            <a href="/front/user/towrite">写日志</a>
        <p>日志</p>
            <div class="t">
                <p>分类</p>
                <a href="#">管理</a>
            </div>
            <div class="c">
                <p class="p1">所有日志(3)</p>
                <ul style="float:left;">
                    <li class="ad"><a class="add" href="#"><img src="/static/front/img/267-plus.png" /></a>
                        <ul class="lb">
                            <li><a href="#">游记</a></li>
                            <li><a href="#">八卦</a></li>
                            <li><a href="#">影片</a></li>
                            <li><a href="#">情感</a></li>
                            <li><a href="#">教育</a></li>
                        </ul>
                    </li>    
                </ul>
                <p class="p2">默认日志(3)</p>
            </div>
            <div class="b">
                <p>搜索日志</p>
                <input id="front" name="front" type="text" placeholder="请输入关键字搜索"/>
                <a href="#"><img src="/static/front/img/1158475.png" /></a>
            </div>
        </div>
        <div class="center">
        	<div class="inn">
        		<p class="t">所有日志(3)</p>

                <ul id="list">
                    <c:forEach items="${articles}" var="article">
                	<li>
                    	<p class="title">${article.titile}</p>
                        <p class="time">2013:10.01<%--${article.update_time}--%></p>
                        <c:if test="${article.content.length()>200}">
                        <div id="content">${article.content.substring(0,200)}</div>
                       </c:if>
                        <a href="#" class="read">阅读全文<img src="/static/front/img/2.png" /><img src="/static/front/img/2.png" /></a>
                        <div class="zw-below">
                        <div class="l">
                        	<span>分类: </span>
                            <span style="border-right:1px solid #000; padding-right:2px">${article.type}</span>
                            <span id="yd" total="0">阅读(${article.view})</span>
                            <span class="pl">赞(${article.approve})</span>
                        </div>
                        <div class="r">
                        	<span><a href="javascript:;"><img src="/static/front/img/收藏.png" />收藏</a></span>
                            <span><a href="javascript:;"><img src="/static/front/img/转发.png" />转发</a></span>
                            <span><a href="javascript:;" class="praise" title="赞"><img src="/static/front/img/点赞.png" />点赞</a></span>
                        </div>
                        </div>
                    </li>
                    </c:forEach>
                    <%--<li>
                    	<p class="title">浅析小学数学学习两极分化现象</p>
                        <p class="time">2011-04-06 14:30</p>
                        <div id="content">在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。</div>
                        <a href="#" class="read">阅读全文<img src="/static/front/img/2.png" /><img src="/static/front/img/2.png" /></a>
                        <div class="zw-below">
                        <div class="l">
                        	<span>分类: </span>
                            <span style="border-right:1px solid #000; padding-right:2px">默认分类</span>
                            <span id="yd" total="0">阅读(0)</span>
                            <span class="pl">评论(0)</span>
                        </div>
                        <div class="r">
                        	<span><a href="javascript:;"><img src="/static/front/img/收藏.png" />收藏</a></span>
                            <span><a href="javascript:;"><img src="/static/front/img/转发.png" />转发</a></span>
                            <span><a href="javascript:;"class="praise" title="赞"><img src="/static/front/img/点赞.png" />点赞</a></span>
                        </div>
                        </div>
                    </li>--%>
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
        <div class="right">
            	<div class="pic">
    				<img src="/static/front/img/3.png" />
        		</div>
    			<div class="name">
        			<div class="n">
                		<p class="an">作者名</p>`
               			<a href="javascript:;"><img title="关注" src="/static/front/img/care2.png" id="care"/></a>
           			</div>
       			</div>
                <p class="zw">最近文章</p>
               <ul>
               	<li><a href="javascript:;">第三节课奶萨说的那家爱上你的技能简单介绍那就等你山东卷三的</a></li>
                <li><a href="javascript:;">第三节课奶萨说的那家爱上你的技能简单介绍那就等你山东卷三的</a></li>
                <li><a href="javascript:;">第三节课奶萨说的那家爱上你的技能简单介绍那就等你山东卷三的</a></li>
               </ul>
        </div>
    </div>
</section>
<script type="text/javascript">
    function jump(pageNo) {
        var front= $("#front").val();
        var pageNo=$("#pageNo").val(pageNo);
        var uId=${sessionScope.user.uId};
        var  type=0;
        window.location.href="/front/user/articleist?1=1"+"&front="+front+"&uId="+uId+"&pageNo="+pageNo+"&type="+type;

    }

    function doSearch() {
        document.getElementById("myform").submit();
    }
</script>

</body>
</html>
