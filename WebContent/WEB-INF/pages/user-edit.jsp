<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
	<title>修改${name }的个人信息</title>
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
					$("#add_User_OpButton").click();
				}
			});
			

			$("#styleImgFile").change(function () {
		        var $file = $(this);
		        var fileObj = $file[0];
		        var windowURL = window.URL || window.webkitURL;
		        var dataURL;
		        var $img = $("#preview1");
		
		        if (fileObj && fileObj.files && fileObj.files[0]) {
		            dataURL = windowURL.createObjectURL(fileObj.files[0]);
		            $img.attr('src', dataURL);
		        } else {
		            dataURL = $file.val();
		            var imgObj = document.getElementById("preview1");
		            // 两个坑:
		            // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
		            // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
		            imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
		            imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
		        }
    		});
			
			$("#headImgFile").change(function () {
		        var $file = $(this);
		        var fileObj = $file[0];
		        var windowURL = window.URL || window.webkitURL;
		        var dataURL;
		        var $img = $("#preview2");
		
		        if (fileObj && fileObj.files && fileObj.files[0]) {
		            dataURL = windowURL.createObjectURL(fileObj.files[0]);
		            $img.attr('src', dataURL);
		        } else {
		            dataURL = $file.val();
		            var imgObj = document.getElementById("preview2");
		            // 两个坑:
		            // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
		            // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
		            imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
		            imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
		        }
    		});
			
			$("#submit").click(function(){
				var password = $("#password").val();
				if(password == ""){
					alert("密码不能为空！");
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
					<div class="panel panel-headline" style="height: 95%">
						<div class="panel-heading_user_edit">
							<h3 class="panel-title">会员信息修改</h3>
						</div>
						<hr>
						<div class="user-edit" style="padding-left: 20%">
						<form action="user-save" enctype="multipart/form-data" method="post">
						<table class="user_edit_info">
						<tr class="for_showImg">
							<td>
								<span class="label label-primary">卡号</span>
								<input type="text" name="id" value="${model.id}" readonly="readonly">
							</td>
							<td rowspan="3" class="img">
								<img id = "preview1"  src="img/styleImg/${styleImg }"/>
								&nbsp;&nbsp;
								<input type="file" class="btn btn-default" name="styleImgFile" id="styleImgFile">
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">姓名</span>
								<input type="text" name="model.name" value="${model.name}">
							</td>
						</tr>
						<tr>
						
							<td>
								<span class="label label-primary">性别</span>
								<s:if test='#request.gender == "男" '>
									<input name="model.gender" value="男" type="radio" checked="checked">
									男
									<input name="model.gender" value="女" type="radio">
									女
								</s:if>
								<s:else>
									<input name="model.gender" value="男" type="radio">
									男
									<input name="model.gender" value="女" type="radio" checked="checked">
									女
								</s:else>
							</td>
						</tr>
						<tr class="for_showImg">
							<td>
								<span class="label label-primary">电话</span>
								<input type="text" name="model.telNum" value="${model.telNum}">
							</td>
							<td rowspan="3" class="img">
								<img id = "preview2"  src="img/headImg/${headImg }"/>
								&nbsp;&nbsp;
								<input type="file" class="btn btn-default" name="headImgFile" id="headImgFile">
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">邮箱</span>
								<input type="text" name="model.email" value="${model.email}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">身份证号</span>
								<input type="text" name="model.idCard" value="${model.idCard}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">地址</span>
								<input type="text" name="model.address" value="${model.address}">
							</td>
							<td>
								<span class="label label-primary">是否VIP</span>
								<s:if test='isVip'>
									<input name="model.isVip" value="true" type="radio" checked="checked">
									会员
									<input name="model.isVip" value="false" type="radio">
									普通
								</s:if>
								<s:else>
									<input name="model.isVip" value="true" type="radio">
									会员
									<input name="model.isVip" value="false" type="radio" checked="checked">
									普通
								</s:else>
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">密码</span>
								<input type="text" id="password" name="model.password" value="${model.password}">
							</td>
							<td>
								<span class="label label-primary">是否可用</span>
								<s:if test='#request.usable'>
									<input name="model.usable" value="true" type="radio" checked="checked">
									可用
									<input name="model.usable" value="false" type="radio">
									禁用
								</s:if>
								<s:else>
									<input name="model.usable" value="true" type="radio">
									可用
									<input name="model.usable" value="false" type="radio" checked="checked">
									禁用
								</s:else>
							</td>
						</tr>
						<tr>
							<s:if test="#session.isPreview">
							<td colspan="2" style="text-align: center;">
								<button id="submit" type="submit" class="btn btn-primary">确定</button>
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
