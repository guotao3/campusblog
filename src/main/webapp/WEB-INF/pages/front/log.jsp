<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="/static/front/css/log.css" />
<script type="text/javascript" src="/static/front/js/yzm.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="/static/script/jquery.cookie.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body <%--onload="createCode()"--%>>
<div id="main-wrapper">
      <section id="log">
      	<div class="picture">
        	<img src="/static/front/img/logo.jpg" />
        </div>
      	<div class="inner">
            <c:if test="${!empty message}">
                <input style="margin-left: 75%px" type="text" class="state5" value="${message}">
            </c:if>
        	<div class="chose">
            	<h2>账号密码登录</h2>
                <a href="/front/user/toregister">注册新用户</a>
            </div>
            <div class="lw">
            	<form action="/front/user/login" method="post">
                    <input type="hidden" name="returnUrl" value="${sessionScope.returnUrl}"/>
                	<div class="input-control">
                		<input name="username" type="text" placeholder="请输入登录账号"/>
                        <span class='state1'>请输入用户名</span><br/><br/>
                    </div>
                    <div class="input-control">
                  	  <input name="password" type="password" placeholder="请输入登录密码"/>
                        <span  style="float: right" class='state1'>请输入密码</span><br/><br/>
                    </div> 
                  	 	<p style="cursor:pointer;"><a style="javascript:void (0)" id="forget">忘记密码?</a></p>
                    <script type="application/javascript">
                        $("#forget").click(function () {
                            alert("请联系管理员找回" +
                                    "qq:649522441"+"\n"+
                                    "        tel:18482101758")
                        })
                    </script>
                    <div class="input-control">
                        <div class="input-yz" >
                            <input name="captcha" type="text" placeholder="请输入验证码" id="inputCode" />
                        </div>
                        <img src="/Front/Product/Buyer/kaptcha" onclick="this.src='/front/user/kaptcha?d='+new Date()" class="code" alt="换一张" />
                            <div class="sx">
                            <a id="yanzen" href="javascript:void(0);" onclick="$('.code').attr('src','/front/user/kaptcha?d='+new Date())" title="换一张">换一张</a>
                        </div>
                    </div>
                    <div class="input-c">
                    	<input id="autolog" type="checkbox" name="auto" /><span>自动登录</span>
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
        $('#yanzen').trigger('click');
        var ok1=false;
        var ok2=false;
        // 验证用户名
        $('input[name="username"]').focus(function(){
            $(this).next().text('用户名应该为3-20位之间').removeClass('state1').addClass('state2');
        }).blur(function(){
            if($(this).val().length >= 3 && $(this).val().length <=12 && $(this).val()!=''){
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                ok1=true;
            }else{
                $(this).next().text('用户名应该为3-20位之间').removeClass('state1').addClass('state3');
            }
        }).change(function () {
            if($(this).val()==""){
                ok1 = false;
                $(this).next().text('用户名应该为3-20位之间').removeClass('state1').addClass('state3');
            }
        });

        //验证密码
        $('input[name="password"]').focus(function(){
            $(this).next().text('密码应该为3-20位之间').removeClass('state1').addClass('state2');
        }).blur(function(){
            if($(this).val().length >= 3 && $(this).val().length <=20 && $(this).val()!=''){
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                ok2=true;
            }else{
                $(this).next().text('密码应该为3-20位之间').removeClass('state1').addClass('state3');
            }
        }).change(function () {
            if($(this).val()==""){
                ok2 = false;
                $(this).next().text('用户名应该为3-20位之间').removeClass('state1').addClass('state3');
            }
        });



        //提交按钮,所有验证通过方可提交
        $('#login').click(function(){
            if($("input[type='checkbox']").is(':checked')==true){
                $("input[type='checkbox']").val(1);
            }
            if(ok1 && ok2){
                $('form').submit();
            }else{
                return false;
            }
        });

    });
/*    jQuery(function ($) {
        obj = $.parseJSON($.cookie("user"));
        if(obj!=null){
            $('input[name="username"]').val(obj.uId);
            $('input[name="password"]').val(obj.password);
        }
    })*/
</script>
</body>
</html>
