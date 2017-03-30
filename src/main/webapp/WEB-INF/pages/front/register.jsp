<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link  rel="stylesheet" href="/static/front/css/register.css" type="text/css" />
<script type="text/javascript" src="/static/front/js/picture.js"></script>
<script type="text/javascript" src="/static/front/js/yzm.js"></script>
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
          		<form id="registerform" method="post">
                	<div id="localImag">
                    	<img id="preview" src="/static/front/img/3.png"/>
                    </div>
                	<div class="input-control">
                        <a href="#" class="a-upload">  
                            <input  type="file" name="pic" id="doc" onchange="setImagePreview();" />上传头像
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
                    	<input name="email" type="text" placeholder="邮箱"/>
                    </div>
                    <div class="input-c">
                        <div class="input-yz" >
                            <input name="number" type="text" placeholder="请输入验证码" id="inputCode" />   
                        </div>
                        <div class="code" id="checkCode" onclick="createCode()" ></div>
                        <div class="sx">
                            <a href="javascript:;" onclick="createCode()">刷新</a>
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
    jQuery(function ($) {
    $('#reg').click(function () {
        $.ajax({
            type: "POST",
            url: "/front/user/saveOrUpadate",
            data: $('#registerform').serialize(),
            datatype: "json",
            success: function(data){
                if(data!=null){
                    alert(data.message)
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
