<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/logo-big.png">

<title>OA办公系统</title>
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="css/elegant-icons-style.css" rel="stylesheet" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- full calendar css-->
<!-- easy pie chart-->
<!-- owl carousel -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<!-- Custom styles -->
<link href="css/widgets.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />
<link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/dialog.css">
<link rel="stylesheet" href="css/jDialog.css">
<!-- <script src="js/pagination.js"></script> -->
<!-- container section start -->
<!-- javascripts -->
<!-- 	<script src="js/jquery.min.js"></script> -->
<script src="js/jquery.js"></script>
<script src="js/jquery-ui-1.10.4.min.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- charts scripts -->
<script src="js/jquery.sparkline.js" type="text/javascript"></script>
<script src="js/owl.carousel.js"></script>
<!--script for this page only-->
<!-- 	<script src="js/calendar-custom.js"></script> -->
<script src="js/jquery.rateit.min.js"></script>
<!-- custom select -->
<script src="js/jquery.customSelect.min.js"></script>
<!--custome script for all page-->
<script src="js/scripts.js"></script>
<!-- custom script for this page-->
<script src="js/sparkline-chart.js"></script>
<!-- <script src="js/easy-pie-chart.js"></script> -->
<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="js/jquery-jvectormap-world-mill-en.js"></script>
<script src="js/xcharts.min.js"></script>
<script src="js/jquery.autosize.min.js"></script>
<script src="js/jquery.placeholder.min.js"></script>
<script src="js/gdp-data.js"></script>
<script src="js/morris.min.js"></script>
<script src="js/sparklines.js"></script>
<script src="js/charts.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="js/dialog.js"></script>
<script type="text/javascript" src="js/jDialog.js"></script>

<script type="text/javascript">
function logout() {
	javascript: $('body').dailog({
		type : 'danger',
		title : '注意',
		discription : '您确定要要退出当前用户吗?'
	}, function(ret) {
		if (ret.index === 0) {
			window.location.href = "user_logout";
		};
	}); 
}
</script>
<script type="text/javascript">
	//点击事件,包含界面
	function toMainAction(typeId, role_num, request_id) {
		if (typeId == '1') {
			if (role_num == "000") {
				$("#index").load("BoosIndex_content.jsp");
			}
			if (role_num == '001') {
				$("#index").load("UserIndex_content.jsp");
			}
			if (role_num == '002') {
				$("#index").load("UserIndex_content.jsp");
			}
			if (role_num == '003') {
				$("#index").load("AdminIndex_content.jsp");
			}
		}
		//struts方式提交返回
		if (request_id == '0'|| request_id == null) {
			query(typeId, role_num)
			//直接点击的
		} else if (request_id == '1') {
			if (typeId == '2' || typeId == '3' || typeId == '5'
					|| typeId == '6' || typeId == '7' || typeId == '8'
					|| typeId == '10' || typeId == '11' || typeId == '12'
					|| typeId == '14' ||typeId == '15'|| typeId == '17'
					|| typeId == '23' || typeId == '24') {
				$.ajax({
					type : "post",
					url : "mainAction",
					data : {
						typeId : typeId,
						ajaxId : 1
					},
					success : function(data) {
						query(typeId, role_num)
					}
				})
			}
			if (typeId == '2') {
				$("#index").load("addUser_content.jsp");
			}
			if (typeId == '4') {
				$("#index").load("addDept_content.jsp");
			}
			if (typeId == '9') {
				$("#index").load("addNotice_content.jsp");
			}
			if (typeId == '13') {
				$("#index").load("updateUser_content.jsp");
			}
			if (typeId == '19') {
				$("#index").load("addJournal_content.jsp");
			}
			if (typeId == '21') {
				$("#index").load("addLeave_content.jsp");
			}
			if (typeId == '22') {
				$("#index").load("addOvertime_content.jsp");
			}
		}
	}
	function query(typeId, role_num) {
		if (typeId == '3') {
			$("#index").load("queryUser_content.jsp");
		}
		if (typeId == '5') {
			$("#index").load("queryDept_content.jsp");
		}
		if (typeId == '6') {
			$("#index").load("queryClock_content.jsp");
		}
		if (typeId == '7') {
			$("#index").load("queryLeave_content.jsp");
		}
		if (typeId == '8') {
			$("#index").load("queryOvertime_content.jsp");
		}
		if (typeId == '10') {
			$("#index").load("queryNotice_content.jsp");
		}
		if (typeId == '13') {
			alert('123');
			$("#index").load("updateUser_content.jsp");
		}
		if (typeId == '14') {
			$("#index").load("upFile.jsp");
		}
		if (typeId == '15') {
			$("#index").load("scanFile.jsp");
		}
		if (typeId == '17') {
			$("#index").load("fileup_content.jsp");
		}
		if (typeId == '23') {
			$("#index").load("examineLeave_content.jsp");
		}
		if (typeId == '24') {
			$("#index").load("examineOvertime_content.jsp");
		}
		if (typeId == '11') {
			$("#index").load("queryAllJournal_content.jsp");
		}
		if (typeId == '2') {
			$("#index").load("addUser_content.jsp");
		}

		if (typeId == '4') {
			$("#index").load("addDept_content.jsp");
		}
		if (typeId == '9') {
			$("#index").load("addNotice_content.jsp");
		}
		if (typeId == '19') {
			$("#index").load("addJournal_content.jsp");
		}
		if (typeId == '21') {
			$("#index").load("addLeave_content.jsp");
		}
		if (typeId == '22') {
			$("#index").load("addOvertime_content.jsp");
		}
	}
