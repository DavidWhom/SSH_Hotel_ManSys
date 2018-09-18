<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- VENDOR CSS -->
<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/vendor/toastr/toastr.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
<script src="assets/vendor/jquery/jquery.min.js"></script>
<%@ include file="navbar.jsp" %>
<%@ include file="sidebar.jsp" %>
<!-- ç³»ç»æç¤º -->
<div id="toastr-demo" class="panel">
	<div class="panel-body">
		<p class="demo-button">
			<button type="button" class="btn btn-primary btn-toastr" data-context="info" data-message="1111" data-position="top-right">General Info</button>
			<button type="button" class="btn btn-success btn-toastr" data-context="success" data-message="This is success info" data-position="top-right">Success Info</button>
			<button type="button" class="btn btn-warning btn-toastr" data-context="warning" data-message="This is warning info" data-position="top-right">Warning Info</button>
			<button type="button" class="btn btn-danger btn-toastr" data-context="error" data-message="This is error info" data-position="top-right">Error Info</button>
		</p>
		<br>
	</div>
</div>
<!-- Javascript Notification needed-->
<script src="assets/vendor/toastr/toastr.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
