<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link  rel="stylesheet" href="/static/front/css/register.css" type="text/css" />
<script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body onload="createCode()">
    <div id="zc">
    	<div class="inner">
        	<div class="h">
            	<h2>注册账号</h2>
            	<a href="/front/index/tolog">使用已有账号登录</a>
            </div>
            <div class="zc-section">
          		<form id="registerform" method="post" enctype="multipart/form-data">
                	<div id="localImag">
                    	<img id="imgs" src="/static/front/img/3.png"/>
                    </div>
                	<div class="input-control">
                        <a class="a-upload">
                            <input id="mypic"  type="file" name="file" onchange="readFile(this)" />选择头像
                        </a>
                    </div>
                    <input style="display: display" type="text" name="pic" id="picname"/>
                    <div id="upbtn" class="input-control">
                    <a class="a-upload">
                        <input type="button" id="upimg"/>上传
                    </a>
                    </div>
                    <div class="input-control">
                    	<input name="uId" type="text" placeholder="账号"/>
                    </div>   
                    <div class="input-control">
                    	<input name="password" type="password" placeholder="密码"/>
                    </div>
                    <div class="input-control">
                    	<input name="repassword" type="password" placeholder="确认密码"/>
                    </div>
                    <div class="input-control">
                    	<input id="tel" name="tel" type="text" placeholder="电话"/>
                    </div>
                    <div class="input-c">
                        <div class="input-yz" >
                            <input name="name" type="text" placeholder="请输入验证码" id="inputCode" />
                        </div>
                        <div class="sx">
                            <input type="button" value="发送验证码" onclick="sendCode()"></input>
                        </div>
                    </div>

                    <div class="bt">
                    	<input id="reg" type="button" value="注册账号" />
                    </div>
            	</form>


            </div>
        </div>
    </div>
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
     
     function sendCode() {
         tel=$("input[name='tel']").val();
             $.ajax({
                 url: "/front/user/getcode",
                 type: "POST",
                 data:{tel:tel},
                 dataType:"json",
                 success: function (data) {
                     if(data.respcode!=null){
                         alert("send成功！")
                     }else {
                         alert("send失败！请重新send")
                     }
                 },
                 error: function (data) {
                     alert("error");
                 }
             });
     }

    jQuery(function ($) {
        $("#upbtn").hide();
        $("input[name='file']").change(function(e){
            $("#upbtn").show();
        });

        $("#upimg").click(function (){
            $.ajax({
                url: "/front/user/upload",
                type: "POST",
                data: {gt:gt},
                dataType:"json",
                success: function (data) {
                    if(data.flag){
                        $("#picname").val(data.url);
                        alert("上传成功！")
                    }else {
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




        $('#reg').click(function () {
        $.ajax({
            type: "POST",
            url: "/front/user/saveOrUpadate",
            data: $('#registerform').serialize(),
            datatype: "json",
            success: function(data){
                if(data!=null){
                    alert(data.message)
                    $(":input").empty();
                }
            },
            error: function () {
                alert("ajax异常")
            }
        });

    })

    })
</script>
</body>
</html>
