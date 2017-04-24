<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/m_picturedetail.css" />
    <link rel="stylesheet" href="/static/front/css/style.css"/>
<script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>

</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<div id="search">
	<div class="below">
        	<button><a href="#">Ta的首页</a></button>
            <button><a href="#">Ta的日志</a></button>
            <button><a href="#">Ta的相册</a></button>
            <button><a href="#">Ta的留言板</a></button>
     </div>
</div>
<section>
    <div class="inner">
        <div class="top">
            <div class="left">
                <img src="/static/front/img/my.jpg" />
                <div class="r">
                	<p class="name">${album.albname}</p>
                    <p class="num">${album.num}张 <span>/仅博友可见</span></p>
                </div>
            </div>
            <div class="right">
            	<div>
                	<p>访客</p>
                    <p class="num"><c:if test="${view==null}">1</c:if><c:if test="${view!=null}">${view}</c:if></p>
                </div>
                <div class="pl">
                	<p>评论</p>
                    <p class="num">不支持</p>
                </div>
                <div>
                	<p>点赞</p>
                    <p class="num"><c:if test="${approve!=null}">${approve}</c:if><c:if test="${approve==null}">0</c:if></p>
                </div>
            </div>
        </div>

        <div style="float: left">
            <a class="a-upload">
                <input id="mypic"  type="file" name="file" onchange="readFile(this)" />选择图片
            </a>
        </div>
        <div style="float: left" id="upbtn" class="input-control">
            <a>
                <button type="button" id="upimg"/>上传
            </a>
        </div>
<div style="clear: both"></div>
        <div style="float: left" id="localImag">
            <img id="imgs" />
        </div>



    <div class="mod18Box">
        <div class="mod18">
            <span id="prev" class="btn prev"></span>
            <span id="next" class="btn next"></span>
            <span id="prevTop" class="btn prev"></span>
            <span id="nextTop" class="btn next"></span>
            <div id="picBox" class="picBox">
                <ul class="cf">
                    <c:forEach items="${imgList}" var="img">
                    <li>
                        <a href="http://sc.chinaz.com/" target="_blank"><img width="680" height="380" src="http://localhost:8089/img-web/upload/${img.url}" alt="" /></a>
                        <span style="height: 10px;"><a onclick="approve(${img.iId})" style="width: 20%px;margin-left:300px;color: indianred" href="javascript:void(0)">${img.approve}赞</a> <a onclick="delimg(${img.iId})" style="width: 20%px;margin-left:350px;color: #8c8c8c;"  href="javascript:void(0)">删除</a> </span>
                    </li>
                    </c:forEach>
                </ul>
            </div>

            <div id="listBox" class="listBox">
                <ul class="cf">
                    <c:forEach items="${imgList}" var="img">
                    <li class="on"><i class="arr2"></i><img width="118" height="64" src="http://localhost:8089/img-web/upload/${img.url}" alt="心壁纸" /></li>
                    </c:forEach>
                </ul>
            </div>

        </div>
        <script type="text/javascript">
            <!--
            (function(){
                function G(s){
                    return document.getElementById(s);
                }

                function getStyle(obj, attr){
                    if(obj.currentStyle){
                        return obj.currentStyle[attr];
                    }else{
                        return getComputedStyle(obj, false)[attr];
                    }
                }

                function Animate(obj, json){
                    if(obj.timer){
                        clearInterval(obj.timer);
                    }
                    obj.timer = setInterval(function(){
                        for(var attr in json){
                            var iCur = parseInt(getStyle(obj, attr));
                            iCur = iCur ? iCur : 0;
                            var iSpeed = (json[attr] - iCur) / 5;
                            iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
                            obj.style[attr] = iCur + iSpeed + 'px';
                            if(iCur == json[attr]){
                                clearInterval(obj.timer);
                            }
                        }
                    }, 30);
                }

                var oPic = G("picBox");
                var oList = G("listBox");

                var oPrev = G("prev");
                var oNext = G("next");
                var oPrevTop = G("prevTop");
                var oNextTop = G("nextTop");

                var oPicLi = oPic.getElementsByTagName("li");
                var oListLi = oList.getElementsByTagName("li");
                var len1 = oPicLi.length;
                var len2 = oListLi.length;

                var oPicUl = oPic.getElementsByTagName("ul")[0];
                var oListUl = oList.getElementsByTagName("ul")[0];
                var w1 = oPicLi[0].offsetWidth;
                var w2 = oListLi[0].offsetWidth;

                oPicUl.style.width = w1 * len1 + "px";
                oListUl.style.width = w2 * len2 + "px";

                var index = 0;

                var num = 5;
                var num2 = Math.ceil(num / 2);

                function Change(){

                    Animate(oPicUl, {left: - index * w1});

                    if(index < num2){
                        Animate(oListUl, {left: 0});
                    }else if(index + num2 <= len2){
                        Animate(oListUl, {left: - (index - num2 + 1) * w2});
                    }else{
                        Animate(oListUl, {left: - (len2 - num) * w2});
                    }

                    for (var i = 0; i < len2; i++) {
                        oListLi[i].className = "";
                        if(i == index){
                            oListLi[i].className = "on";
                        }
                    }
                }

                oNextTop.onclick = oNext.onclick = function(){
                    index ++;
                    index = index == len2 ? 0 : index;
                    Change();
                }

                oPrevTop.onclick = oPrev.onclick = function(){
                    index --;
                    index = index == -1 ? len2 -1 : index;
                    Change();
                }

                for (var i = 0; i < len2; i++) {
                    oListLi[i].index = i;
                    oListLi[i].onclick = function(){
                        index = this.index;
                        Change();
                    }
                }

            })()
            //-->
        </script>
    </div>
    <!--效果html结束-->
    </div>
    </div>
