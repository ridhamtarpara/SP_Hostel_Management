<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/simple-line-icons.css'/>">
<section>
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">Application Status</h3>
		</div>
		<div class="box-body">
			<div class="successbox col-md-9">
				<div class="title col-md-3">
					<b>Name:</b>
				</div>
				<div class="col-md-9">${application.applicant.user.firstName}
					${application.applicant.user.middleName }
					${application.applicant.user.lastName }</div>
				<div class="title col-md-3">
					<b>Applied for:</b>
				</div>
				<div class="col-md-9">${application.applicant.course.subCourseName}</div>
				<div class="title col-md-3">
					<b>Date:</b>
				</div>
				<div class="col-md-9">${application.date}</div>
				<div class="title col-md-3">
					<b>Status:</b>
				</div>
				<c:choose>
					<c:when test=""></c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				<div class="col-md-9">
					<c:choose>
						<c:when test="${application.status=='Approved'}">
							<span class="text-success">${application.status}. Check your mailbox for admission letter</span>
						</c:when>
						<c:otherwise>
							<span class="text-danger">${application.status}</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</section>