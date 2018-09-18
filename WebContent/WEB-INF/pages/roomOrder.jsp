<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>房间${room.roomName }订单信息</title>
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
				if(val >= 1 && val <= parseInt("${roomOrderPage.totalPageNumber}")){
					flag = true;
				}
			}
			
			if(!flag){
				alert('输入的不是合法的页码！');
				$(this).val("");
				return;
			}
			
			//3.页面跳转
			var href = "order-getRoomOrder?model.room.id=${model.room.id }&pageNo=" + pageNo + "&" + $(":hidden").serialize();
			window.location.href = href;
		});
	})
</script>
<!-- 日历控件 -->
<script src="assets/scripts/webCalendar.js" type="text/javascript"></script> 
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
					<h3 class="page-title">房间 ${room.roomName } 订单信息</h3>
					<div class="row">
						<div class="col-md-6">
							<!-- PANEL HEADLINE -->
							<div class="panel panel-headline bookSucPage">
								<form action="order-getRoomOrder?model.room.id=${model.room.id }" method="post">
										<label>单号：</label>
										<input type="text" placeholder="输入单号" name="model.orderId"/>
										<label>会员卡号：</label>
										<input type="text" placeholder="输入会员卡号" name="model.user.id"/>
										<label>到达时间：</label>
										<input type="text" placeholder="输入到达时间" name="model.arrivalTime"
										 value="" maxlength="100" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" readonly="readonly" 
										 style="width:160px;cursor:pointer;"/>
										<button type="submit" class="btn btn-primary">查找</button>
								</form>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>序号</th>
												<th>单号</th>
												<th>会员卡号</th>
												<th>消费</th>
												<th>到达时间</th>
												<th>预离时间</th>
												<th>实离时间</th>
											</tr>
										</thead>
										<tbody>
											<s:if test="#request.roomOrderPage.list != null && #request.roomOrderPage.list.size() != 0">
											<c:forEach items="${roomOrderPage.list}" var="order" varStatus="status">
											<tr>
												<c:set var="rows" scope="page" value="${status.index + 1 }"/>
												<td>${status.index + 1 }</td>
												<td>${order.orderId }</td>
												<td>
													<a  href="user-getUser?id=${order.user.id }">${order.user.id }</a>
												</td>
												<td>￥${consumes[order.orderId] }(￥${order.price})</td>
												<td>
													<fmt:formatDate value="${order.arrivalTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
												</td>
												<td>
													<fmt:formatDate value="${order.departureTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
												</td>
												<td>
													<fmt:formatDate value="${order.realTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
												</td>
											</tr>
											</c:forEach>
											</s:if>
											<s:else>
												<td colspan="6">
													<font color="red">该房间无任何入住信息!</font>
												</td>
											</s:else>
										</tbody>
									</table>
								</div>
									<div class="panel-footer">
									<div class="row">
										<ul id="PageNum">
											共<font color="green" style="font-size: 15px;font:bold;"> ${roomOrderPage.totalPageNumber }</font> 页&nbsp;&nbsp;当前第<font color="green" style="font-size: 15px;font:bold;"> ${roomOrderPage.pageNo }</font> 页
											<li>
													<a href="order-getRoomOrder?model.room.id=${model.room.id }&pageNo=1">首页</a>
											</li>
											<li>
												<s:if test="#roomOrderPage.hasPrev">
													<a href="order-getRoomOrder?model.room.id=${model.room.id }&pageNo=${roomOrderPage.prevPage }">上一页</a>
												</s:if>
											</li>
											<c:forEach var="pageNum" begin="1" end = "${roomOrderPage.totalPageNumber }"
														step = "1">
												<c:if test="${pageNum <= 6 }">
													<li>
														<a href="order-getRoomOrder?model.room.id=${model.room.id }&pageNo=${pageNum }">${pageNum }</a>
													</li>
												</c:if>
											</c:forEach>
											<li>
												<s:if test="#roomOrderPage.hasNext">
													<a href="order-getRoomOrder?model.room.id=${model.room.id }&pageNo=${roomOrderPage.nextPage }">下一页</a>
												</s:if>
											</li>
											<li>
												<a href="order-getRoomOrder?model.room.id=${model.room.id }&pageNo=${roomOrderPage.totalPageNumber }">末页</a>
											</li>
											<font>转到&nbsp;&nbsp;</font><input type="text" id="pageNo" style="width: 25px;"/>
										</ul>
									</div>
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
