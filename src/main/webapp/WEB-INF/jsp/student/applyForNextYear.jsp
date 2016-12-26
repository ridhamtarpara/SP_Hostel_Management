<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Apply For Next Year</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary col-md-3">
				<div class="box-header">
					<h3 class="box-title">Personal Detail</h3>
				</div>
				<div class="col-md-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
							alt="student profile picture">
					</div>
				</div>
				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-5">Name :</th>
									<td>${user.firstName}&nbsp;${user.middleName}&nbsp;${user.lastName}</td>
								</tr>
								<tr>
									<th>Email :</th>
									<td>${user.email }</td>
								</tr>
								<tr>
									<th>Mobile Number :</th>
									<td>${user.mobileNumber}</td>
								</tr>
								<tr>
									<th>Birthdate :</th>
									<td>${user.birthDate}</td>
								</tr>
								<tr>
									<th>Bloodgroup :</th>
									<td>${user.bloodGroup}</td>
								</tr>
								<tr>
									<th>Address :</th>
									<td>${user.address1},<br />${user.address2},&nbsp;${user.city}&nbsp;-&nbsp;${user.zipCode}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="box box-primary col-md-3">
				<div class="box-header">
					<h3 class="box-title">Parental Detail</h3>
				</div>
				<div class="col-md-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${user.userId}/parent${user.appliedOn.getTime()}.jpg'/>"
							alt="student profile picture">
					</div>
				</div>
				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-5">Father Name :</th>
									<td>${user.parent.parent_firstName}&nbsp;${user.parent.parent_middleName}&nbsp;${user.parent.parent_lastName}</td>
								</tr>
								<tr>
									<th>Father Mobile Number :</th>
									<td>${user.parent.parent_mobileNumber }</td>
								</tr>
								<tr>
									<th>Father's Business :</th>
									<td>${user.parent.parent_business}</td>
								</tr>
								<tr>
									<th>Father's Income :</th>
									<td>${user.parent.parent_income}</td>
								</tr>
								<tr>
									<th>No of Family Member :</th>
									<td>${user.parent.parent_totalMembers}</td>
								</tr>
								<tr>
									<th>Native Address :</th>
									<td>${user.nativeVillage}<br />Taluka
										-&nbsp;${user.nativeTaluka}<br />Dist.
										-&nbsp;${user.nativeDistrict}<br />Pincode
										-&nbsp;${user.nativeZipCode}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="box box-primary col-md-3">
				<div class="box-header">
					<h3 class="box-title">Relative Detail</h3>
				</div>
				<div class="col-md-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${user.userId}/relative${user.appliedOn.getTime()}.jpg'/>"
							alt="student profile picture">
					</div>
				</div>
				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-5">Relative Name :</th>
									<td>${user.relative.relative_firstName}&nbsp;${user.relative.relative_middleName}&nbsp;${user.relative.relative_lastName}</td>
								</tr>
								<tr>
									<th>Relative Mobile Number :</th>
									<td>${user.relative.relative_mobileNumber }</td>
								</tr>
								<tr>
									<th>Relation :</th>
									<td>${user.relative.relative_relation}</td>
								</tr>
								<tr>
									<th>Relative Address :</th>
									<td>${user.relative.relative_address}</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
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
									<th class="col-md-5">10th Percentage :</th>
									<td>${user.result.x}</td>
								</tr>
								<tr>
									<th>12th Percentage :</th>
									<td>${user.result.xii}</td>
								</tr>
						
								<tr>
									<th>Course :</th>
									<td>${user.student.course.subCourseName}</td>
								</tr>
								<tr>
									<th>Current Year :</th>
									<td>${user.student.currentYear}</td>
								</tr>
								<tr>
									<th>College Name :</th>
									<td>${user.student.college.collegeName}</td>
								</tr>
								<tr>
									<th>College Address :</th>
									<td>${user.student.college.address}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<h4 class="error" style="text-align: center">
					You are going to apply for year <span class="text-black">${user.student.currentYear+1}</span>.Click
					Next button to proceed
				</h4>
			</div>
			<div class="box-footer">
				<a href="<c:url value='profile' />"><button
						class="btn btn-default">Back</button> </a><a
					href="<c:url value='additionalDetail' />"><button
						class="btn btn-primary pull-right">Next</button> </a>
			</div>
		</div>
	</div>
</section>