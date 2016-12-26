<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<header class="main-header">
	<!-- Logo -->
	<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>SP</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>SSPKM</b></span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<c:if test="${not empty user.student}">
					<li class="dropdown messages-menu" onclick="getMessage();"><a
						href="#" class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-envelope-o"></i>
					</a>
						<ul class="dropdown-menu">
							<li><ul class="menu" id="allMessages">
									<img alt="Loading" class="loader center-block"
										style="margin-top: 10px; display: none"
										src="<c:url value='/dist/img/ajaxloader32.gif'/>">
								</ul></li>
							<li class="footer"><a href="">See All Messages</a></li>
						</ul></li>
				</c:if>
				<!-- Notifications: style can be found in dropdown.less -->
				<li class="dropdown notifications-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-bell-o"></i> <span class="label label-warning">0</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 0 notifications</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li><a href="#"> <i class="fa fa-users text-aqua"></i>
										No Notifications
								</a></li>

							</ul>
						</li>
						<li class="footer"><a href="#">View all</a></li>
					</ul></li>
				<!-- Tasks: style can be found in dropdown.less -->

				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
						class="user-image " alt="User Image"> <span
						class="hidden-xs">${user.firstName}&nbsp;${user.lastName} </span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img
							src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
							class="img-square" alt="User Image">
							<p>${user.firstName}&nbsp;${user.lastName}</p></li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="col-xs-4 text-center">
								<a href="#"></a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#"></a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#"></a>
							</div>
						</li>
						<!-- Menu Footer-->
						<security:authorize access="authenticated">
							<li class="user-footer">
<!-- 								<div class="pull-left"> -->
<%-- 									<a href="<c:url value='/student/profile' />" --%>
<!-- 										class="btn btn-default btn-flat">Profile</a> -->
<!-- 								</div> -->
								<div class="pull-right">
									<a href="<c:url value='/j_spring_security_logout' />"
										class="btn btn-default btn-flat">Sign out</a>
								</div>
							</li>
						</security:authorize>
					</ul></li>

			</ul>
		</div>
	</nav>
</header>