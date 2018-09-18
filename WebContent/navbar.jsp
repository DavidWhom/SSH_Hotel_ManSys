<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-fixed-top">
	<%-- <!-- 设置是否收起功能栏目 -->
	<c:if test="${sessionScope.flag == null}">
		<s:set var="flag" value="0" scope="session"></s:set>
	</c:if>
	<!-- 是否扩张 -->
	<script type="text/javascript">
		$(function(){
			$(document).ready(function(){
				var flag = '${sessionScope.flag}';
				var flagInt = parseInt(flag);
				alert("ready"+flag);
				if(flagInt % 2 != 0){
					alert("readyClick");
					$(".btn-toggle-fullwidth").click();
				}
			});
			
			$(".btn-toggle-fullwidth").click(function(){
				var flag = '${sessionScope.flag}';
				flag = parseInt(flag);
				if(flagInt % 2 != 0){
					alert("selfChange");
					${sessionScope.flag = sessionScope.flag + 1}
				}
				alert("click:" + flag);
			})
		});
	</script> --%>
	<div class="brand">
		<a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
	</div>
	<div class="container-fluid">
		<div class="navbar-btn">
			<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
		</div>
		<div class="navbar-btn navbar-btn-right">
			<a class="btn btn-success update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="新建工作区" target="_blank"><i class="fa fa-rocket"></i> <span>新建工作区</span></a>
		</div>
		<div id="navbar-menu">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="img/adminImg/${sessionScope.admin.imgPath }" class="img-circle" alt="${sessionScope.admin.name }"> <span>${sessionScope.admin.name }</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="admin-getAdmin?id=${sessionScope.admin.id }"><i class="lnr lnr-user"></i> <span>个人资料</span></a></li>
						<li><a href="admin-getPwdPage"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
						<li><a href="login-lockScreen"><i class="lnr lnr-inbox"></i> <span>锁屏</span></a></li>
						<li><a href="login-doLogout"><i class="lnr lnr-exit"></i> <span>退出</span></a></li>
					</ul>
				</li>
				<!-- <li>
					<a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
				</li> -->
			</ul>
		</div>
	</div>
</nav>