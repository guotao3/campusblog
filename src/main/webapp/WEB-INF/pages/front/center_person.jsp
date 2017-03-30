<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/center_person.css" />
<script type="text/javascript" src="/static/front/js/center_person.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
<section>
	<div class="left">
    	<div class="top">
        	<p>个人中心</p>
        </div>
        <div class="below">
        	<div class="l">
            	<div id="localImag">
                	<img id="preview" src="/static/front/img/3.png"/>
                </div>
                <div class="input-control">
                    <a href="#" class="a-upload">  
                    	<input  type="file" id="doc" onchange="setImagePreview();" />修改头像
                    </a>
                </div>
                <div class="dr">
                	<p style="color:#258ec2">0</p>
                    <p>日志</p>
                </div>
                <div class="g"></div>
                <div class="dx">
                	<p style="color:#258ec2">2999</p>
                    <p>相片</p>
                </div>
                <textarea></textarea>
                <button>修改个人签名</button>
            </div>
            <div class="r">
            	<div class="t">
        			<p class="a">个人资料</p>
                    <p class="b">修改</p>
        		</div>
                <form name="form" method="post">
                	<div class="input-control">
                    	<label>学号:</label><input name="UId" type="text"/>
                    </div>
                    <div class="input-control">
                    	<label>姓名:</label><input name="name" type="text"/>
                    </div>
                	<div class="input-control">
                    	<label>昵称:</label><input name="fullname" type="text"/>
                    </div>
                    <div class="input-control">
                    	<label>密码:</label><input name="password" type="text"/>
                    </div> 
                    <div class="input-control">
                    	<label>性别:</label>
                        <select name="select">
                        	<option>男</option>
                            <option>女</option>
                        </select>
                    </div>
                     <div class="input-control">
                    	<label>生日:</label>
                        </label><input name="bir" type="date"/>
                    </div>
                    <div class="input-control">
                    	<label>年龄:</label><input name="age" type="text"/>
                    </div> 
                   
                    <div class="input-control">
                    	<label>地址:</label><input name="address" type="text"/>
                    </div>
                    <div class="input-control">
                    	<label>学校:</label><input name="school" type="text"/>
                    </div>
                    
                    <div class="input-control">
                    	<label>电话:</label><input name="tel" type="text"/>
                    </div>
                    <div class="input-control">
                    	<label>爱好:</label><input name="love" type="text"/>
                    </div>
                    <div class="input-control">
                    	<label>心情随笔:</label><input name="description" type="text"/>
                    </div>
                     	<button>提交</button> 
                </form>
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
