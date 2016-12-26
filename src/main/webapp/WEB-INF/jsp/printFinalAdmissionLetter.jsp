<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content applicantletter">
	<div class="row">
		<div class="col-xs-2">
			<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>" height="75"
				width="75">
			<p style="margin-left: 22px; position: relative; font-weight: 500;">Id:${application.applicationId}</p>
		</div>
		<div class="col-xs-10">
			<h4 style="margin: 0; text-align: center; position: relative;">SHREE
				SAURASHTRA PATEL KELAVANI MANDAL</h4>

			<c:choose>
				<c:when test="${application.applicant.user.gender=='MALE'}">
					<h4 style="margin: 3px; text-align: center; position: relative;">Boy's
						Hostel</h4>
					<p
						style="margin: 0; text-align: center; position: relative; font-weight: 500;">Oppo.
						Pankaj Vidhyalaya,Near BSNL Office,Gulbai
						Tekra,EllisBridge,Ahmedabad,Gujarat 380006.</p>
				</c:when>
				<c:otherwise>
					<h4 style="margin: 3px; text-align: center; position: relative;">Girl's
						Hostel</h4>
					<p
						style="margin: 0; text-align: center; position: relative; font-weight: 500;">Near.Dhoribhai
						Park,B/S. BhagirathPark,Memnagar,Naranpura,Ahmedabad,Gujarat
						380013</p>
				</c:otherwise>

			</c:choose>
			<p
				style="margin: 0; text-align: center; position: relative; font-weight: 500;">Phone
				: 079-26302341, 26307099 Email : sphostel@gmail.com</p>
			<p style="text-align: center; position: relative; font-weight: bold;">Admission
				Letter</p>

		</div>
		<div class="col-xs-12">
			<div class="box box-primary col-xs-3">
				<div class="col-xs-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${application.applicant.user.userId}/self${application.applicant.user.appliedOn.getTime()}.jpg'/>"
							alt="application.applicant profile picture">
					</div>
				</div>
				<div class="col-xs-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-xs-5">Name :</th>
									<td class="col-xs-7">${application.applicant.user.firstName}&nbsp;${application.applicant.user.middleName}&nbsp;${application.applicant.user.lastName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Email :</th>
									<td class="col-xs-7">${application.applicant.user.email }</td>
								</tr>
								<tr>
									<th class="col-xs-5">Mobile Number :</th>
									<td class="col-xs-7">${application.applicant.user.mobileNumber}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Birthdate :</th>
									<td class="col-xs-7">${application.applicant.user.birthDate}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Bloodgroup :</th>
									<td class="col-xs-7">${application.applicant.user.bloodGroup}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Address :</th>
									<td class="col-xs-7">${application.applicant.user.address1},<br />${application.applicant.user.address2},<br />${application.applicant.user.city}&nbsp;-&nbsp;${application.applicant.user.zipCode}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="box box-primary col-xs-3">

				<div class="col-xs-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${application.applicant.user.userId}/parent${application.applicant.user.appliedOn.getTime()}.jpg'/>"
							alt="application.applicant profile picture">
					</div>
				</div>
				<div class="col-xs-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-xs-5">Father Name :</th>
									<td class="col-xs-7">${application.applicant.user.parent.parent_firstName}&nbsp;${application.applicant.user.parent.parent_middleName}&nbsp;${application.applicant.user.parent.parent_lastName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Father Mobile Number :</th>
									<td class="col-xs-7">${application.applicant.user.parent.parent_mobileNumber }</td>
								</tr>
								<tr>
									<th class="col-xs-5">Father's Business :</th>
									<td class="col-xs-7">${application.applicant.user.parent.parent_business}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Father's Income :</th>
									<td class="col-xs-7">${application.applicant.user.parent.parent_income}</td>
								</tr>
								<tr>
									<th class="col-xs-5">No of Family Member :</th>
									<td class="col-xs-7">${application.applicant.user.parent.parent_totalMembers}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Native Address :</th>
									<td class="col-xs-7">${application.applicant.user.nativeVillage},${application.applicant.user.nativeTaluka}<br />Dist.
										-&nbsp;${application.applicant.user.nativeDistrict}-&nbsp;${application.applicant.user.nativeZipCode}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="box box-primary col-xs-3">

				<div class="col-xs-3">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-square"
							src="<c:url value='/dist/img/user/${application.applicant.user.userId}/relative${application.applicant.user.appliedOn.getTime()}.jpg'/>"
							alt="application.applicant profile picture">
					</div>
				</div>
				<div class="col-xs-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-xs-5">Relative Name :</th>
									<td class="col-xs-7">${application.applicant.user.relative.relative_firstName}&nbsp;${application.applicant.user.relative.relative_middleName}&nbsp;${application.applicant.user.relative.relative_lastName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Relative Mobile Number :</th>
									<td class="col-xs-7">${application.applicant.user.relative.relative_mobileNumber }</td>
								</tr>
								<tr>
									<th class="col-xs-5">Relation :</th>
									<td class="col-xs-7">${application.applicant.user.relative.relative_relation}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Relative Address :</th>
									<td class="col-xs-7">${application.applicant.user.relative.relative_address}</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="box box-primary col-xs-3">

				<div class="col-xs-3">
					<div class="box-body box-profile"></div>
				</div>
				<div class="col-xs-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-xs-5">10th Percentage :</th>
									<td class="col-xs-7">${application.applicant.user.result.x}</td>
								</tr>
								<tr>
									<th class="col-x`s-5">12th Percentage :</th>
									<td class="col-xs-7">${application.applicant.user.result.xii}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Course :</th>
									<td class="col-xs-7">${application.applicant.course.subCourseName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">College Name :</th>
									<td class="col-xs-7">${application.applicant.college.collegeName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">College Address :</th>
									<td class="col-xs-7">${application.applicant.college.address}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>