<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相册</title>
<link rel="stylesheet" href="/static/front/css/m_photo.css" />
<%--<script type="text/livescript" src="/static/front/js/ta_photo.js"></script>--%>
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
    <input type="hidden" value="${pageNo}" id="pageNo">
<div class="left">
	<div class="inner">
        <div class="top">
        	<p>相册</p>
        </div>
        <div class="bt">
            <button id="creat" class="b3"><a href="javascript:void(0);">创建相册</a></button>
            新建相册：<input style="display: none" id="name" type="text"/>
            <button type="button" style="display: none" id="addalubm" >确定</button>
            </div>
        <ul>
            <c:forEach items="${albumList}" var="album">
        	<li>
                《${album.name}》
            	<a class="pic" href="/front/user/toalubmdetail?albumid=${album.id}"><img src="${album.def}"/>
                <div class="praise">
                <img onclick="delalb(this,${album.id})" src="/static/front/img/567973.png" />
                </div>
                <p class="time">${album.createTime}</p></a>
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
 <footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>
<script type="application/javascript">
    $("#creat").click(function () {
        $("#name").show();
        $("#addalubm").show();
    })
    $("#addalubm").click(function () {
        var name = $("#name").val();
        $.ajax({
            url: "/front/user/addalubm",
            type: "POST",
            data:{name:name},
            dataType:"json",
            success: function (data) {
                if(data.flag==true){
                    window.location.reload();
                }
               alert(data.message);
            },
            error: function (data) {
                alert("error");
            }
        });
    })

    function delalb(obj,id) {
        $.ajax({
            url: "/front/user/delalubm",
            type: "POST",
            data:{id:id},
            dataType:"json",
            success: function (data) {
                if(data.flag==true){
                    $(obj).parent().parent().parent().remove();
                    //window.location.reload();
                }
                alert(data.message);
            },
            error: function (data) {
                alert("error");
            }
        });
    }

    function jump(pageNo) {
        window.location.href="/front/user/photolist?1=1"+"&pageNo="+pageNo;

    }

</script>
</body>
</html>
