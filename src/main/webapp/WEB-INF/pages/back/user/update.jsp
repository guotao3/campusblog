<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Dashboard - Ace Admin</title>

    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/static/ace/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/ace/components/font-awesome/css/font-awesome.css"/>

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="/static/bootstrapValidator/dist/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="/static/webuploader/css/webuploader.css"/>
    <link rel="stylesheet" href="/static/ace/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" />
    <!-- text fonts -->
    <link rel="stylesheet" href="/static/ace/assets/css/ace-fonts.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="/static/ace/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="/static/ace/assets/css/ace-part2.css" class="ace-main-stylesheet"/>
    <![endif]-->
    <link rel="stylesheet" href="/static/ace/assets/css/ace-skins.css"/>
    <link rel="stylesheet" href="/static/ace/assets/css/ace-rtl.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="/static/ace/assets/css/ace-ie.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="/static/ace/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="/static/ace/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="/static/ace/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="skin-3">
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <!-- #section:basics/sidebar.mobile.toggle -->
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.user -->
            <a href="#" class="navbar-user">
                <small>
                    <i class="fa fa-leaf"></i>
                    电商管理系统
                </small>
            </a>

            <!-- /section:basics/navbar.layout.user -->

            <!-- #section:basics/navbar.toggle -->

            <!-- /section:basics/navbar.toggle -->
        </div>

        <!-- #section:basics/navbar.dropdown -->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <!-- #section:basics/navbar.user_menu -->
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="/static/ace/assets/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>Welcome,</small>
									Jason
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/back/user/touserlist2">
                                <i class="ace-icon fa fa-cog"></i>
                                Settings
                            </a>
                        </li>

                        <li>
                            <a href="/back/user/touserlist2">
                                <i class="ace-icon fa fa-user"></i>
                                Profile
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="/back/user/logout">
                                <i class="ace-icon fa fa-power-off"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- /section:basics/navbar.user_menu -->
            </ul>
        </div>

        <!-- /section:basics/navbar.dropdown -->
    </div><!-- /.navbar-container -->
