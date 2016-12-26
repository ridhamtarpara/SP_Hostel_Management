<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/simple-line-icons.css'/>">
<section>
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">Registration Successful</h3>
		</div>
		<div class="box-body">
			<div class="successbox col-md-8">
				<div class="title col-md-4">
					<b>Name:</b>
				</div>
				<div class="col-md-8">${application.applicant.user.firstName}
					${application.applicant.user.middleName}
					${application.applicant.user.lastName}</div>

				<div class="title col-md-4">
					<b>Applied for:</b>
				</div>
				<div class="col-md-8">${application.applicant.course.subCourseName}</div>
				<div class="title col-md-4">
					<b>Date:</b>
				</div>
				<div class="col-md-8">${application.date}</div>
				<div class="title col-md-12">
					<h3>
						Your Application ID is <i class="text-red">${application.applicationId}</i>.
					</h3>
					<h5 class="error">We will send you email with admission letter
						and further instruction when our administrators approve your
						application.</h5>
					<h5>You can use application ID to check your admission status
						in register link.</h5>
				</div>
			</div>
		</div>
	</div>
</section>