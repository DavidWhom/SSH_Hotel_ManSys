<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>操作反馈</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
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
</head>

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
					<h3 class="page-title">订购反馈</h3>
					<div class="row">
						<div class="col-md-6">
							<!-- PANEL HEADLINE -->
							<div class="panel panel-headline bookSucPage">
								<div class="panel-body">
									反馈信息：${msg }
									<table class="table table-hover">
										<thead>
											<tr>
												<th>单号</th>
												<th>房间号</th>
												<th>会员卡号</th>
												<th>消费(单价:￥${price })</th>
												<th>
													<s:if test="#request.type == 'bookNow'">
														到达时间
													</s:if>
													<s:elseif test="#request.type == 'checkOut'">
														预离时间
													</s:elseif>
													<%-- <s:elseif test="#request.type == 'checkIn'">
														登记时间
													</s:elseif> --%>
												</th>
												<th>
													<s:if test="#request.type == 'bookNow'">
														离店时间
													</s:if>
													<s:elseif test="#request.type == 'checkOut'">
														实离时间
													</s:elseif>
													<%-- <s:elseif test="#request.type == 'checkIn'">
														离店时间
													</s:elseif> --%>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${orderId }</td>
												<td>${room.id }</td>
												<td>${user.id }</td>
												<td>${totalPrice }</td>
												<td>
													<s:if test="#request.type == 'bookNow'">
														<fmt:formatDate value="${arrivalTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
													</s:if>
													<s:elseif test="#request.type == 'checkOut'">
														<fmt:formatDate value="${departureTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
													</s:elseif>
													<%-- <s:elseif test="#request.type == 'checkIn'">
														<fmt:formatDate value="${registerTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
													</s:elseif> --%>
												</td>
												<td>
													<s:if test="#request.type == 'bookNow'">
														<fmt:formatDate value="${departureTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
													</s:if>
													<s:elseif test="#request.type == 'checkOut'">
														<fmt:formatDate value="${realTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
													</s:elseif>
													<%-- <s:elseif test="#request.type == 'checkIn'">
														<fmt:formatDate value="${departureTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
													</s:elseif> --%>
												</td>
											</tr>
											<tr>
												<td colspan="6" style="text-align: center;">
													<s:if test="#request.type == 'bookNow'">
														<span class="label label-primary"><a href="room-getRooms" style="color: #FFF">确定</a></span>
													</s:if>
													<s:elseif test="#request.type == 'checkOut'">
														<span class="label label-primary"><a href="order-getCheckOutPage" style="color: #FFF">确定</a></span>
													</s:elseif>
													<s:elseif test="#request.type == 'checkIn'">
														<span class="label label-primary"><a href="order-getRegisterPage" style="color: #FFF">确定</a></span>
													</s:elseif>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- END PANEL HEADLINE -->
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
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
