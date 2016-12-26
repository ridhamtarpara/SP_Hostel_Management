<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/simple-line-icons.css'/>">
<section>
	<form:form modelAttribute="applicantApplication"
		class="form-horizontal">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">About Admission</h3>
			</div>
			<div class="box-body">
				<p>Your admission has been confirmed.You need to admit your
					admission letter with followiung documents within 10 days at
					Saurastra Patel Kelavani Mandal Hostel.</p>
				<ul style="list-style-type: circle;">
					<li>Hostel Admission Letter</li>
					<li>All Past Results(10<sup>th</sup>,12<sup>th</sup>,Degree
						results) whichever is applicable
					</li>
					<li>Leaving Certificate</li>
					<li>College Admission Letter and Fee Receipt</li>
					<li>Two Passport Size Photographs</li>
				</ul>
				<div class="alert alert-danger" role="alert">
					Keep margin 0 or none in print settings to take proper print in letter size.
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
			<div class="box-footer row">
				<a href="<c:url value='/printFinalAdmissionLetter'/>"
					target="_blank" class="btn btn-default center-block"><i
					class="fa fa-print"></i> Print Hostel Admission Letter</a>
			</div>
		</div>
	</form:form>
</section>