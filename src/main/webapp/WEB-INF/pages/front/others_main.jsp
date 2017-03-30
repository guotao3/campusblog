<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="/static/front/css/others_main.css" />
<script type="text/livescript" src="/static/front/js/others_main.js"></script>
</head>
<jsp:include page="./commons/nav.jsp" flush="true" />
<body>
    <section>
    	<div class="left">
        	<div class="author">
            	<div class="pic">
    				<img src="/static/front/img/3.png" />
        		</div>
    			<div class="name">
        			<div class="n">
                		<h3>作者名</h3>`
               			<a href="javascript:;"><img title="关注" src="/static/front/img/care2.png" id="care"/></a>
           			</div>
       			</div>
        		<div class="more">
                    <h4>个人资料</h4>
                    <p>性别：男</p>
                    <p>学校：电子科大成都学院</p>
                    <p>爱好：空</p>
                    <p>个性签名：一段话</p>
        		</div>
            </div>
            <div class="article">
            	<div class="zr">
                	<h4>TA的最新日志</h4>
                </div>
                <div class="zw">
                	<div class="title"><h2>标题</h2></div>
                    <p class="time">2011-04-06 14:30</p>
                    <div id="content"> 外媒消息，印度班加罗尔 AI 医疗科技初创企业 SigTuple 完成580万美元 A 轮融资，现有投资者 Accel Partners 领投， IDG Ventures，Endiya Partners，Pi Ventures，VH Capital，Axilor Ventures 等风投机构跟投。Flipkart 联合创始人 Sachin Bansal 和 Binny Bansal，Uber 前高级副总裁，工程师 Amit Singhal 也参与投资。此轮融资将用于团队扩张，产品改进以及拓展海外市场。
元种子轮融资。</div>
                    <a href="javascript:;" id="read" title="展开">阅读全文<img src="/static/front/img/2.png" /><img src="/static/front/img/2.png" /></a>
                    <div class="zw-below">
                    	<div class="l">
                        	<span>分类: </span>
                            <span style="border-right:1px solid #000; padding-right:2px">默认分类</span>
                            <span id="yd" total="0">阅读(0)</span>
                            <span class="pl">评论(0)</span>
                        </div>
                        <div class="right">
                        	<span><a href="javascript:;"><img src="/static/front/img/收藏.png" />收藏</a></span>
                            <span><a href="javascript:;"><img src="/static/front/img/转发.png" />转发</a></span>
                            <span><a href="javascript:;" id="praise" title="赞"><img src="/static/front/img/点赞.png" />点赞</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="b">
            	<div class="inner">
                	<div class="bj">给他留言</div>
                    <textarea class="word"></textarea>
                    <button><a href="javascript:;">留言</a></button>
                </div>
            </div>
        </div>
        <div class="new-picture">
        	<div class="inner">
            	<div class="zz">
                	<h4>TA的最新照片</h4>
                </div>
                <ul>
                	<li><img src="/static/front/img/my.jpg" /><p>2015-12-13</p></li>
                    <li><img src="/static/front/img/my.jpg" /><p>2015-12-13</p></li>
                    <li><img src="/static/front/img/my.jpg" /><p>2015-12-13</p></li>
                    <li><img src="/static/front/img/my.jpg" /><p>2015-12-13</p></li>
                    <li><img src="/static/front/img/my.jpg" /><p>2015-12-13</p></li>
                    <li><img src="/static/front/img/my.jpg" /><p>2015-12-13</p></li>
                </ul>
            </div>
        </div>
    </section>
    <footer>
    <p>帆船BLOG意见反馈留言板 电话:400000 提示音后按1键 （按当地市话标准计费）欢迎批评指正</p>
    <p>Copyright &copy; 200-2017 Sailing Corporation,All Rights Reserved</p>
    <p>帆船公司 版权所有</p>
    </footer>
</body>
</html>
