<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Trustee Profile</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Profile</a></li>
		<li class="active">User profile</li>
	</ol>
</section>
<section class="content">
	<c:if test="${not empty illegal}">
		<div class="alert alert-danger" role="alert">
			&nbsp;<strong>No No ! </strong>Don't Do that. Access Denied
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<c:remove var="illegal" />
	<div class="row">
		<div class="col-md-3">
			<div class="box box-primary">
				<div class="box-body box-profile">
					<img class="profile-user-img img-responsive img-square"
						src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
						alt="User profile picture">
					<h3 class="profile-username text-center">${user.firstName}
						&nbsp;${user.lastName}</h3>
				</div>
			</div>
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">About Me</h3>
				</div>
				<div class="box-body">
					<strong><i class="fa fa-book margin-r-5"></i>
						Designation</strong>
					<p class="text-muted">${user.trustee.designation}</p>
					<hr>
					<strong><i class="fa fa-map-marker margin-r-5"></i> City</strong>
					<p class="text-muted">
						<c:out value="${user.city }"></c:out>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#about" data-toggle="tab">About</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="about">
						<ul class="timeline timeline-inverse">
							<li><i class="fa  fa-mobile-phone bg-blue"></i>
								<div class="timeline-item">
									<h3 class="timeline-header no-border">${user.mobileNumber}</h3>
								</div></li>
							<li><i class="fa fa-envelope bg-aqua"></i>
								<div class="timeline-item">
									<h3 class="timeline-header no-border">${user.email}</h3>
								</div></li>
							<li><i class="fa fa-home bg-yellow"></i>
								<div class="timeline-item">
									<h3 class="timeline-header">Home Address</h3>
									<div class="timeline-body">
										${user.address1}<br>${user.address2}<br>${user.city}
									</div>
								</div></li>
							<li><i class="fa fa-circle-o bg-gray"></i></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>