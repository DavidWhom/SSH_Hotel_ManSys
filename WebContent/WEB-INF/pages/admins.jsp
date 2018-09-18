<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>管理员信息</title>
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
					if(val >= 1 && val <= parseInt("${adminPage.totalPageNumber}")){
						flag = true;
					}
				}
				
				if(!flag){
					alert('输入的不是合法的页码！');
					$(this).val("");
					return;
				}
				
				//3.页面跳转
				var href = "admin-getAdmins?pageNo=" + pageNo + "&" + $(":hidden").serialize();
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
									<h3 class="panel-title">管理员信息</h3>
									<div class="right">
									</div>
								</div>
								<form action="admin-getAdmins" method="post">
										<label>管理员账号：</label>
										<input type="text" placeholder="输入账号" name="model.id"/>
										<label>姓名：</label>
										<input type="text" placeholder="请输入姓名" name="model.name"/>
										<label>状态：</label>
										<select placeholder=请选状态"" name="model.usable">
											<option value="" selected="selected"></option>
											<option value="1">可用</option>
											<option value="0">禁用</option>
										</select>
										<button type="submit" class="btn btn-primary">查找</button>
								</form>
								<div class="panel-body no-padding">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>序号</th>
												<th>管理员账号</th>
												<th>姓名</th>
												<th>昵称</th>
												<th>账号状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<s:if test="#request.adminPage.list == null || #request.adminPage.list.size() == 0">
												<tr>
													<td colspan="6">
														<font color="red">没用符合条件的管理员信息!</font>
													</td>
												</tr>
											</s:if>
											<s:else>
												<s:iterator value="#request.adminPage.list" status="status">
												<tr>
													<c:set var="rows" scope="page" value="${status.index + 1 }"/>
													<td>${status.index + 1 }</td>
													<td>${id }</td>
													<td>${name }</td>
													<td>${styleName }</td>
													<td>
														<s:if test="usable">
															<span class="label label-success">可用</span>
														</s:if>
														<s:else>
															<span class="label label-danger">禁用</span>
														</s:else>
													</td>
													<td>
														<span class="label label-default"><a href="admin-editAdmin?id=${id }" style="color: white">修改</a></span>&nbsp;
														<s:if test="!usable">
															<span class="label label-success">
																<a href="admin-chageState?id=${id }" style="color: white" class="changeState">启用</a>
																<input type="hidden" value="${name }"/>
															</span>
														</s:if>
														<s:else>
															<span class="label label-danger">
																<a href="admin-chageState?id=${id }" class="changeState" style="color: white">禁用</a>
																<input type="hidden" value="${name }"/>
															</span>
														</s:else>
													</td>
												</tr>
												</s:iterator>
											</s:else>
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<ul id="PageNum">
											共<font color="green" style="font-size: 15px;font:bold;"> ${adminPage.totalPageNumber }</font> 页&nbsp;&nbsp;当前第<font color="green" style="font-size: 15px;font:bold;"> ${adminPage.pageNo }</font> 页
											<li>
													<a href="admin-getAdmins?pageNo=1">首页</a>
											</li>
											<li>
												<s:if test="#adminPage.hasPrev">
													<a href="admin-getAdmins?pageNo=${adminPage.prevPage }">上一页</a>
												</s:if>
											</li>
											<c:forEach var="pageNum" begin="1" end = "${adminPage.totalPageNumber }"
														step = "1">
												<c:if test="${pageNum <= 6 }">
													<li>
														<a href="admin-getAdmins?pageNo=${pageNum }">${pageNum }</a>
													</li>
												</c:if>
											</c:forEach>
											<li>
												<s:if test="#adminPage.hasNext">
													<a href="admin-getAdmins?pageNo=${adminPage.nextPage }">下一页</a>
												</s:if>
											</li>
											<li>
												<a href="admin-getAdmins?pageNo=${adminPage.totalPageNumber }">末页</a>
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
	
	
	<!-- 动态改变管理员状态的 AJAX -->
	<script type="text/javascript" src="assets/scripts/changeState.js"></script>
	
	<!-- 添加系统提示插件 -->
</body>

</html>