</section>

<footer>
    <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>

<script type="application/javascript">
    var  gt ="";
    function readFile(obj){
        var file = obj.files[0];
        //判断类型是不是图片
        if(!/image\/\w+/.test(file.type)){
            alert("请确保文件为图像类型");
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){

            $("#imgs").attr("src",this.result);
            gt=this.result.split(",")[1];
            //alert(gt);
            // alert(); //就是base64

        }
    }

    jQuery(function ($) {
        $("#upbtn").hide();
        $("input[name='file']").change(function (e) {
            $("#upbtn").show();
        });

        $("#upimg").click(function () {
            $.ajax({
                url: "/front/user/upload",
                type: "POST",
                data: {gt: gt},
                dataType: "json",
                success: function (data) {
                    if (data.flag) {
                        savepic(data.url);
                    } else {
                        $("input[name='file']").val("");
                        alert("上传失败！请重新上传")
                    }
                },
                error: function (data) {
                    $("input[name='file']").val("");
                    alert("error");
                }
            });
        })

        function savepic(urlname) {
            $.ajax({
                url: "/front/user/addimg",
                type: "POST",
                data: {urlname: urlname,
                       albumid:${album.id},
                },
                dataType: "json",
                success: function (data) {
                    if (data.flag) {
                        alert("上传成功！")
                        window.location.reload();
                    } else {
                        $("input[name='file']").val("");
                        alert("上传失败！请重新上传")
                    }
                },
                error: function (data) {
                    $("input[name='file']").val("");
                    alert("error");
                }
            });
        }

    })

</script>
<script type="application/javascript">
    function approve(iId) {
        $.ajax({
            url: "/front/user/imgapprove",
            type: "POST",
            data: {iId: iId,
            },
            dataType: "json",
            success: function (data) {
                if (data.flag) {
                    window.location.reload();
                }
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });
    }
    function delimg(iId) {
        $.ajax({
            url: "/front/user/imgdel",
            type: "POST",
            data: {iId: iId,
            },
            dataType: "json",
            success: function (data) {
                if (data.flag) {
                    window.location.reload();
                }
                alert(data.message)
            },
            error: function (data) {
                alert("error");
            }
        });
    }
</script>
</body>
</html>
