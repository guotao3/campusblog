<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/famous_picture.css" />
<script type="text/javascript" src="/static/front/js/famous_picture.js"></script>
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
<section>
	<div class="inner">
        <div class="top">
        	<ul class="t">
                <li><a href="/front/user/tofamous_article" class="rz">热门日志</a></li>
                <li><a href="/front/user/tofamous_picture">热门图片</a></li>
                <li><a href="/front/user/tofamous_person">人气博主</a></li>
                <li><a href="/front/user/toreport">通知公告</a></li>
            </ul>
        </div>
         <ul id="list">
             <c:forEach items="${imgList}" var="img">
        	<li>
            	<a  class="pic" href="javascript:void (0)"><img src="http://localhost:8089/img-web/upload/${img.url}"/>
                <div class="praise">
                <span class="s" title="赞" totle="0"><img src="/static/front/img/点赞.png" />${img.approve}人觉得很赞</span>
                </div>
                <p class="time"><fmt:formatDate value="${img.createTime}" pattern="yyyy-MM-dd"/></p></a>
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
</section>
   <footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>
</body>
</html>
