<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${name }的个人资料</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/css/self.css">
	
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
				if(val >= 1 && val <= parseInt("${userOrderPage.totalPageNumber}")){
					flag = true;
				}
			}
			
			if(!flag){
				alert('输入的不是合法的页码！');
				$(this).val("");
				return;
			}
			
			//3.页面跳转
			var href = "user-getUser?id=${id}&pageNo=" + pageNo + "&" + $(":hidden").serialize();
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
					<div class="panel panel-profile">
						<div class="clearfix">
							<!-- LEFT COLUMN -->
							<div class="profile-left">
								<!-- PROFILE HEADER -->
								<div class="profile-header">
									<div class="overlay"></div>
									<div class="profile-main" style="padding:5px;">
										<img src="readImgAction?imgPath=img/styleImg/${styleImg }" width="90" heith="90" class="img-circle" alt="Avatar">
										<h3 class="name_self">${name }(${gender })</h3>
										<s:if test="usable">
											<span class="online-status status-available">Available</span>
										</s:if>
										<s:else>
											<style type="text/css">
												.profile-header .online-status.status-available:before {
												    background-color: #ff0000;
												}
											</style>
											<span class="online-status status-available">unAvailable</span>
										</s:else>
									</div>
									<div class="profile-stat">
										<div class="row">
											<div class="col-md-4 stat-item">
												${times }次 <span>入住</span>
											</div>
											<div class="col-md-4 stat-item">
												 <span></span>
											</div>
											<div class="col-md-4 stat-item">
												￥${totalMoney } <span>消费(元)</span>
											</div>
										</div>
									</div>
								</div>
								<!-- END PROFILE HEADER -->
								<!-- PROFILE DETAIL -->
								<div class="profile-detail">
									<div class="profile-info_self">
										<h4 class="heading">Basic Info</h4>
										<ul class="list-unstyled list-justify">
											<li>会员身份
												<span>
												<s:if test="isVip">
													<font color="#ffbc00">钻石会员</font>
												</s:if>
												<s:else>
													<font color="#41B314">普通会员</font>
												</s:else>
												</span>
											</li>
											<li>会员卡号 <span>${id }</span></li>
											<li>联系方式 <span>${telNum }</span></li>
											<li>邮件 <span>${email }</span></li>
											<li>身份证号码 <span>${idCard }</span></li>
											<li>地址 <span>${address }</span></li>
										</ul>
									</div>
									<div class="profile-info">
										<h4 class="heading">会员照片</h4>
										<div class="profile-info_headImg" style="text-align: center;">
										<img src="img/headImg/${headImg }" width="150" heigth="200"/>
										</div>
									</div>
									
								</div>
								<!-- END PROFILE DETAIL -->
							</div>
							<!-- END LEFT COLUMN -->
							<!-- RIGHT COLUMN -->
							<div class="profile-right">
								<h4 class="heading">入住信息</h4>
								<!-- AWARDS -->
								<div class="panel-body no-padding">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>单号</th>
												<th>房间号</th>
												<th>消费</th>
												<th>到达时间</th>
												<th>应离时间</th>
												<th>实离时间</th>
											</tr>
										</thead>
										<tbody>
											<s:if test="#request.userOrderPage.list != null && #request.userOrderPage.list.size() != 0">
											<c:forEach items="${userOrderPage.list}" var="order" varStatus="status">
												<tr>
													<td>${order.orderId }</td>
													<td>${order.room.id }</td>
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
												<tr>
													<td colspan="9">
														<font color="red">该用户无任何入住信息!</font>
													</td>
												</tr>
											</s:else>
										</tbody>
									</table>
									
								</div>
								<!-- END AWARDS -->
								<div class="panel-footer">
									<div class="row">
										<ul id="PageNum">
											共<font color="green" style="font-size: 15px;font:bold;"> ${userOrderPage.totalPageNumber }</font> 页&nbsp;&nbsp;当前第<font color="green" style="font-size: 15px;font:bold;"> ${userOrderPage.pageNo }</font> 页
											<li>
													<a href="user-getUser?id=${id }&pageNo=1">首页</a>
											</li>
											<li>
												<s:if test="#userOrderPage.hasPrev">
													<a href="user-getUser?id=${id }&pageNo=${userOrderPage.prevPage }">上一页</a>
												</s:if>
											</li>
											<c:forEach var="pageNum" begin="1" end = "${userOrderPage.totalPageNumber }"
														step = "1">
												<c:if test="${pageNum <= 6 }">
													<li>
														<a href="user-getUser?id=${id }&pageNo=${pageNum }">${pageNum }</a>
													</li>
												</c:if>
											</c:forEach>
											<li>
												<s:if test="#userOrderPage.hasNext">
													<a href="user-getUser?id=${id }&pageNo=${userOrderPage.nextPage }">下一页</a>
												</s:if>
											</li>
											<li>
												<a href="user-getUser?id=${id }&pageNo=${userOrderPage.totalPageNumber }">末页</a>
											</li>
											<font>转到&nbsp;&nbsp;</font><input type="text" id="pageNo" style="width: 25px;"/>
										</ul>
									</div>
								</div>
							</div>
							<!-- END RIGHT COLUMN -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
