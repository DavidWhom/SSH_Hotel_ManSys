<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li>
					<a href="#subPages1" data-toggle="collapse" class="collapsed"><i class="lnr lnr-user"></i> <span>会员管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages1" class="collapse ">
						<ul class="nav">
							<li><a href="user-getUsers" class="">会员信息</a></li>
							<li><a href="user-addUser" class="">添加会员</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="#subPages2" data-toggle="collapse" class="collapsed"><i class="lnr lnr-inbox"></i> <span>客房管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages2" class="collapse ">
						<ul class="nav">
							<!-- <li><a href="order-getRegisterPage" class="">登记入住</a></li> -->
							<li><a href="order-getCheckOutPage" class="">会员退房</a></li>
							<li><a href="room-getRooms" class="">客房信息</a></li>
							<li><a href="room-getAddRoomPage" class="">添加客房</a></li>
							<li><a href="roomType-getRoomTypes" class="">类型信息</a></li>
							<li><a href="roomType-getAddRoomTypePage" class="">添加类型</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="#subPages3" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>订单管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages3" class="collapse ">
						<ul class="nav">
							<li><a href="order-getRecords" class="">订单信息</a></li>
							<li><a href="order-getRenewPage" class="">客房续订</a></li>
							<li><a href="order-getOverdues" class="">超期订单</a></li>
						</ul>
					</div>
				</li>
				<s:if test="#session.identity == 'sa'">
					<li><a href="admin-getAdmins" class=""><i class="lnr lnr-cog"></i> <span>权限管理</span></a></li>
				</s:if>
				<li>
					<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>账号管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse ">
						<ul class="nav">
							<li><a href="admin-getAdmin?id=${sessionScope.admin.id }" class="">个人资料</a></li>
							<li><a href="admin-getPwdPage" class="">修改密码</a></li>
							<li><a href="login-lockScreen" class="">锁屏</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	</div>
</div>