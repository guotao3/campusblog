<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/center_person.css" />
<script type="text/javascript" src="/static/front/js/center_person.js"></script>
    <script type="text/javascript" src="/static/front/js/jquery-3.1.1.js"></script>
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
                	<img id="imgs" src="http://localhost:8089/img-web/upload/${sessionScope.user.pic}"/>
                </div>
                <div class="input-control">
                    <a class="a-upload">
                        <input id="mypic"  type="file" name="file" onchange="readFile(this)" />选择头像
                    </a>
                </div>
                <div id="upbtn" class="input-control">
                    <a>
                        <button type="button" id="upimg"/>上传修改
                    </a>
                </div>
                <div class="dr">
                	<p style="color:#258ec2">${sessionScope.user.articlecount}</p>
                    <p>日志</p>
                </div>
                <div class="g"></div>
                <div class="dx">
                	<p style="color:#258ec2">${sessionScope.user.piccount}</p>
                    <p>相片</p>
                </div>
                <textarea name="description"></textarea>
                <button>修改个人签名</button>
            </div>
            <div class="r">
            	<div class="t">
        			<p class="a">个人资料</p>
                    <p class="b">修改</p>
        		</div>
                <form action="/front/user/saveOrUpadateUser" method="post">
                    <input name="role" type="text" value="${sessionScope.user.role}"/>
                    <input name="description" type="text" value="${sessionScope.user.description}"/>
                    <input name="email" type="text" value="${sessionScope.user.email}"/>
                    <input name="friendId" type="text" value="${sessionScope.user.friendId}"/>
                    <input style="display: none" type="text" name="pic" id="picname" value="${sessionScope.user.pic}"/>
                    <input name="uId" type="text" style="display: none" value="${sessionScope.user.uId}"/>
                    <div class="input-control">
                    	<label>姓名:</label><input name="name" type="text" value="${sessionScope.user.name}">
                    </div>
                	<div class="input-control">
                    	<label>昵称:</label><input name="fullname" type="text"  value="${sessionScope.user.fullname}"/>
                    </div>
                    <div class="input-control">
                    	<label>密码:</label><input name="password" type="text"  value="${sessionScope.user.password}"/>
                    </div>

                    <div class="input-control">
                    	<label>性别:</label>
                        <select name="sex">
                        	<option value="1" <c:if test="${sessionScope.user.sex==1}">style="selected"</c:if>>男</option>
                            <option value="0" <c:if test="${sessionScope.user.sex==0}">style="selected"</c:if>>女</option>
                        </select>
                    </div>
                     <div class="input-control">
                    	<label>生日:</label>
                        </label><input name="birth" type="date" value="${sessionScope.user.birth}"/>
                    </div>
                    <div class="input-control">
                    	<label>年龄:</label><input name="age" type="text" value="${sessionScope.user.age}"/>
                    </div> 
                   
                    <div class="input-control">
                    	<label>地址:</label><input name="address" type="text" value="${sessionScope.user.address}"/>
                    </div>
                    <div class="input-control">
                    	<label>学校:</label><input name="school" type="text" value="${sessionScope.user.school}"/>
                    </div>
                    
                    <div class="input-control">
                    	<label>电话:</label><input name="tel" type="text" value="${sessionScope.user.tel}"/>
                    </div>
                    <div class="input-control">
                    	<label>爱好:</label><input name="love" type="text" value="${sessionScope.user.love}"/>
                    </div>
                    <div class="input-control">
                    	<label>个性签名:</label><input name="popmoods" type="text" value="${sessionScope.user.popmoods}"/>
                    </div>
                     	<button type="submit">提交</button>
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
                        $("#picname").val(data.url);
                        alert("上传成功！")
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

    })

</script>
</body>
</html>
