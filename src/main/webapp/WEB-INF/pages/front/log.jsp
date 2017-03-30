<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="/static/front/css/log.css" />
<script type="text/javascript" src="/static/front/js/yzm.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body <%--onload="createCode()"--%>>
<div id="main-wrapper">
      <section id="log">
      	<div class="picture">
        	<img src="/static/front/img/logo.jpg" />
        </div>
      	<div class="inner">
        	<div class="chose">
            	<h2>账号密码登录</h2>
                <a href="register.html">注册新用户</a>
            </div>
            <div class="lw">
            	<form action="/front/index/login" method="post">
                	<div class="input-control">
                		<input name="username" type="text" placeholder="请输入登录账号"/>
                    </div>
                    <div class="input-control">
                  	  <input name="password" type="password" placeholder="请输入登录密码"/>
                    </div> 
                  	 	<p>忘记密码?</p>
                    <div class="input-control">
                        <div class="input-yz" >
                            <input name="number" type="text" placeholder="请输入验证码" id="inputCode" />   
                        </div>
                        <div class="code" id="checkCode" onclick="createCode()" ></div>
                        <div class="sx">
                            <a href="javascript:void (0);"<%-- onclick="createCode()"--%>>刷新</a>
                        </div>
                    </div>
                    <div class="input-c">
                    	<input type="checkbox" /><span>自动登录</span>
                    </div>
                    <div class="bt">
                    	<%--<input id="Button1" onclick="/*validateCode();*/" type="button" value="立即登录" />--%>
                            <button type="button" id="login">立即登录</button>
                    </div>
                </form>
            </div>
        </div>
      </section>
      <footer>
      <p>帆船BLOG意见反馈留言板</p>
    <p>Copyright &copy; GT LH LYD LSQ</p>
    <p>该组成员 版权所有</p>
    </footer>
</div>
<script type="application/javascript">
    jQuery(function ($) {
        $('#login').click(function () {
            $("form").submit();
        })
    })
</script>
</body>
</html>
