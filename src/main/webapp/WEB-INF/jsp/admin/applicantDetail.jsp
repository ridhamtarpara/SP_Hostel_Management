<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content-header">
	<h1>Applicant Detail</h1>
</section>



<!-- Main content -->
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
	<div class="row">
		<div class="col-md-12">

			<!-- Profile Image -->
			<div class="box box-primary col-md-3">
				<div class="box-header">
					<h3 class="box-title">Personal Detail</h3>
				</div>
				<div class="col-md-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${applicant.user.userId}/self${applicant.user.appliedOn.getTime()}.jpg'/>"
							alt="Applicant profile picture">
					</div>
				</div>

				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-4">Name :</th>
									<td class="col-md-8">${applicant.user.firstName}&nbsp;${applicant.user.middleName}&nbsp;${applicant.user.lastName}</td>
								</tr>
								<tr>
									<th class="col-md-4">Email :</th>
									<td class="col-md-8">${applicant.user.email }</td>
								</tr>
								<tr>
									<th class="col-md-4">Mobile Number :</th>
									<td class="col-md-8">${applicant.user.mobileNumber}</td>
								</tr>
								<tr>
									<th class="col-md-4">Birthdate :</th>
									<td class="col-md-8">${applicant.user.birthDate}</td>
								</tr>
								<tr>
									<th class="col-md-4">Bloodgroup :</th>
									<td class="col-md-8">${applicant.user.bloodGroup}</td>
								</tr>
								<tr>
									<th class="col-md-4">Address :</th>
									<td class="col-md-8">${applicant.user.address1},<br />${applicant.user.address2},&nbsp;${applicant.user.city}&nbsp;-&nbsp;${applicant.user.zipCode}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- /.box-body -->
			</div>
			<!-- /.box -->
			<div class="box box-primary col-md-3">
				<div class="box-header">
					<h3 class="box-title">Parental Detail</h3>
				</div>
				<div class="col-md-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${applicant.user.userId}/parent${applicant.user.appliedOn.getTime()}.jpg'/>"
							alt="Applicant profile picture">
					</div>
				</div>

				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-4">Father Name :</th>
									<td class="col-md-8">${applicant.user.parent.parent_firstName}&nbsp;${applicant.user.parent.parent_middleName}&nbsp;${applicant.user.parent.parent_lastName}</td>
								</tr>
								<tr>
									<th class="col-md-4">Father Mobile Number :</th>
									<td class="col-md-8">${applicant.user.parent.parent_mobileNumber }</td>
								</tr>
								<tr>
									<th class="col-md-4">Father's Business :</th>
									<td class="col-md-8">${applicant.user.parent.parent_business}</td>
								</tr>
								<tr>
									<th class="col-md-4">Father's Income :</th>
									<td class="col-md-8">${applicant.user.parent.parent_income}</td>
								</tr>
								<tr>
									<th class="col-md-4">No of Family Member :</th>
									<td class="col-md-8">${applicant.user.parent.parent_totalMembers}</td>
								</tr>
								<tr>
									<th class="col-md-4">Native Address :</th>
									<td class="col-md-8">${applicant.user.nativeVillage}<br />Taluka
										-&nbsp;${applicant.user.nativeTaluka}<br />Dist.
										-&nbsp;${applicant.user.nativeDistrict}<br />Pincode
										-&nbsp;${applicant.user.nativeZipCode}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<div class="box box-primary col-md-3">
				<div class="box-header">
					<h3 class="box-title">Relative Detail</h3>
				</div>
				<div class="col-md-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${applicant.user.userId}/relative${applicant.user.appliedOn.getTime()}.jpg'/>"
							alt="Applicant profile picture">
					</div>
				</div>

				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-4">Relative Name :</th>
									<td class="col-md-8">${applicant.user.relative.relative_firstName}&nbsp;${applicant.user.relative.relative_middleName}&nbsp;${applicant.user.relative.relative_lastName}</td>
								</tr>
								<tr>
									<th class="col-md-4">Relative Mobile Number :</th>
									<td class="col-md-8">${applicant.user.relative.relative_mobileNumber }</td>
								</tr>
								<tr>
									<th class="col-md-4">Relation :</th>
									<td class="col-md-8">${applicant.user.relative.relative_relation}</td>
								</tr>
								<tr>
									<th class="col-md-4">Relative Address :</th>
									<td class="col-md-8">${applicant.user.relative.relative_address}</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<div class="box box-primary col-md-3">
				<div class="box-header">
					<h3 class="box-title">Educational Detail</h3>
				</div>
				<div class="col-md-3">
					<div class="box-body box-profile"></div>
				</div>

				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-4">10th Percentage :</th>
									<td class="col-md-8">${applicant.user.result.x}</td>
								</tr>
								<tr>
									<th class="col-md-4">12th Percentage :</th>
									<td class="col-md-8">${applicant.user.result.xii}</td>
								</tr>
								<tr>
									<th class="col-md-4">Course :</th>
									<td class="col-md-8">${applicant.course.subCourseName}</td>
								</tr>
								<tr>
									<th class="col-md-4">College Name :</th>
									<td class="col-md-8">${applicant.college.collegeName}</td>
								</tr>
								<tr>
									<th class="col-md-4">College Address :</th>
									<td class="col-md-8">${applicant.college.address}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<div class="box-footer">
				<a href="<c:url value='approveAdmission' />"><button
						class="btn btn-default">Back</button> </a><a
					href="<c:url value='approveAdmission?id=${applicant.applicantId}' />"><button
						class="btn btn-primary pull-right">Approve</button> </a>
			</div>
		</div>
		<!-- /.col -->


		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>