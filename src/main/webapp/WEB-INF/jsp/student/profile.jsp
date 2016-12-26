<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Student Profile</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Profile</a></li>
		<li class="active">User profile</li>
	</ol>
</section>
<section class="content">
	<c:if test="${not empty error}">
		<div class="alert alert-danger" role="alert">
			<strong>Ooops!</strong>&nbsp;${error}
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<c:remove var="error" />
	<c:if test="${not empty success}">
		<div class="alert alert-success" role="alert">
			&nbsp;${success}
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<c:remove var="success" />
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
					<strong><i class="fa fa-book margin-r-5"></i> Education</strong>
					<p class="text-muted">${user.student.course.subCourseName }
						from ${user.student.college.collegeName }</p>
					<hr>
					<strong><i class="fa fa-map-marker margin-r-5"></i> City</strong>
					<p class="text-muted">
						<c:out value="${user.city }"></c:out>
					</p>
				</div>
			</div>
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Admission Status</h3>
				</div>
				<div class="box-body">
					<strong><i class="fa fa-book margin-r-5"></i>Current Year</strong>
					<p class="text-muted">${user.student.currentYear}(${user.student.course.durationInYear})</p>
					<hr>
					<c:choose>
						<c:when
							test="${user.student.currentStudentApplication.type eq 'RenewAdmission'}">
							<strong class="text-success"><i
								class="fa fa-map-marker margin-r-5"></i>You have applied for
								next year</strong>
						</c:when>
						<c:when
							test="${user.student.currentYear == user.student.course.durationInYear  and user.student.currentStudentApplication.type eq 'CancelAdmission'}">
							<strong class="text-success"><i
								class="fa fa-map-marker margin-r-5"></i>You have applied for
								cancel admission</strong>
						</c:when>
						<c:when
							test="${user.student.currentYear == user.student.course.durationInYear }">
							<strong><i class="fa fa-map-marker margin-r-5"></i><a
								href="" data-target="#myModal" data-toggle="modal">Apply For
									Cancel Admission</a></strong>
						</c:when>
						<c:otherwise>
							<strong><i class="fa fa-map-marker margin-r-5"></i><a
								href="<c:url value='/student/applyForNextYear'/>">Apply For
									Next Year</a></strong>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				style="margin-top: 100px;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Cancel Admission</h4>
						</div>
						<div class="modal-body">Are you sure you want to cancel your
							Admission ?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">No</button>
							<a
								href='<c:url value="/student/applyForCancelAdmission/${user.student.studentId}" />'><button
									type="submit" class="btn btn-danger">Yes</button> </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#about" data-toggle="tab">About</a></li>
					<li><a href="#achievement" data-toggle="tab">Achivement</a></li>
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
							<li><i class="fa fa-home bg-yellow"></i>
								<div class="timeline-item">
									<h3 class="timeline-header">Parental Detail</h3>
									<div class="timeline-body">
										${user.parent.parent_firstName}
										${user.parent.parent_middleName}
										${user.parent.parent_lastName}<br>
										${user.parent.parent_mobileNumber}
									</div>
								</div></li>
							<li><i class="fa fa-briefcase bg-yellow"></i>
								<div class="timeline-item">
									<h3 class="timeline-header">Relative Detail</h3>
									<div class="timeline-body">
										${user.relative.relative_firstName}
										${user.relative.relative_middleName}
										${user.relative.relative_lastName} <br>
										${user.relative.relative_address}<br>
										${user.relative.relative_mobileNumber}
									</div>
								</div></li>
							<li><i class="fa fa-circle-o bg-gray"></i></li>
						</ul>
					</div>
					<div class="tab-pane" id="achievement"></div>
				</div>
			</div>
		</div>
	</div>
</section>