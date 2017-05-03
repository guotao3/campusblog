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
    <link rel="stylesheet" href="/static/script/bootstrapTable/bootstrap-table.css"/>

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
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    校园博客管理系统
                </small>
            </a>

            <!-- /section:basics/navbar.layout.brand -->

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

            <li class="open">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon fa fa-user bigger-130"></i>  <!--green ace-icon fa fa-user bigger-120-->
							<span class="menu-text">
								用户管理
							</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu nav-show" style="display: block;">
                    <li class="active">
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
                <div id="div-advanced-search" style="display: none">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form class="form-group">
                                <label for="uid" class="col-sm-1 control-label">学号</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="uid"/>
                                </div>

                                <label for="fullname" class="col-sm-1 control-label">昵称</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="fullname"/>
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-purple btn-sm" type="button" id="search">
                                        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                        查询
                                    </button>
                                    <button class="btn btn-info btn-sm" type="button" id="clearopt">
                                        <span class="ace-icon fa fa-trash-o bigger-110 orange"></span>
                                        清空
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        用户管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            超级
                        </small>
                    </h1>

                    <div id="toolbar" style="margin-top:20px">
                        <button id="remove" class="btn btn-danger btn-sm" disabled>
                            <i class="glyphicon glyphicon-remove"></i> 批量删除
                        </button>
                        <button type="button" class="btn btn-primary btn-sm" id="add">
                            <i class="ace-icon fa fa-floppy-o"></i>新增
                        </button>

                        <button id="toggle-advanced-search" class="btn" title="高级查询" type="button">
                            <i class="fa fa-angle-double-down"></i>
                        </button>
                    </div>
                        <table id="table"  data-page-list="[5, 10, 15]" data-toolbar="toolbar" data-show-columns="true"
                        >

                        </table>
                </div><!-- /.page-header -->


            </div><!-- /.page-content -->
        </div>
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
<script src="/static/script/bootstrapTable/bootstrap-table.js"></script>
<script src="/static/script/bootstrapTable/bootstrap-table-zh-CN.js"></script>
<script src="/static/ace/components/bootbox.js/bootbox.min.js"></script>

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
    var $table = $('#table');
    $remove = $('#remove'),
            selections = [];
    //批量删除
    $table.on('check.bs.table uncheck.bs.table ' +
            'check-all.bs.table uncheck-all.bs.table', function () {
        $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
        // save your data, here just save the current page
        selections = getIdSelections();
        // push or splice the selections if you want to save all data selections
    });

    function getIdSelections() {
        return $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.uId
        });
    }


    $remove.click(function () {
        var ids = getIdSelections();
        if (ids.length != 0) {
            bootbox.confirm("确定删除?", function (result) {
                if (result) {
                    $.post('/back/user/dels', {ids: ids.toString()}, function (data) {
                        if (data.Flag) {
                            $table.bootstrapTable('refresh');
                            $remove.prop('disabled', true);
                            bootbox.alert("删除成功");
                        }
                        else {
                        alert("数据正在被使用，删除失败")
                        }
                    });
                }

            })
        } else {
            bootbox.alert('请先选择一条记录');
        }

    });

    function initTable() {
        $table.bootstrapTable({
            url: '/back/user/userlist2',
            showColumns: true,
            minimumCountColumns: 3,             //最少允许的列数
            columns: [{
                field: 'state',
                checkbox: true
            }, {
                field: 'uId',
                title: '学号'
            }, {
                field: 'name',
                title: '姓名'
            }, {
                field: 'fullname',
                title: '昵称'
            }, {
                field: 'sex',
                title: '性别',
                formatter: formatisDisplay
            }, {
                field: 'age',
                title: '年龄',
            }, {
                field: 'birth',
                title: '生日',
                visible: false
            }, {
                field: 'address',
                title: '地址',
                visible: false
            },{
                field: 'school',
                title: '学校',
                visible: false
            },{
                field: 'description',
                title: '心情随笔',
                visible: false
            }, {
                field: 'tel',
                title: '电话',
                visible: false
            }, {
                field: 'love',
                title: '点赞',
                visible: false
            }, {
                field: 'createTime',
                title: '创建时间',
                formatter:UnixToDate
            }, {
                field: 'updateTime',
                title: '最近登录时间',
                formatter:UnixToDate
             }, {
                field: 'friendId',
                title: '博友学号',
                visible: false
            }, {
                field: 'focus',
                title: '关注',
                visible: false
            }, {
                field: 'popmoods',
                title: '个性签名'
            },  {
                field: 'pic',
                title: '头像',
                formatter:formatisimgUrl
            },  {
                field: 'password',
                title: '密码',
                visible: false
            }, {
                field: 'role',
                title: '角色',
                visible: false
            },{
                field: 'operate',
                title: '操作',
                align: 'center',
                events: operateEvents,
                formatter: operateFormatter
            }],
            pagination: true,
            pageSize: 5,
            dataType: "json",
            search: false,
            queryParams: queryParams,
            sidePagination: "server"
        })
    }

    function formatisDisplay(value) {
        if(value==0){
            return "<span style='color: indianred'>女</span>";
        }else{
            return "<span style='color: indianred'>男</span>";
        }
    }
    function UnixToDate(value) {
        var temp = value.toString().substring(0,10);
        var time = parseInt(temp);
        var unixTimestamp = new Date(time * 1000);
        commonTime = unixTimestamp.toLocaleString();
        return commonTime;
    }
    function formatisimgUrl(value) {
        if(value==null || value==''){
            return "<span style='color: indianred'>暂无</span>";
        }else{
            return "<img width='100px'  src='http://localhost:8089/img-web/upload/" + value +"'>"
        }
    }

    function operateFormatter(value, row, index) {
        return [
                '<a class="like" href="javascript:void(0)" title="Like">'
            , '<button class="btn no-border">修改 </button>',
            '</a> ',
            '<a class="remove" href="javascript:void(0)" title="Remove">'
            ,' <button class="btn btn-danger no-border">删除</button>',
            '</a>  '
        ].join('');
    }

    window.operateEvents = {
        'click .like': function (e, value, row, index) {
            window.location.href="/back/user/toupdate?uid="+row.uId;
        },
        'click .remove': function (e, value, row, index) {
            bootbox.confirm("确定删除?",function (result) {
               if(result) {
                   var url = "/back/user/del/"+row.uId;
                   $.post(url,{},function (data) {
                       if(data.flag){
                           $table.bootstrapTable("refresh");
                           bootbox.alert("删除成功！");
                           $remove.prop('disabled', true);
                       }else {
                           bootbox.alert("该数据正在被使用,删除失败");
                       }

                   })
               }
            })
        }
    };

    //带查询条件分页和没有条件
    function queryParams(params) {
        var temp = {
            limit: params.limit,
            offset: params.offset,
            fullname: $("#fullname").val(),
            uid: $("#uid").val()
        }
        return temp;
    }

    //新增
    $("#add").click(function () {
        window.location.href="/back/user/toadd";
    });

    //查询表单显示或隐藏
    $("#toggle-advanced-search").click(function () {
        $("i", this).toggleClass("fa-angle-double-down fa-angle-double-up");
        $("#div-advanced-search").slideToggle("fast");
    });

    //刷新table，提交表单，数据包括Parma中表单查询数据
    $("#search").click(function () {
        $table.bootstrapTable('refresh');
    })

    //清空表单
    $("#clearopt").click(function () {
        $("#uid").val("");
        $("#fullname").val("");
    })

    jQuery(function ($) {
        //显示中文bootbox
        bootbox.setDefaults("locale","zh_CN");
        initTable();

        $('.easy-pie-chart.percentage').each(function () {
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size / 10),
                animate: ace.vars['old_ie'] ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function () {
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                    {
                        tagValuesAttribute: 'data-values',
                        type: 'bar',
                        barColor: barColor,
                        chartRangeMin: $(this).data('min') || 0
                    });
        });


        //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
        //but sometimes it brings up errors with normal resize event handlers
        $.resize.throttleWindow = false;

        var placeholder = $('#piechart-placeholder').css({'width': '90%', 'min-height': '150px'});
        var data = [
            {label: "social networks", data: 38.7, color: "#68BC31"},
            {label: "search engines", data: 24.5, color: "#2091CF"},
            {label: "ad campaigns", data: 8.2, color: "#AF4E96"},
            {label: "direct traffic", data: 18.6, color: "#DA5430"},
            {label: "other", data: 10, color: "#FEE074"}
        ]

        function drawPieChart(placeholder, data, position) {
            $.plot(placeholder, data, {
                series: {
                    pie: {
                        show: true,
                        tilt: 0.8,
                        highlight: {
                            opacity: 0.25
                        },
                        stroke: {
                            color: '#fff',
                            width: 2
                        },
                        startAngle: 2
                    }
                },
                legend: {
                    show: true,
                    position: position || "ne",
                    labelBoxBorderColor: null,
                    margin: [-30, 15]
                }
                ,
                grid: {
                    hoverable: true,
                    clickable: true
                }
            })
        }

        drawPieChart(placeholder, data);

        /**
         we saved the drawing function and the data to reFdraw with different position later when switching to RTL mode dynamically
         so that's not needed actually.
         */
        placeholder.data('chart', data);
        placeholder.data('draw', drawPieChart);


        //pie chart tooltip example
        var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
        var previousPoint = null;

        placeholder.on('plothover', function (event, pos, item) {
            if (item) {
                if (previousPoint != item.seriesIndex) {
                    previousPoint = item.seriesIndex;
                    var tip = item.series['label'] + " : " + item.series['percent'] + '%';
                    $tooltip.show().children(0).text(tip);
                }
                $tooltip.css({top: pos.pageY + 10, left: pos.pageX + 10});
            } else {
                $tooltip.hide();
                previousPoint = null;
            }

        });

        /////////////////////////////////////
        $(document).one('ajaxloadstart.page', function (e) {
            $tooltip.remove();
        });


        var d1 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d1.push([i, Math.sin(i)]);
        }

        var d2 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d2.push([i, Math.cos(i)]);
        }

        var d3 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.2) {
            d3.push([i, Math.tan(i)]);
        }


        var sales_charts = $('#sales-charts').css({'width': '100%', 'height': '220px'});
        $.plot("#sales-charts", [
            {label: "Domains", data: d1},
            {label: "Hosting", data: d2},
            {label: "Services", data: d3}
        ], {
            hoverable: true,
            shadowSize: 0,
            series: {
                lines: {show: true},
                points: {show: true}
            },
            xaxis: {
                tickLength: 0
            },
            yaxis: {
                ticks: 10,
                min: -2,
                max: 2,
                tickDecimals: 3
            },
            grid: {
                backgroundColor: {colors: ["#fff", "#fff"]},
                borderWidth: 1,
                borderColor: '#555'
            }
        });


        $('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('.tab-content')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            //var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }


        $('.dialogs,.comments').ace_scroll({
            size: 300
        });


        //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
        //so disable dragging when clicking on label
        var agent = navigator.userAgent.toLowerCase();
        if (ace.vars['touch'] && ace.vars['android']) {
            $('#tasks').on('touchstart', function (e) {
                var li = $(e.target).closest('#tasks li');
                if (li.length == 0)return;
                var label = li.find('label.inline').get(0);
                if (label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation();
            });
        }

        $('#tasks').sortable({
                    opacity: 0.8,
                    revert: true,
                    forceHelperSize: true,
                    placeholder: 'draggable-placeholder',
                    forcePlaceholderSize: true,
                    tolerance: 'pointer',
                    stop: function (event, ui) {
                        //just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
                        $(ui.item).css('z-index', 'auto');
                    }
                }
        );
        $('#tasks').disableSelection();
        $('#tasks input:checkbox').removeAttr('checked').on('click', function () {
            if (this.checked) $(this).closest('li').addClass('selected');
            else $(this).closest('li').removeClass('selected');
        });


        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function (e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
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