</div>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container"></div>
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
        <script type="text/javascript">
            try {
                ace.settings.loadState('sidebar')
            } catch (e) {
            }
        </script>



        <ul class="nav nav-list">
            <li class="active">
                <a href="/back/user/toindex">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> 管理 </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon fa fa-user bigger-130"></i>  <!--green ace-icon fa fa-user bigger-120-->
							<span class="menu-text">
								用户管理
							</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="/back/user/touserlist2">
                            <i class="menu-icon fa fa-caret-right"></i>

                            超级用户

                        </a>

                        <b class="arrow"></b>


                    </li>

                    <li class="">
                        <a href="/back/user/touserlist">
                            <i class="menu-icon fa fa-caret-right"></i>
                            普通用户
                        </a>

                        <b class="arrow"></b>
                    </li>

                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-list"></i>
                    <span class="menu-text"> 文章管理 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="/back/article/toarticlelist">
                            <i class="menu-icon fa fa-caret-right"></i>
                            分类文章
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="/back/article/tohotarticlelist">
                            <i class="menu-icon fa fa-caret-right"></i>
                            热门文章
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-pencil-square-o"></i>
                    <span class="menu-text"> 消息管理 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="/back/message/tofeedmessagelist">
                            <i class="menu-icon fa fa-caret-right"></i>
                            用户消息
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="/back/message/topushmessagelist">
                            <i class="menu-icon fa fa-caret-right"></i>
                            系统消息
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="/back/Communicate/tomessagelist">
                    <i class="menu-icon fa fa-list-alt"></i>
                    <span class="menu-text"> 禁言管理 </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="/back/album/list">
                    <i class="menu-icon fa fa-picture-o"></i>
                    <span class="menu-text"> 相册管理 </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="/back/user/toindex">&nbsp;
                    <i class="ace-icon glyphicon glyphicon-align-left"></i>

							<span class="menu-text">
							    网站统计
							</span>
                </a>

                <b class="arrow"></b>
            </li>


            <li class="">
                <a href="/back/link/tolink">
                    <i class="menu-icon fa fa-tag"></i>
                    <span class="menu-text"> 友情链接 </span>
                </a>
            </li>
        </ul><!-- /.nav-list -->

        <!-- #section:basics/sidebar.layout.minimize -->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
               data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

        <!-- /section:basics/sidebar.layout.minimize -->
    </div>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->


                <!-- /section:basics/content.searchbox -->
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        用户管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            更新
                        </small>
                    </h1>
            </div>     <!-- page-header -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form action="/back/user/saveOrUpadate" class="form-horizontal" role="form" id="myform" enctype="multipart/form-data">
                            <input type="hidden" class="form-control" id="createTime" name="createTime"
                                   value="${user.createTime}">
                            <input type="hidden" class="form-control" id="updateTime" name="updateTime"
                                   value="${user.updateTime}">
                            <div class="form-group">
                                <label for="uId" class="col-sm-1 control-label">学号</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="uId" name="uId"
                                           value="${user.uId}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fileList" class="col-sm-1 control-label">上传图片</label>
                                <div class="col-sm-11" id="uploader-demo">
                                    <div id="fileList" class="uploader-list"></div>
                                    <div id="filePicker">选择图片</div>
                                    <input type= "hidden" name="pic" id="imgUrl" value="${user.pic}">
                                    <c:if test="${!empty user.pic}">
                                        修改前：   <img src="http://localhost:8089/img-web/upload/${user.pic}" width="100px">
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="col-sm-1 control-label">姓名</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="name" name="name"
                                           value="${user.name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fullname" class="col-sm-1 control-label">昵称</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="fullname" name="fullname"
                                           value="${user.fullname}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-1 control-label">性别</label>
                                <div class="radio">
                                    <label>
                                        <input name="sex" type="radio" class="ace" value="1" <c:if test="${user.sex==1}"> checked</c:if>/>
                                        <span class="lbl"> 男</span>
                                    </label>
                                </div>
                                <div class="radio" style="float:left">
                                    <label>
                                        <input name="sex" type="radio" class="ace" value="0" <c:if test="${user.sex==0}"> checked</c:if>/>
                                        <span class="lbl"> 女</span>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-1 control-label">password</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="password" name="password"
                                           value="${user.password}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="age" class="col-sm-1 control-label">age</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="age" name="age"
                                           value="${user.age}">
                                </div>
                            </div>

                            <div  class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="form-field-date">Birth Date</label>

                                <div class="col-sm-9">
                                    <div class="input-medium">
                                        <div class="input-group">
                                            <input class="input-medium date-picker" id="form-field-date" name="birth" type="text" data-date-format="dd-mm-yyyy" value="${user.birth}" />
																			<span class="input-group-addon">
																				<i class="ace-icon fa fa-calendar"></i>
																			</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="address" class="col-sm-1 control-label">address</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="address" name="address"
                                           value="${user.address}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="school" class="col-sm-1 control-label">school</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="school" name="school"
                                           value="${user.school}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="description" class="col-sm-1 control-label">description</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="description" name="description"
                                           value="${user.description}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tel" class="col-sm-1 control-label">address</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="tel" name="tel"
                                           value="${user.tel}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="url" class="col-sm-1 control-label">url</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="url" name="url"
                                           value="${user.url}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="love" class="col-sm-1 control-label">love</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="love" name="love"
                                           value="${user.love}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-1 control-label">角色</label>
                                <div class="radio">
                                    <label>
                                        <input name="role" type="radio" class="ace" value="1" id="yes" />
                                        <span class="lbl"> 管理员</span>
                                    </label>
                                </div>
                                <div class="radio" style="float:left">
                                    <label>
                                        <input name="role" type="radio" class="ace" value="0" id="no" />
                                        <span class="lbl"> 非管理员</span>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-1 col-sm-11">
                                    <button type="submit" class="btn btn-default">提交</button>
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

        </div><!-- /.page-content -->
    </div><!-- /.main-content -->

    <div class="footer">
        <div class="footer-inner">
            <!-- #section:basics/footer -->
            <div class="footer-content">

            </div>

            <!-- /section:basics/footer -->
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="/static/ace/components/jquery/dist/jquery.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/static/ace/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='/static/ace/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>" + "<" + "/script>");
</script>
<script src="/static/ace/components/bootstrap/dist/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->
    <script src="/static/bootstrapValidator/dist/js/bootstrapValidator.js"></script>
    <script src="/static/bootstrapValidator/dist/js/language/zh_CN.js"></script>
    <script src="/static/webuploader/dist/webuploader.js"></script>
    <script src="/static/ace/components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
    <script src="/static/ace/components/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js" type="text/javascript"></script>

<!--[if lte IE 8]>
<script src="/static/ace/components/ExplorerCanvas/excanvas.js"></script>
<![endif]-->
<script src="/static/ace/components/_mod/jquery-ui.custom/jquery-ui.custom.js"></script>
<script src="/static/ace/components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="/static/ace/components/_mod/easypiechart/jquery.easypiechart.js"></script>
<script src="/static/ace/components/jquery.sparkline/index.js"></script>
<script src="/static/ace/components/Flot/jquery.flot.js"></script>
<script src="/static/ace/components/Flot/jquery.flot.pie.js"></script>
<script src="/static/ace/components/Flot/jquery.flot.resize.js"></script>

