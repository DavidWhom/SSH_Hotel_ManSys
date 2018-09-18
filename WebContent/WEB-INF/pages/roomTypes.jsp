<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>类型信息</title>
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
					if(val >= 1 && val <= parseInt("${roomTypePage.totalPageNumber}")){
						flag = true;
					}
				}
				
				if(!flag){
					alert('输入的不是合法的页码！');
					$(this).val("");
					return;
				}
				
				//3.页面跳转
				var href = "roomType-getRoomTypes?pageNo=" + pageNo + "&" + $(":hidden").serialize();
				window.location.href = href;
			});
			
			$(".booknow").click(function(){
				var roomId = $(this).next(":input").val();
				var args = {"time":new Date()}
				//ajax校验是否有房间剩余
				$.post(url,args,function(data){
					if(data == "1"){
						alert("有房间剩余！");
					}else{
						alert();
					}
				})
				return false;
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
									<h3 class="panel-title">类型信息</h3>
									<div class="right">
									</div>
								</div>
								<form action="roomType-getRoomTypes" method="post">
										<label>类型编号：</label>
										<input type="text" placeholder="输入类型编号" name="model.id"/>
										<label>可住人数：</label>
										<select name="model.peoples">
											<option value=""></option>
											<s:iterator var="people" value="#request.peoples">
												<option value="${people}">${people }</option>
											</s:iterator>
										</select>
										<button type="submit" class="btn btn-primary">查找</button>
								</form> 
								<div class="panel-body no-padding">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>序号</th>
												<th>类型编号</th>
												<th>类型名称</th>
												<th>可住人数</th>
												<th>定价</th>
												<th>上网</th>
												<th>早餐</th>
												<th>车位</th>
												<th>历史订购</th>
												<th>剩余</th>
												<td>操作</td>
											</tr>
										</thead>
										<tbody>
											<s:if test="#request.roomTypePage.list == null || #request.roomTypePage.list.size() == 0">
												<tr>
													<td colspan="11">
														<font color="red">没用任何客房信息!</font>
													</td>
												</tr>
											</s:if>
											<s:else>
												
											</s:else>
											<s:iterator var="room" value="#request.roomTypePage.list" status="status">
											<tr>
												<c:set var="rows" scope="page" value="${status.index + 1 }"/>
												<td>${status.index + 1 }</td>
												<td>${id }</td>
												<td>
													<a href="roomType-getRoomType?pageNo=${roomTypePage.pageNo }&id=${id}">
													${roomTypeName }</a>
												</td>
												<td>${room.peoples }</td>
												<td>￥${price }</td>
												<td>${net_info }</td>
												<td>${bef_info }</td>
												<td>
													<s:if test="park_info">
														<span class="label label-success">有车位</span>
													</s:if>
													<s:else>
														<span class="label label-danger">无车位</span>
													</s:else>
												</td>
												<td>${times } 次</td>
												<td>${roomLeaves[id] } / ${roomAll[id] } 间</td>
												<td>
													<span class="label label-default"><a href="roomType-editRoomType?id=${id }" style="color: white">修改</a></span>&nbsp;&nbsp;
													<s:if test="#request.roomLeaves[id] > 0">
														<span class="label label-primary">
															<a href="roomType-getRTRooms?id=${id }" class="booknow" style="color: #FFF">订购</a>
															<input type="hidden" value="${id }"/>
														</span>
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
											共<font color="green" style="font-size: 15px;font:bold;"> ${roomTypePage.totalPageNumber }</font> 页&nbsp;&nbsp;当前第<font color="green" style="font-size: 15px;font:bold;"> ${roomTypePage.pageNo }</font> 页
											<li>
													<a href="roomType-getRoomTypes?pageNo=1">首页</a>
											</li>
											<li>
												<s:if test="#roomTypePage.hasPrev">
													<a href="roomType-getRoomTypes?pageNo=${roomTypePage.prevPage }">上一页</a>
												</s:if>
											</li>
											<c:forEach var="pageNum" begin="1" end = "${roomTypePage.totalPageNumber }"
														step = "1">
												<c:if test="${pageNum <= 6 }">
													<li>
														<a href="roomType-getRoomTypes?pageNo=${pageNum }">${pageNum }</a>
													</li>
												</c:if>
											</c:forEach>
											<li>
												<s:if test="#roomTypePage.hasNext">
													<a href="roomType-getRoomTypess?pageNo=${roomTypePage.nextPage }">下一页</a>
												</s:if>
											</li>
											<li>
												<a href="roomType-getRoomTypes?pageNo=${roomTypePage.totalPageNumber }">末页</a>
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
	<!-- 动态改变用户状态的 AJAX -->
	<script type="text/javascript" src="assets/scripts/changeState.js"></script>
</body>

</html>
