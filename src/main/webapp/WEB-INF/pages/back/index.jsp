<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>后台管理 - Ace Admin</title>

		<meta name="description" content="网站数据统计" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/static/ace/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="/static/ace/components/font-awesome/css/font-awesome.css" />

		<!-- page specific plugin styles -->

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
							后台管理
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
								<img class="nav-user-photo" src="/static/ace/assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									郭涛
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
							<li class="active">Dashboard</li>
						</ul><!-- /.breadcrumb -->

						<!-- #section:basics/content.searchbox -->
						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="搜索" class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->

						<!-- /section:basics/content.searchbox -->
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<!-- #section:settings.box -->
						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									网站数据统计
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>

									<i class="ace-icon fa fa-check green"></i>

									网站后台统计
									<strong class="green">
										campusblog
										<small>(v1.4)</small>
									</strong>,
	数据加载完成--
								</div>

								<div class="row">
									<div class="space-6"></div>

									<div class="col-sm-9 infobox-container">
										<!-- #section:pages/dashboard.infobox -->
										<div class="infobox infobox-green">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-comments"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">32</span>
												<div class="infobox-content">用户 + ${newuser} 人</div>
											</div>

											<!-- #section:pages/dashboard.infobox.stat -->
											<div class="stat stat-success">${newuserrate}%</div>

											<!-- /section:pages/dashboard.infobox.stat -->
										</div>

										<div class="infobox infobox-blue">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-pencil"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">11</span>
												<div class="infobox-content">文章 + ${newarticle} 篇</div>
											</div>

											<div class="stat stat-success">
												+${newarticlerate}%
												<i class="ace-icon fa fa-arrow-up"></i>
											</div>
										</div>

										<div class="infobox infobox-pink">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-cloud-upload bigger-100"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">8</span>
												<div class="infobox-content">评论 + ${newusernote} 条</div>
											</div>
											<div class="stat stat-success">${newusernoterate}%</div>
										</div>

										<div class="infobox infobox-red">
											<div class="infobox-icon">
												<i class="green ace-icon fa fa-user bigger-120"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">7</span>
												<div class="infobox-content">图片 + ${newimg} 条</div>
											</div>
											<div class="stat stat-success">
												${newimgrate}%
												<i class="ace-icon fa fa-arrow-up"></i>
											</div>
										</div>

										<div class="infobox infobox-orange2">
											<!-- #section:pages/dashboard.infobox.sparkline -->
											<div class="infobox-chart">
												<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
											</div>

											<!-- /section:pages/dashboard.infobox.sparkline -->
											<div class="infobox-data">
												<span class="infobox-data-number">总用户</span>
												<div class="infobox-content">用户数${alluser}</div>
											</div>
										</div>

										<div class="infobox infobox-blue2">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-flask"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-text">总文章数</span>

												<div class="infobox-content">
													<span class="bigger-110"></span>
													${allarticle}
												</div>
											</div>
										</div>

										<!-- /section:pages/dashboard.infobox -->
										<div class="space-6"></div>

										<div style="margin-left: -20%" class="infobox infobox-grey infobox-small infobox-dark">
											<div class="infobox-icon">
												<div class="easy-pie-chart percentage" data-percent="42" data-size="46" style="height: 46px; width: 46px; line-height: 45px;">
													<span class="percent">42</span>%
													<canvas height="46" width="46"></canvas></div>
											</div>

											<div style="margin-left: 6px;" class="infobox-data">
												<div class="">扇形图</div>
												<div class="">1,205</div>
											</div>
										</div>

										<!-- /section:pages/dashboard.infobox.dark -->
									</div>

									<div class="vspace-12-sm"></div>

									<div style="margin-left: 10%" class="col-sm-5">
										<div class="widget-box">
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													Traffic Sources
												</h5>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<!-- #section:plugins/charts.flotchart -->
													<div id="piechart-placeholder"></div>

													<!-- /section:plugins/charts.flotchart -->
													<div class="hr hr8 hr-double"></div>

													<div class="clearfix">
														<!-- #section:custom/extra.grid -->
														<div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-facebook-square fa-2x blue"></i>
																&nbsp; likes
															</span>
															<h4 class="bigger pull-right">1,255</h4>
														</div>

														<div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-twitter-square fa-2x purple"></i>
																&nbsp; tweets
															</span>
															<h4 class="bigger pull-right">941</h4>
														</div>

														<div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-pinterest-square fa-2x red"></i>
																&nbsp; pins
															</span>
															<h4 class="bigger pull-right">1,050</h4>
														</div>

														<!-- /section:custom/extra.grid -->
													</div>
												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->
								</div><!-- /.row -->


								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>

						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
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
			if('ontouchstart' in document.documentElement) document.write("<script src='/static/ace/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="/static/ace/components/bootstrap/dist/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->

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
			jQuery(function($) {
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: ace.vars['old_ie'] ? false : 1000,
						size: size
					});
				})
			
				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html',
									 {
										tagValuesAttribute:'data-values',
										type: 'bar',
										barColor: barColor ,
										chartRangeMin:$(this).data('min') || 0
									 });
				});
			
			
			  //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
			  //but sometimes it brings up errors with normal resize event handlers
			  $.resize.throttleWindow = false;
			
			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  var data = [
				{ label: "最近30天新增用户",  data: ${newuser}, color: "#68BC31"},
				{ label: "最近30天新增文章",  data: ${newarticle}, color: "#2091CF"},
				{ label: "最近30天新增评论",  data: ${newusernote}, color: "#AF4E96"},
				{ label: "最近30天新增图片",  data: ${newimg}, color: "#DA5430"},
		 /*		{ label: "other",  data: 10, color: "#FEE074"}*/
			  ]
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
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
						margin:[-30,15]
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
			 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			 so that's not needed actually.
			 */
			 placeholder.data('chart', data);
			 placeholder.data('draw', drawPieChart);
			
			
			  //pie chart tooltip example
			  var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
				
			 });
			
				/////////////////////////////////////
				$(document).one('ajaxloadstart.page', function(e) {
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
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
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
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
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
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			
				$('.dialogs,.comments').ace_scroll({
					size: 300
			    });
				
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if(ace.vars['touch'] && ace.vars['android']) {
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				  });
				}
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {
						//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
			
			
				//show the dropdowns on top or bottom depending on window height and menu position
				$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
					var offset = $(this).offset();
			
					var $w = $(window)
					if (offset.top > $w.scrollTop() + $w.innerHeight() - 100) 
						$(this).addClass('dropup');
					else $(this).removeClass('dropup');
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