<!-- ace scripts -->
<script src="/static/ace/assets/js/src/elements.scroller.js"></script>
<script src="/static/ace/assets/js/src/elements.colorpicker.js"></script>
<script src="/static/ace/assets/js/src/elements.fileinput.js"></script>
<script src="/static/ace/assets/js/src/elements.typeahead.js"></script>
<script src="/static/ace/assets/js/src/elements.wysiwyg.js"></script>
<script src="/static/ace/assets/js/src/elements.spinner.js"></script>
<script src="/static/ace/assets/js/src/elements.treeview.js"></script>
<script src="/static/ace/assets/js/src/elements.wizard.js"></script>
<script src="/static/ace/assets/js/src/elements.aside.js"></script>
<script src="/static/ace/assets/js/src/ace.js"></script>
<script src="/static/ace/assets/js/src/ace.basics.js"></script>
<script src="/static/ace/assets/js/src/ace.scrolltop.js"></script>
<script src="/static/ace/assets/js/src/ace.ajax-content.js"></script>
<script src="/static/ace/assets/js/src/ace.touch-drag.js"></script>
<script src="/static/ace/assets/js/src/ace.sidebar.js"></script>
<script src="/static/ace/assets/js/src/ace.sidebar-scroll-1.js"></script>
<script src="/static/ace/assets/js/src/ace.submenu-hover.js"></script>
<script src="/static/ace/assets/js/src/ace.widget-box.js"></script>
<script src="/static/ace/assets/js/src/ace.settings.js"></script>
<script src="/static/ace/assets/js/src/ace.settings-rtl.js"></script>
<script src="/static/ace/assets/js/src/ace.settings-skin.js"></script>
<script src="/static/ace/assets/js/src/ace.widget-on-reload.js"></script>
<script src="/static/ace/assets/js/src/ace.searchbox-autocomplete.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {

        if('${user.role}'==0){
            $('#no').attr("checked","checked");
        }else if('${user.role}'==1){
            $('#yes').attr("checked","checked");
        }else{
            $('#no').attr("checked","checked");
        }
        var $ = jQuery,
                $list = $('#fileList'),
        // 优化retina, 在retina下这个值是2
                ratio = window.devicePixelRatio || 1,

        // 缩略图大小
                thumbnailWidth = 100 * ratio,
                thumbnailHeight = 100 * ratio,

        // Web Uploader实例
                uploader;

        // 初始化Web Uploader
        uploader = WebUploader.create({

            // 自动上传。
            auto: true,

            // swf文件路径
            swf: '/static/webuploader/dist/Uploader.swf',

            // 文件接收服务端。
            server: '/back/user/uploads',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: {
                id:'#filePicker'

            },//fileval :"pic",      //fileval 后台接收的名，如果不写这个 默认为file
            // 只允许选择文件，可选。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });

        // 当有文件添加进来的时候
        uploader.on('fileQueued', function (file) {
            var $li = $(
                            '<div id="' + file.id + '" class="file-item thumbnail">' +
                            '<img>' +
                            '<div class="info">' + file.name + '</div>' +
                            '</div>'
                    ),
                    $img = $li.find('img');

            $list.append($li);

            // 创建缩略图
            uploader.makeThumb(file, function (error, src) {
                if (error) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr('src', src);
            }, thumbnailWidth, thumbnailHeight);
        });

        // 文件上传过程中创建进度条实时显示。
        uploader.on('uploadProgress', function (file, percentage) {
            var $li = $('#' + file.id),
                    $percent = $li.find('.progress span');

            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<p class="progress"><span></span></p>')
                        .appendTo($li)
                        .find('span');
            }

            $percent.css('width', percentage * 100 + '%');
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on('uploadSuccess', function (file) {
            $('#' + file.id).addClass('upload-state-done');
        });

        // 文件上传失败，现实上传出错。
        uploader.on('uploadError', function (file) {
            var $li = $('#' + file.id),
                    $error = $li.find('div.error');

            // 避免重复创建
            if (!$error.length) {
                $error = $('<div class="error"></div>').appendTo($li);
            }

            $error.text('上传失败');
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on('uploadComplete', function (file) {
            $('#' + file.id).find('.progress').remove();
        });

        uploader.on("uploadAccept",function(object,ret){
            //服务器响应了
            //ret._raw  类似于 data
            var data =JSON.parse(ret._raw);
            $('#imgUrl').val(data.urlUrl);
        });

        $('#myform').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                uId: {
                    validators: {
                        notEmpty: {
                            message: '学号不能为空'
                        }
                    }
                },
                name: {
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        }
                    }
                },
                birth: {
                    validators: {
                        notEmpty: {
                            message: '生日不能为空'
                        }
                    }
                },
                /*   emailAddress: {
                 message: 'The input is not a valid email address'
                 }*/
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }


            }
        });


        $("#form-field-date").datepicker({
            language: "zh-CN",
            autoclose: true,//选中之后自动隐藏日期选择框
            clearBtn: true,//清除按钮
            todayBtn: false,//今日按钮
            language:'zh-CN',
            format: "yyyy-mm-dd"//日期格式
        });

    })


</script>

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="/static/ace/assets/css/ace.onpage-help.css"/>
<link rel="stylesheet" href="/static/ace/docs/assets/js/themes/sunburst.css"/>

<script type="text/javascript"> ace.vars['base'] = '/static/ace'; </script>
<script src="/static/ace/assets/js/src/elements.onpage-help.js"></script>
<script src="/static/ace/assets/js/src/ace.onpage-help.js"></script>
<script src="/static/ace/docs/assets/js/rainbow.js"></script>
<script src="/static/ace/docs/assets/js/language/generic.js"></script>
<script src="/static/ace/docs/assets/js/language/html.js"></script>
<script src="/static/ace/docs/assets/js/language/css.js"></script>
<script src="/static/ace/docs/assets/js/language/javascript.js"></script>
</body>
</html>
