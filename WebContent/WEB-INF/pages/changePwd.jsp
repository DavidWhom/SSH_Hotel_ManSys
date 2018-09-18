<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${sessionScope.admin.name }修改密码</title>
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
	<link rel="stylesheet" type="text/css" href="css/css.css" />
</head>
<script type="text/javascript" src="assets/scripts/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("form").submit(function(e){
			//密码是否有输入
			var oldPwd = $("#pwd1").val();
			if(oldPwd != '${sessionScope.admin.password}'){
				alert("请输入旧密码！");
				return false;
			}
			//新密码位数限制
			var newPwd = $("#pwd2").val();
			if(newPwd.length < 6 || newPwd.length > 12){
				$("#msg2").text("密码长度不规范");
				return false;
			}
			
			//新密码二次校验是否相等
			var newPwd = $("#pwd2").val();
			var newPwdChecked = $("#pwd3").val();
			if(newPwd != newPwdChecked){
				$("#msg3").text('两次密码不一致');	
				return false;
			}
			
			//必须输入验证码
			var checkCode = $("#checkCode").val();
			if(checkCode == ""){
				alert("请输入 验证码");
				return false;
			}
		});
		$("#pwd1").change(function(){
			var userInput = $(this).val();
			$("#pwd3").val("");
			$("#pwd2").val("");
			if(userInput == '${sessionScope.admin.password}'){
				$("#pwd1").parent().find(".imga").show();
			    $("#pwd1").parent().find(".imgb").hide();
				$("#msg1").text("");
				return;
			}
			$("#msg1").text('密码错误！');
			$("#pwd1").parent().find(".imgb").show();
		    $("#pwd1").parent().find(".imga").hide();
		});
		$("#pwd2").change(function(){
			var userInput = $("#pwd1").val();
			var newPwd = $("#pwd2").val();
			var flag = true;
			if(userInput.length == 0){
				$("#msg2").text('请输入旧密码！');
				flag = false;
			}
			if(userInput == '${sessionScope.admin.password}'){
				if(newPwd.length < 6){
					flag = false;
					$("#msg2").text("密码长度低于6位");
				}
				if(newPwd.length > 12){
					flag = false;
					$("#msg2").text("密码长度高于12位");
				}
				if(flag){					
					$("#msg2").text("");
					$("#pwd2").parent().find(".imga").show();
				    $("#pwd2").parent().find(".imgb").hide();
				}else{
					$("#pwd2").parent().find(".imgb").show();
				    $("#pwd2").parent().find(".imga").hide();
				}
				return;
			}
		});
		$("#pwd3").change(function(){
			var userInput = $("#pwd1").val();
			var newPwd = $("#pwd2").val();
			var newPwdChecked = $("#pwd3").val();
			var flag = true;
			if(userInput.length == 0){
				flag = false;
				$("#msg3").text('请输入旧密码！');
			}
			if(newPwd.length == 0){
				flag = false;
				$("#msg3").text('请输入新密码');
			}
			if(userInput == '${sessionScope.admin.password}'){
				if(newPwd != newPwdChecked){
					flag = false;
					$("#msg3").text('两次密码不一致');					
				}
			}
			if(flag){					
				$("#msg3").text("");
				$("#pwd3").parent().find(".imga").show();
			    $("#pwd3").parent().find(".imgb").hide();
			}else{
				$("#pwd3").parent().find(".imgb").show();
			    $("#pwd3").parent().find(".imga").hide();
			}
			return;
		});
		$("#reset").click(function(){
			$("#pwd1").val("");
			$("#pwd2").val("");
			$("#pwd3").val("");
			$("#pwd1").parent().find(".imgb").hide();
		    $("#pwd1").parent().find(".imga").hide();
		    $("#pwd2").parent().find(".imgb").hide();
		    $("#pwd2").parent().find(".imga").hide();
		    $("#pwd3").parent().find(".imgb").hide();
		    $("#pwd3").parent().find(".imga").hide();
		    $("#msg3").text("");	
		    $("#msg2").text("");	
		    $("#msg1").text("");	
		});
		$(".codeChange").click(function(){
			var timeStamp = new Date().getTime();
			$(".code").attr("src","code-getCodeImage?"+timeStamp);
			return false;
		});
	});
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
						<div id="pageAll">
							<div class="page ">
								<!-- 修改密码页面样式 -->
								<form action="admin-changePwd?id=${sessionScope.admin.id }" method="post">
								<div class="bacen">
									<div class="bbD">
										&nbsp;&nbsp;&nbsp;&nbsp;
										UID：&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.admin.id}
										</div>
									<div class="bbD">
										&nbsp;&nbsp;&nbsp;&nbsp;
										用户名：&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.admin.name}
										</div>
									<div class="bbD">
										&nbsp;&nbsp;&nbsp;&nbsp;输入旧密码：<input type="password" class="input3"
											id="pwd1" /> <img class="imga"
											src="img/ok.png" /><img class="imgb" src="img/no.png" /><font color="red" id = "msg1"></font>
									</div>
									<div class="bbD">
										&nbsp;&nbsp;&nbsp;&nbsp;输入新密码：<input type="password" class="input3"
											id="pwd2" name="newPwd"/> <img class="imga"
											src="img/ok.png" /><img class="imgb" src="img/no.png" /><font color="red" id = "msg2"></font>
									</div>
									<div class="bbD">
										再次确认密码：<input type="password" class="input3"
											id="pwd3" name="newPwdChecked"/> <img class="imga" src="img/ok.png" /><img
											class="imgb" src="img/no.png" /><font color="red" id = "msg3"></font>
									</div>
									<div class="bbD">
										验证码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input3"
											id="checkCode" name="code" style="width: 80px;"/> <img class="imga" src="img/ok.png" /><img
											class="imgb" src="img/no.png" /><img border = 0 class="code" src="code-getCodeImage"/>&nbsp;<font color="red">${codeMsg}</font>
											<a class="codeChange" href="">看不清，换一张</a>
									</div>
									<c:if test="${ empty requestScope.codeMsg and not empty param.newPwd}">
										<div style="margin: 15px 0 0 15px"><font color="green">请牢记您的新密码:${param.newPwd }</font></div>
									</c:if>
									<div class="bbD">
										<p class="bbDP">
											<s:if test="#session.isPreview">
											<input type="submit" value="提交" class="subPwd"/>
											</s:if>
											<a class="btn_ok btn_no" id = "reset" href="#">取消</a>
										</p>
									</div>
								</div>
								</form>
								<!-- 修改密码页面样式end -->
							</div>
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
