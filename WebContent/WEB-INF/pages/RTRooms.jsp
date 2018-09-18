<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Home</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/css/self.css">
	<link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>
	<script type="text/javascript" src="assets/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#pageNo").change(function(){
				var val = $(this).val();
				val = $.trim(val);
				//1.校验 val 是否为数字
				var reg = /^\d+$/g;
				var flag = false;
				if(reg.test(val)){
					var pageNo = parseInt(val);
					//2.校验 val 是否在一个合法范围内，即1~totalPageNumber
					if(val >= 1 && val <= parseInt("${roomPage.totalPageNumber}")){
						flag = true;
					}
				}
				
				if(!flag){
					alert('输入的不是合法的页码！');
					$(this).val("");
					return;
				}
				
				//3.页面跳转
				var href = "roomType-getRTRooms?id=${roomType.id }&pageNo=" + pageNo + "&" + $(":hidden").serialize();
				window.location.href = href;
			});
		})
	</script>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<%@include file="/../../navbar.jsp" %>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<%@include file="/../../sidebar.jsp" %>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<!-- RECENT PURCHASES -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">${roomType.roomTypeName }-可售客房信息</h3>
									<div class="right">
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>序号</th>
												<th>房间编号</th>
												<th>房间名</th>
												<th>所属类型</th>
												<th>可住人数</th>
												<th>现价</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<s:if test="#request.roomPage.list == null || #request.roomPage.list.size() == 0">
												<tr>
													<td colspan="5">
														<font color="red">没用任何客房信息!</font>
													</td>
												</tr>
											</s:if>
											<s:else>
												
											</s:else>
											<s:iterator var="room" value="#request.roomPage.list" status="status">
											<tr>
												<c:set var="rows" scope="page" value="${status.index + 1 }"/>
												<td>${status.index + 1 }</td>
												<td>${id }</td>
												<td>
													<a href="room-getRoom?pageNo=${roomPage.pageNo }&id=${id}">
													${roomName }</a>
												</td>
												<td>${room.roomType.roomTypeName }</td>
												<td>￥${room.roomType.price }</td>
												<td>${room.roomType.peoples }</td>
												<td>
													<s:if test="!states">
														<span class="label label-primary"><a href="roomType-getBookNowPage?id=${id }" style="color: #FFF">订购</a></span>
													</s:if>
												</td>
											</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<ul id="PageNum">
											共<font color="green" style="font-size: 15px;font:bold;"> ${roomPage.totalPageNumber }</font> 页&nbsp;&nbsp;当前第<font color="green" style="font-size: 15px;font:bold;"> ${roomPage.pageNo }</font> 页
											<li>
													<a href="roomType-getRTRooms?id=${roomType.id }&pageNo=1">首页</a>
											</li>
											<li>
												<s:if test="#roomPage.hasPrev">
													<a href="roomType-getRTRooms?id=${roomType.id }&pageNo=${roomPage.prevPage }">上一页</a>
												</s:if>
											</li>
											<c:forEach var="pageNum" begin="1" end = "${roomPage.totalPageNumber }"
														step = "1">
												<c:if test="${pageNum <= 6 }">
													<li>
														<a href="roomType-getRTRooms?id=${roomType.id }&pageNo=${pageNum }">${pageNum }</a>
													</li>
												</c:if>
											</c:forEach>
											<li>
												<s:if test="#roomPage.hasNext">
													<a href="roomType-getRTRooms?id=${roomType.id }&pageNo=${roomPage.nextPage }">下一页</a>
												</s:if>
											</li>
											<li>
												<a href="roomType-getRTRooms?id=${roomType.id }&pageNo=${roomPage.totalPageNumber }">末页</a>
											</li>
											<font>转到&nbsp;&nbsp;</font><input type="text" id="pageNo" style="width: 25px;"/>
										</ul>
									</div>
								</div>
							</div>
							<!-- END RECENT PURCHASES -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">Copyright &copy; 2018.IanKeri伊恩凯丽 All rights reserved. <a href="##" title="伊恩酒店管理系统">获取项目github源码</a></p>
				
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script>
	$(function() {
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);


		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

		var updateInterval = 3000; // in milliseconds

		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	});
	</script>
	
	<!-- 动态改变用户状态的 AJAX -->
	<script type="text/javascript" src="assets/scripts/changeState.js"></script>
</body>

</html>
