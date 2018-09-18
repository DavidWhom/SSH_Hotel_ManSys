<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>客房订购</title>
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
	<!-- 日历控件 -->
	<script src="assets/scripts/webCalendar.js" type="text/javascript"></script> 
</head>
<script type="text/javascript" src="assets/scripts/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#getUser").click(function(){
			var id = $(":input[name='id']").val();
			//初始化
			$("#usable").html('');
			$("#name").val('');
			$("#gender").val('');
			$("#telNum").val('');
			$("#email").val('');
			$("#idCard").val('');
			$("#address").val('');
			$("#isVip").html('')
			$("#forShowUserID").val('');
			$("#headImg").attr("src","img/headImg/default.jpg");
			
			var url = "roomType-getUser?id=" + id;
			var args = {"time" : new Date()};
			$.post(url,args,function(data){
				if(data != "0"){
					var backData = JSON.parse(data);

					if(backData.usable == "1"){
						$("#usable").html('<span class="label label-success">可用</span>')
					}else{
						alert("用户 " + backData.name + " 账号已经禁用！");
						return false;
					}
					
					if(backData.isRoomed == "0"){
						alert("用户 " + backData.name + " 账号已经入住！");
						return false;						
					}
					
					$("#name").val(backData.name);
					$("#gender").val(backData.gender);
					$("#telNum").val(backData.telNum);
					$("#email").val(backData.email);
					$("#idCard").val(backData.idCard);
					$("#address").val(backData.address);
					
					$("#headImg").attr("src","img/headImg/"+backData.headImg);
					
					if(backData.isVip == "1"){
						$("#isVip").html('<font color="#ffbc00">钻石</font>')
					}else{
						$("#isVip").html('<font color="#41B314">普通</font>')
					}
					
					$("#forShowUserID").val(backData.id);
				}else{
					alert("不存在编号为"+ id +"的用户或操作错误");
					$("#id").val('');
				}
			});
			return false;
		});
		//表单提交前验证
		$(":submit").click(function(){
			var userId = $("#forShowUserID").val();
			if(userId == ""){
				alert("尚未选择入住用户！");
				return false;	
			}
			var departureTime = $("#departureTime").val();
			if(departureTime == ""){
				alert("尚未设置离店时间！");
				return false;				
			}
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
				<div class="container-fluid bookNow">
					<h3 class="page-title">客房订购</h3>
					<div class="row">
						<div class="col-md-6" style="width: 50%;height: 100%">
							<!-- BASIC TABLE -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">会员信息</h3>
								</div>
								<div class="panel-body">
									<table class="table " ><!-- style="height: 300px" -->
										<tbody>
											<tr>
												<td><span class="label label-primary">会员卡号</span></td>
												<td colspan="3">
													<input size="10" id="id" type="text" name="id"/>
													<button type="button" id="getUser" class="btn btn-primary">查找</button>
												</td>
											</tr>
											<tr>
												<td><span class="label label-primary">姓名</span></td>
												<td style="text-align: left">
													<input id="name" type="text" name="name" readonly="readonly" size="18"/>
												</td>
												<td colspan="2" rowspan="4">
													<img src="img/headImg/default.jpg" alt="会员照片" id="headImg"
														width="110px" height="160px">
												</td>
											</tr>
											<tr>
												<td><span class="label label-primary">性别</span></td>
												<td style="text-align: left">
													<input id="gender" type="text" size="10" name="gender" readonly="readonly"/>
												</td>
											</tr>
											<tr>
												
												<td><span class="label label-primary">联系方式</span></td>
												<td>
													<input id="telNum" type="text" name="telNum" readonly="readonly" size="18"/>
												</td>
											</tr>
											<tr>
												<td><span class="label label-primary">电子邮箱</span></td>
												<td>
													<input id="email" type="text" name="email" readonly="readonly"/>
												</td>
											</tr>
											<tr>
												<td><span class="label label-primary">身份证号</span></td>
												<td>
													<input id="idCard" type="text" name="idCard" readonly="readonly" size="18"/>
												</td>
												<td><span class="label label-primary">会员身份</span></td>
												<td>
													<span id="isVip">
														
													</span>
												</td>
											</tr>
											<tr>
												<td><span class="label label-primary">联系地址</span></td>
												<td>
													<input id="address" type="text" size="10" name="address" readonly="readonly"/>
												</td>
												<td><span class="label label-primary">账号状态</span></td>
												<td>
													<span id="usable">
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- END BASIC TABLE -->
						</div>
						<div class="col-md-6" style="width: 50%">
							<!-- TABLE NO PADDING -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">客房信息-${room.roomType.roomTypeName }</h3>
								</div>
								<div class="panel-body no-padding">
									<form action="order-bookNow" method="post">
									<table class="table">
										<tbody>
											<tr>
												<td><span class="label label-primary">房间编号</span></td>
												<td>
													<input type="text" name="room.id" value="${room.id }" readonly="readonly"/>
												</td>
												<td><span class="label label-primary">房间名</span></td>
												<td>${room.roomName }</td>
											</tr>
											<tr>
												<td><span class="label label-primary">可住人数</span></td>
												<td>${room.roomType.peoples }</td>
												<td><span class="label label-primary">定价</span></td>
												<td>￥
													<input type="text" name="price" size="5" value="${room.roomType.price }"/>
												</td>
											</tr>
											<tr>
												<td><span class="label label-primary">上网</span></td>
												<td>${room.roomType.net_info }</td>
												<td><span class="label label-primary">早餐</span></td>
												<td>${room.roomType.bef_info }</td>
											</tr>
											<tr style="height: 10%;overflow: hidden;">
												<td><span class="label label-primary">预离时间</span></td>
												<td>
													<input type="text" placeholder="点击设置时间" id="departureTime" name="departureTime"
														 value="" maxlength="100" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" readonly="readonly" 
														 style="width:160px;cursor:pointer;" />
												</td>
												<td><span class="label label-primary">其他</span></td>
												<td>
													<textarea readonly="readonly" name="other_info" id="other_info" rows="4" cols="13">
														${room.roomType.other_info }
													</textarea>
												</td>
											</tr>
											<tr>
												<td><span class="label label-primary">有无车位</span></td>
												<td>
													<s:if test="park_info">
														<span class="label label-success">有车位</span>
													</s:if>
													<s:else>
														<span class="label label-danger">无车位</span>
													</s:else>
												</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><span class="label label-primary">会员ID</span></td>
												<td>
													<input type="text" name="user.id" id="forShowUserID" readonly="readonly"/>
												</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<s:if test="#session.isPreview">
												<td colspan="4" style="text-align: center;">
													<button type="submit" class="btn btn-primary">确定</button>
												</td>
												</s:if>
											</tr>
										</tbody>
									</table>
									</form>
								</div>
							</div>
							<!-- END TABLE NO PADDING -->
						</div>
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
