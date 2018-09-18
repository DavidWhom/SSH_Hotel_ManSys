<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
	<title>添加客房类型</title>
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
			
			$("#submit").click(function(){
				var name = $("#name").val();
				var price = $("#price").val();
				var net_info = $("#net_info").val();
				var peoples = $("#peoples").val();
				var bef_info = $("#bef_info").val();
				var park_info = $("#park_info").val();
				
				if(name == "" || price == "" || net_info == "" || peoples == ""
					|| bef_info == "" || park_info == ""){
					alert("信息不完整");
					return false;
				}
				
				var reg = /^\d+$/g;
				if(!reg.test(price)){
					alert("定价错误！");
					$("#price").val('')
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
							<h3 class="panel-title">类型信息添加</h3>
						</div>
						<hr>
						<div class="user-edit" style="padding-left: 20%">
						<form action="roomType-saveRoomType" enctype="multipart/form-data" method="post">
						<table class="user_edit_info">
						<tr>
							<td>
								<span class="label label-primary">类型编号</span>
								<input type="text" value="${RTNum }" readonly="readonly">
							</td>
							<td style="text-align: right;">
								<span class="label label-primary">类型名称</span>
								<input type="text" id="name" name="model.roomTypeName">
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">可住人数</span>
								<input type="text" id="peoples" name="model.peoples" list="peopleChoose"/>
								<datalist id="peopleChoose" style="display:none;">
									<option>单人间</option>
									<option>双人间</option>
									<option>四人间</option>
								</datalist>
							</td>
							<td style="text-align: right;">
								<span class="label label-primary">定价</span>
								<input type="text" id="price" name="model.price"/>
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">上网</span>
								<input type="text" id="net_info" value="无线/宽带" name="model.net_info" list="netChoose"/>
								<datalist id="netChoose" style="display:none;">
									<option>无线/宽带</option>
									<option>不能上网</option>
								</datalist>
							</td>
							<td style="text-align: right;">
								<span class="label label-primary">早餐</span>
								<input type="text" id="bef_info" name="model.bef_info" list="befChoose"/>
								<datalist id="befChoose" style="display:none;">
									<option>无早</option>
									<option>双早</option>
								</datalist>
							</td>
						</tr>
						<tr>
							<td>
								<span class="label label-primary">车位</span>
								<input type="text" id="park_info" name="model.park_info" list="parkChoose"/>
								<datalist id="parkChoose" style="display:none;">
									<option>有车位</option>
									<option>无车位</option>
								</datalist>
							</td>
							<td style="text-align: right;">
								<span class="label label-primary">其他</span>
								<input type="text" id="other_info" name="model.other_info"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="label label-primary">房间图片</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<!-- 多图上传支持预览 -->
								<div class="section">
								    <div class="article">
								    <div class="item">
								        <img class="addImg" onclick="clickImg(this);" src="img/addImg.png" />
								        <input name="roomTypeImages" type="file" class="upload_input" onchange="change(this)"/>
								        <div class="preBlock">
								            <img class="preview" src="img/roomImg/${imgs[0]}" id="preview" alt="" name="pic" width="90" height="90" />
								        </div>
								        <img class="delete" onclick="deleteImg(this)" src="img/delete.png"/>
								    </div>
								    
								    <div class="item">
								        <img class="addImg" onclick="clickImg(this);" src="img/addImg.png" />
								        <input name="roomTypeImages" type="file" class="upload_input" onchange="change(this)"/>
								        <div class="preBlock">
								            <img class="preview" id="preview" src="img/roomImg/${imgs[1]}" alt="" name="pic" width="90" height="90" />
								        </div>
								        <img class="delete" onclick="deleteImg(this)" src="img/delete.png"/>
								    </div>
								    
								    <div class="item">
								        <img class="addImg" onclick="clickImg(this);" src="img/addImg.png" />
								        <input name="roomTypeImages" type="file" class="upload_input" onchange="change(this)"/>
								        <div class="preBlock">
								            <img class="preview" id="preview" src="img/roomImg/${imgs[2]}" alt="" name="pic" width="90" height="90" />
								        </div>
								        <img class="delete" onclick="deleteImg(this)" src="img/delete.png"/>
								    </div>
								    
								    <div class="item">
								        <img class="addImg" onclick="clickImg(this);" src="img/addImg.png" />
								        <input name="roomTypeImages" type="file" class="upload_input" onchange="change(this)"/>
								        <div class="preBlock">
								            <img class="preview" src="img/roomImg/${imgs[3]}" id="preview" alt="" name="pic" width="90" height="90" />
								        </div>
								        <img class="delete" onclick="deleteImg(this)" src="img/delete.png"/>
								    </div>
								    
								    <div class="item">
								        <img class="addImg" onclick="clickImg(this);" src="img/addImg.png" />
								        <input name="roomTypeImages" type="file" class="upload_input" onchange="change(this)"/>
								        <div class="preBlock">
								            <img class="preview" src="img/roomImg/${imgs[4]}" id="preview" alt="" name="pic" width="90" height="90" />
								        </div>
								        <img class="delete" onclick="deleteImg(this)" src="img/delete.png"/>
								    </div>
								    
								    <div style="clear: left;"></div>
								  </div>
								</div>
							</td>
						</tr>
						<tr>
							<s:if test="#session.isPreview">
							<td colspan="2" style="text-align: center;">
									<button type="submit" id="submit" class="btn btn-primary">确定</button>
									<input type="reset" class="btn btn-primary" value="取消"/>
							</td>
							</s:if>
						</tr>
						</table>
						</form>
						</div>
						<script type="text/javascript" src="assets/scripts/imgFileupload.js"></script>
					</div>
					<!-- END OVERVIEW -->
					
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
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
