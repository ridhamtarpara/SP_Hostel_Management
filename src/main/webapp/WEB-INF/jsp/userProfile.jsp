<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>User Profile</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Profile</a></li>
		<li class="active">User profile</li>
	</ol>
</section>
<section class="content">
	<div class="row">
		<div class="col-md-3">
			<div class="box box-primary">
				<div class="box-body box-profile">
					<img class="profile-user-img img-responsive img-square"
						src="<c:url value='/dist/img/user/${searchUser.userId}/self${searchUser.appliedOn.getTime()}.jpg'/>"
						alt="User profile picture">
					<h3 class="profile-username text-center">${searchUser.firstName}
						&nbsp;${searchUser.lastName}</h3>
					<a
						href="<c:url value='/student/myMessages?userId=${searchUser.userId}'/>"><button
							class="center-block btn-primary btn">Message</button></a>
				</div>
			</div>
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">About Me</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<strong><i class="fa fa-book margin-r-5"></i>Education</strong>
					<p class="text-muted">In
						${searchUser.student.course.subCourseName } from the
						${searchUser.student.college.collegeName }</p>
					<hr>
					<strong><i class="fa fa-map-marker margin-r-5"></i>City</strong>
					<p class="text-muted">
						<c:out value="${searchUser.city }"></c:out>
					</p>
				</div>

			</div>
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Admission Status</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<strong><i class="fa fa-book margin-r-5"></i>Current Year</strong>
					<p class="text-muted">${searchUser.student.currentYear}(${searchUser.student.course.durationInYear})</p>
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
									<h3 class="timeline-header no-border">${searchUser.mobileNumber}</h3>
								</div></li>
							<li><i class="fa fa-envelope bg-aqua"></i>
								<div class="timeline-item">
									<h3 class="timeline-header no-border">${searchUser.email}</h3>
								</div></li>
							<li><i class="fa fa-home bg-yellow"></i>
								<div class="timeline-item">
									<h3 class="timeline-header">Hostel Detail</h3>
									<div class="timeline-body">
										${searchUser.student.hostel.hostelName}<br> Room No :
										${searchUser.student.room.roomNumber}
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