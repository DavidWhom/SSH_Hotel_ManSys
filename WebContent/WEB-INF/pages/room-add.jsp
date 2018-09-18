<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
	<title>添加客房</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
	<link rel="stylesheet" href="assets/vendor/toastr/toastr.min.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/self.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<script type="text/javascript" src="assets/scripts/jquery-1.7.2.js"></script>
</head>

<body>
	<!-- 操作信息提醒 -->
	<script type="text/javascript">
		$(function(){
			$(document).ready(function(){
				if("${msg}" != ""){
					alert("${msg}");
				}
			});
			$(":submit").click(function(){
				var name = $("#name").val();
				if(name == ""){
					alert("房间名称不能为空！");
					return false;
				}
			});
		})
	</script>
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
					<!-- OVERVIEW -->
					<div class="panel panel-headline" style="height: 80%">
						<div class="panel-heading_user_edit">
							<h3 class="panel-title">添加客房</h3>
						</div>
						<hr>
						<div class="user-edit" style="padding-left: 20%">
						<form action="room-addRoom" method="post">
						<table class="user_edit_info room_add">
						<tr>
							<td style="text-align: right;padding-right: 5%; ">
								<span class="label label-primary">房间编号</span>
							</td>
							<td>
								<input type="text" name="forShowId" value="${id }" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td style="text-align: right;padding-right: 5%; ">
								<span class="label label-primary">房间名称</span>
							</td>
							<td>
								<input type="text" id="name" name="model.roomName"/>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;padding-right: 5%; ">
								<span class="label label-primary">房间类型</span>
							</td>
							<td>
								<select name="model.roomType.id">
									<s:iterator var="roomType" value="#request.roomTypes">
										<option value="${roomType.id }">${roomTypeName }</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<s:if test="#session.isPreview">
							<td colspan="2" style="text-align: center;">
								<button type="submit" class="btn btn-primary">确定</button>
							</td>
							</s:if>
						</tr>
						</table>
						</form>
						</div>
					</div>
					<!-- END OVERVIEW -->
					
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
	</div>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
