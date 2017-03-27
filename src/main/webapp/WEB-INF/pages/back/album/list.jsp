<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<style type="text/css">
			.pagination {
				float: right;
				padding: 5px;
				margin-right: 11px;
			}

			.pagination a, .pagination a:link, .pagination a:visited {
				border: 1px solid #aaaadd;
				color: #006699;
				margin: 2px;
				padding: 2px 5px;
				text-decoration: none;
			}

			.pagination span.current {
				background-color: #006699;
				border: 1px solid #006699;
				color: #fff;
				font-weight: bold;
				margin: 2px;
				padding: 2px 5px;
			}

			.pagination span.disabled {
				border: 1px solid #eee;
				color: #ddd;
				margin: 2px;
				padding: 2px 5px;
			}
		</style>

		<script type="text/javascript">
			function jump(pageNo) {
				document.getElementById("pageNo").value=pageNo;
				document.getElementById("myform").submit();
			}

			function doSearch() {
				document.getElementById("myform").submit();
			}
		</script>
		<title>Gallery - Ace Admin</title>

		<meta name="description" content="responsive photo gallery using colorbox" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/static/ace/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="/static/ace/components/font-awesome/css/font-awesome.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="/static/ace/components/jquery-colorbox/example1/colorbox.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="/static/ace/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="/static/ace/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/static/ace/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="/static/ace/assets/css/ace-skins.css" />
		<link rel="stylesheet" href="/static/ace/assets/css/ace-rtl.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/static/ace/assets/css/ace-ie.css" />
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

	<body class="no-skin">
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
							Ace Admin
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-check"></i>
									4 Tasks to complete
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Software Update</span>
													<span class="pull-right">65%</span>
												</div>

												<div class="progress progress-mini">
													<div style="width:65%" class="progress-bar"></div>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Hardware Upgrade</span>
													<span class="pull-right">35%</span>
												</div>

												<div class="progress progress-mini">
													<div style="width:35%" class="progress-bar progress-bar-danger"></div>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Unit Testing</span>
													<span class="pull-right">15%</span>
												</div>

												<div class="progress progress-mini">
													<div style="width:15%" class="progress-bar progress-bar-warning"></div>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Bug Fixes</span>
													<span class="pull-right">90%</span>
												</div>

												<div class="progress progress-mini progress-striped active">
													<div style="width:90%" class="progress-bar progress-bar-success"></div>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See tasks with details
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="purple dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-exclamation-triangle"></i>
									8 Notifications
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														New Comments
													</span>
													<span class="pull-right badge badge-info">+12</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<i class="btn btn-xs btn-primary fa fa-user"></i>
												Bob just signed up as an editor /static/ace.
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
														New Orders
													</span>
													<span class="pull-right badge badge-success">+8</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
														Followers
													</span>
													<span class="pull-right badge badge-info">+11</span>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See all notifications
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="green dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-envelope-o"></i>
									5 Messages
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#" class="clearfix">
												<img src="/static/ace/assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Alex:</span>
														Ciao sociis natoque penatibus et auctor /static/ace.
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>a moment ago</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="/static/ace/assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Susan:</span>
														Vestibulum id ligula porta felis euismod /static/ace.
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 minutes ago</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="/static/ace/assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Bob:</span>
														Nullam quis risus eget urna mollis ornare /static/ace.
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>3:15 pm</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="/static/ace/assets/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Kate:</span>
														Ciao sociis natoque eget urna mollis ornare /static/ace.
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>1:33 pm</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="/static/ace/assets/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Fred:</span>
														Vestibulum id penatibus et auctor  /static/ace.
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>10:09 am</span>
													</span>
												</span>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="inbox.html">
										See all messages
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="/static/ace/assets/avatars/user.jpg" alt="Jason's Photo" />
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
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

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

					<li class="active">
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
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
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
							<li class="active">相册</li>
						</ul><!-- /.breadcrumb -->
						</form>

						<!-- #section:basics/content.searchbox -->
						<div class="nav-search" id="nav-search">
							<form method="post" action="/back/album/getlist" id="myform" class="form-search">
								<input type="hidden" name="pageNo" value="${pageNo}" id="pageNo">
								<span class="input-icon">
									<input type="text" id="uid" name="uid" placeholder="学号" class="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
								<button type="submit" class="btn btn-info btn-sm dropdown-toggle">搜索</button>
							</form>
						</div><!-- /.nav-search -->

						<!-- /section:basics/content.searchbox -->
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<div class="page-header">
							<h1>
								相册
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									相册详情
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div>
									<ul id="imgcontain" class="ace-thumbnails clearfix">
	           <c:if test="${!empty Albumlist}">
	                   <c:forEach items="${Albumlist}" var="album" varStatus="status">
										<li>
											<div>
												<img width="150" height="150" alt="150x150" src="http://localhost:8089/img-web/upload/${album.def}" />
												<div class="text">
													<div class="inner"><a href="javascript:void(0);" title="${album.name}" onclick="window.open('/back/album/detail?albumid=${album.id}')">${album.name}</a></div>
												</div>
											</div>
											<div class="tools tools-bottom">
												<a href="#">
													<span class="badge badge-info"><a href="javascript:void(0);" title="${album.name}" onclick="window.open('/back/album/detail?albumid=${album.id}')">view${album.num}</a></span>
												</a>
												<a href="javascript:void(0);" onclick="window.open('/back/album/del?albumid=${album.id}')">
													<i class="ace-icon fa fa-times red"></i>
											    </a>
											</div>
										</li>
	                   </c:forEach>
               </c:if>
									</ul>
								</div><!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<div class="pull-right pagination">
							<div class="pagination">
								<c:if test="${pageNo==1}">
									<span class="disabled prev_page">« 上一页</span>
								</c:if>
								<c:if test="${pageNo!=1}">
									<%--<a href="/front/search?pageNo=${pageNo-1}">« 上一页</a>--%>
									<a href="javascript:void(0)" onclick="jump('${pageNo-1}')">« 上一页</a>
								</c:if>


								<c:forEach begin="1" end="${requestScope.totalPage}" var="pageNow">
									<c:if test="${pageNo==pageNow}">
										<span class="current">${pageNow}</span>
									</c:if>
									<c:if test="${pageNo!=pageNow}">
										<%--<a href="/front/search?pageNo=${pageNow}">${pageNow}</a>--%>
										<a href="javascript:void(0)" onclick="jump(${pageNow})">${pageNow}</a>
									</c:if>
								</c:forEach>


								<c:if test="${pageNo==totalPage}">
									<span class="disabled prev_page">下一页 »</span>
								</c:if>
								<c:if test="${pageNo!=totalPage}">
									<%--<a href="/front/search?pageNo=${pageNo+1}">下一页 »</a>--%>
									<a href="javascript:void(0)" onclick="jump('${pageNo+1}')">下一页 »</a>
								</c:if>
							</div>
						</div>
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>

			<span style="font-family:'sans serif, tahoma, verdana, helvetica';"><span style="white-space:normal;"> </span></span>


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
			if('ontouchstart' in document.documentElement) document.write("<script src='/static/ace/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="/static/ace/components/bootstrap/dist/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="/static/ace/components/jquery-colorbox/jquery.colorbox.js"></script>

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
			jQuery(function($) {
				if(${totalPage==0}) {
					$('.pagination').hide();
					alert("没有相关查询！")
				}
				if(${jsonObj.flag==false}) {
					alert("数据正在被使用，删除失败！")
				}
				if(${jsonObj.flag==true}) {
					alert("删除成功！");
					window.location.href="http://localhost:8080/back/album/list";
				}


	var $overflow = '';
	var colorbox_params = {
		rel: 'colorbox',
		reposition:true,
		scalePhotos:true,
		scrolling:false,
		previous:'<i class="ace-icon fa fa-arrow-left"></i>',
		next:'<i class="ace-icon fa fa-arrow-right"></i>',
		close:'&times;',
		current:'{current} of {total}',
		maxWidth:'100%',
		maxHeight:'100%',
		onOpen:function(){
			$overflow = document.body.style.overflow;
			document.body.style.overflow = 'hidden';
		},
		onClosed:function(){
			document.body.style.overflow = $overflow;
		},
		onComplete:function(){
			$.colorbox.resize();
		}
	};

	$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
	$("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange fa-spin'></i>");//let's add a custom loading icon
	
	
	$(document).one('ajaxloadstart.page', function(e) {
		$('#colorbox, #cboxOverlay').remove();
   });
})
		</script>

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="/static/ace/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="/static/ace/docs/assets/js/themes/sunburst.css" />

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
