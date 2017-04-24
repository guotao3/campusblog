<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/famous_person.css" />
<script type="text/javascript" src="/static/front/js/famous_person.js"></script>
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
        	<ul>
                <li><a href="/front/user/tofamous_article" class="rz">热门日志</a></li>
                <li><a href="/front/user/tofamous_picture">热门图片</a></li>
                <li><a href="/front/user/tofamous_person">人气博主</a></li>
            </ul>
        </div>
        <div class="below">
            <ul class="l" id="list">
                <c:forEach items="${users}" var="user">
            	<li>
                	<div class="lb">
                        <div class="pic">
                            <img src="http://localhost:8089/img-web/upload/${user.pic}" />
                        </div>
                        <div class="name">
                            <div class="n">
                                <h3>${user.fullname}</h3>
                                <a  href="javascript:void (0);" onclick="fcous('${user.uId}',this)"><img title="关注" src="/static/front/img/care2.png" class="care" id="care"/></a>
                                <p class="gz">关注度：${user.focus}</p>
                            </div>
                        </div>
                        <div class="more">
                        	<p>个性签名</p>
                            <p class="bt">${user.popmoods}</p>
                        </div>
                  	</div>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
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
</section>
<script>
    function fcous(uId,obj) {
        $.ajax({
            url: "/front/user/hotfcous",
            type: "POST",
            data: {
                uId:uId,
            },
            dataType:"json",
            success: function (data) {
                if(data.flag==true){
                    $(obj).removeAttr("onclick");
                }
                $(obj).children().attr("src","/static/front/img/care1.png");
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });
    }
    function jump(pageNo) {
        window.location.href="/front/user/tofamous_person?1=1"+"&pageNo="+pageNo;
    }
</script>
<footer>
      <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
</footer>
</body>
</html>
