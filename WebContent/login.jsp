<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
	<title>基于SSH的酒店管理系统</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
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
		$("#preview").click(function(){
			alert("预览账号：9527\n密码:test\n注意：此账号不具备进行涉及修改数据表的相关操作及其余核心功能");
		});
		
		$("#submit").click(function(){
			var id = $("#sign-id").val();
			if(id.trim() == ""){
				alert("账号不能为空！");
				return false;
			}
			var password = $("#sign-password").val();
			if(password.trim() == ""){
				alert("密码不能为空");
				return false;
			}
		});
	});
</script>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center"><img src="assets/img/logo-dark.png" alt="Klorofil Logo"></div>
								<br/>
								<p class="lead">伊恩酒店欢迎您</p>
							</div>
							<form class="form-auth-small" action="login-doLogin" method="post">
								<div class="form-group">
									<label for="signin-email" id="id" class="control-label sr-only">账号</label>
									<input type="text" name="model.id" class="form-control" id="sign-id" placeholder="请输入账号">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">密码</label>
									<input type="password" name="model.password" class="form-control" id="sign-password" placeholder="请输入密码">
								</div>
								<div class="bottom" style="height: 15px;">
									<font color="red">${msg }</font>
								</div>
								<div class="bottom">
									<span class="helper-text"><i class="fa fa-search"></i> <a href="#" id="preview">获取预览账号</a></span>
								</div>
								<button type="submit" id="submit" class="btn btn-primary btn-lg btn-block">登录</button>
							</form>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">尊贵享受，尽在伊恩</h1>
							<p>by Ian</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container-fluid">
			<p class="copyright">《基于SSH的酒店信息管理系统——胡佳传》Copyright &copy; 2018.IanKeri伊恩凯丽 All rights reserved. <a href="##" title="伊恩酒店管理系统">获取项目github源码</a></p>
		</div>
	</footer>
	<!-- END WRAPPER -->
</body>

</html>