</script>
</head>

<body
	onload="toMainAction('${typeId}','${user.role_num }','${request_id }')">
	<!-- container section start -->
	<section id="container" class="">
		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom"></div>
			</div>

			<!--logo start-->
			<a href="mainAction?typeId=1" class="logo">Office <span
				class="lite"> Automation</span></a>
			<!--logo end-->

			<div class="nav search-row" id="top_menu">
				<!--  search form start -->
				<ul class="nav top-menu">
					<li>
						<form class="navbar-form">
							<input class="form-control" placeholder="Search" type="text">
						</form>
					</li>
				</ul>
				<!--  search form end -->
			</div>
			<div class="top-nav notification-row">
				<!-- notificatoin dropdown start-->
				<ul class="nav pull-right top-menu">

					<!-- task notificatoin start -->
					<!-- <li id="task_notificatoin_bar" class="dropdown"><a
						data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
							class="icon-task-l"></i> <span class="badge bg-important">6</span></a>
						<ul class="dropdown-menu extended tasks-bar">
							<div class="notify-arrow notify-arrow-blue"></div>
							<li>
								<p class="blue">You have 6 pending letter</p>
							</li>
							<li><a href="#">
									<div class="task-info">
										<div class="desc">Design PSD</div>
										<div class="percent">90%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100" style="width: 90%">
											<span class="sr-only">90% Complete (success)</span>
										</div>
									</div>
							</a></li>
							<li><a href="#">
									<div class="task-info">
										<div class="desc">Project 1</div>
										<div class="percent">30%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="30" aria-valuemin="0"
											aria-valuemax="100" style="width: 30%">
											<span class="sr-only">30% Complete (warning)</span>
										</div>
									</div>
							</a></li>
							<li><a href="#">
									<div class="task-info">
										<div class="desc">Digital Marketing</div>
										<div class="percent">80%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
											style="width: 80%">
											<span class="sr-only">80% Complete</span>
										</div>
									</div>
							</a></li>
							<li><a href="#">
									<div class="task-info">
										<div class="desc">Logo Designing</div>
										<div class="percent">78%</div>
									</div>
									<div class="progress progress-striped">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="78" aria-valuemin="0"
											aria-valuemax="100" style="width: 78%">
											<span class="sr-only">78% Complete (danger)</span>
										</div>
									</div>
							</a></li>
							<li><a href="#">
									<div class="task-info">
										<div class="desc">Mobile App</div>
										<div class="percent">50%</div>
									</div>
									<div class="progress progress-striped active">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
											style="width: 50%">
											<span class="sr-only">50% Complete</span>
										</div>
									</div>

							</a></li>
							<li class="external"><a href="#">See All Tasks</a></li>
						</ul></li> -->
					<!-- task notificatoin end -->
					<!-- inbox notificatoin start-->
					<!-- <li id="mail_notificatoin_bar" class="dropdown"><a
						data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="icon-envelope-l"></i> <span class="badge bg-important">5</span>
					</a>
						<ul class="dropdown-menu extended inbox">
							<div class="notify-arrow notify-arrow-blue"></div>
							<li>
								<p class="blue">You have 5 new messages</p>
							</li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="img/avatar-mini.jpg"></span> <span
									class="subject"> <span class="from">Greg Martin</span> <span
										class="time">1 min</span>
								</span> <span class="message"> I really like this admin panel. </span>
							</a></li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="img/avatar-mini2.jpg"></span> <span
									class="subject"> <span class="from">Bob Mckenzie</span>
										<span class="time">5 mins</span>
								</span> <span class="message"> Hi, What is next project plan? </span>
							</a></li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="img/avatar-mini3.jpg"></span> <span
									class="subject"> <span class="from">Phillip Park</span>
										<span class="time">2 hrs</span>
								</span> <span class="message"> I am like to buy this Admin
										Template. </span>
							</a></li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="img/avatar-mini4.jpg"></span> <span
									class="subject"> <span class="from">Ray Munoz</span> <span
										class="time">1 day</span>
								</span> <span class="message"> Icon fonts are great. </span>
							</a></li>
							<li><a href="#">See all messages</a></li>
						</ul></li> -->
					<!-- inbox notificatoin end -->
					<!-- alert notification start-->
					<!-- <li id="alert_notificatoin_bar" class="dropdown"><a
						data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
							class="icon-bell-l"></i> <span class="badge bg-important">7</span>
					</a>
						<ul class="dropdown-menu extended notification">
							<div class="notify-arrow notify-arrow-blue"></div>
							<li>
								<p class="blue">You have 4 new notifications</p>
							</li>
							<li><a href="#"> <span class="label label-primary"><i
										class="icon_profile"></i></span> Friend Request <span
									class="small italic pull-right">5 mins</span>
							</a></li>
							<li><a href="#"> <span class="label label-warning"><i
										class="icon_pin"></i></span> John location. <span
									class="small italic pull-right">50 mins</span>
							</a></li>
							<li><a href="#"> <span class="label label-danger"><i
										class="icon_book_alt"></i></span> Project 3 Completed. <span
									class="small italic pull-right">1 hr</span>
							</a></li>
							<li><a href="#"> <span class="label label-success"><i
										class="icon_like"></i></span> Mick appreciated your work. <span
									class="small italic pull-right"> Today</span>
							</a></li>
							<li><a href="#">See all notifications</a></li>
						</ul></li> -->
					<!-- alert notification end-->
					<!-- user login dropdown start-->
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="img/avatar1_small.jpg">
						</span>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<li class="eborder-top"><a href="#"
								onclick="toMainAction('13','${user.role_num }','1');"><i
									class="glyphicon glyphicon-user"></i>${user.u_name }</a></li>
							<li class="eborder"><a href="#"
								onclick="toMainAction('13','${user.role_num }','1');"><i
									class="glyphicon glyphicon-tag"></i>${user.p_name }</a></li>
							<li class="eborder" onclick="logout();"><a href="#"><i class="	glyphicon glyphicon-off"></i>用户注销</a></li>
						</ul></li>
				</ul>
				<!-- notificatoin dropdown end-->
			</div>
		</header>
		<!--header end-->

		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu">

					<c:forEach items="${purview }" var="userpurview">

						<c:if
							test="${userpurview.PARENT_NUM=='0'||userpurview.PARENT_NUM=='99'}">
							<li class="sub-menu"><c:if
									test="${userpurview.PURVIEW_NUM=='001'}">

									<a href="mainAction?typeId=${userpurview.TYPE_ID}" class="">
										<i class="icon_desktop"></i> <span>${userpurview.PURVIEW_NAME}</span>
										<c:if test="${userpurview.PARENT_NUM=='0'}">
											<span class="menu-arrow arrow_carrot-right"></span>
										</c:if>
									</a>
								</c:if> <c:if test="${userpurview.PURVIEW_NUM!='001'}">
									<a href="javascript:;" class=""> <i class="icon_desktop"></i>
										<span>${userpurview.PURVIEW_NAME}</span> <c:if
											test="${userpurview.PARENT_NUM=='0'}">
											<span class="menu-arrow arrow_carrot-right"></span>
										</c:if>
									</a>
								</c:if> <c:if test="${userpurview.PARENT_NUM=='0'}">
									<ul class="sub">
										<c:forEach items="${purview }" var="userpurview1">
											<c:if
												test="${userpurview1.PARENT_NUM==userpurview.PURVIEW_NUM}">
												<li><a class=""
													onclick="toMainAction('${userpurview1.TYPE_ID}','${user.role_num }',1)"
													href="#"><span>${userpurview1.PURVIEW_NAME}</span> </a></li>
											</c:if>
										</c:forEach>
									</ul>
								</c:if></li>
						</c:if>
					</c:forEach>

				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		<!-- 添加一个DIV -->
		<!--main content start-->
		<div id="index"></div>
	</section>

	

	<script>
		//knob
		$(function() {
			$(".knob").knob({
				'draw' : function() {
					$(this.i).val(this.cv + '%')
				}
			})
		});

		//carousel
		$(document).ready(function() {
			$("#owl-slider").owlCarousel({
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true

			});
		});

		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});

		/* ---------- Map ---------- */
		$(function() {
			$('#map').vectorMap({
				map : 'world_mill_en',
				series : {
					regions : [ {
						values : gdpData,
						scale : [ '#000', '#000' ],
						normalizeFunction : 'polynomial'
					} ]
				},
				backgroundColor : '#eef3f7',
				onLabelShow : function(e, el, code) {
					el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
				}
			});
		});
	</script>
	<script type="text/javascript">
		function getLink(num) {
			for (var int = 1; int < 13; int++) {
				document.getElementById('div' + int).style.display = "none";
				if (int == num) {
					document.getElementById('div' + int).style.display = "block";
				}
			}

		}
	</script>


</body>
</html>
