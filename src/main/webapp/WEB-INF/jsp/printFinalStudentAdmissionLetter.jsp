<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content studentletter">
	<div class="row">
		<div class="col-xs-2">
			<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>" height="75"
				width="75">
			<p style="margin-left: 22px; position: relative; font-weight: 500;">Id:${application.studentApplicationId}</p>
		</div>
		<div class="col-xs-10">
			<h4 style="margin: 0; text-align: center; position: relative;">SHREE
				SAURASHTRA PATEL KELAVANI MANDAL</h4>

			<c:choose>
				<c:when test="${application.student.user.gender=='MALE'}">
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
							src="<c:url value='/dist/img/user/${application.student.user.userId}/self${application.student.user.appliedOn.getTime()}.jpg'/>"
							alt="application.student profile picture">
					</div>
				</div>
				<div class="col-xs-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-xs-5">Name :</th>
									<td class="col-xs-7">${application.student.user.firstName}&nbsp;${application.student.user.middleName}&nbsp;${application.student.user.lastName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Email :</th>
									<td class="col-xs-7">${application.student.user.email }</td>
								</tr>
								<tr>
									<th class="col-xs-5">Mobile Number :</th>
									<td class="col-xs-7">${application.student.user.mobileNumber}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Birthdate :</th>
									<td class="col-xs-7">${application.student.user.birthDate}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Bloodgroup :</th>
									<td class="col-xs-7">${application.student.user.bloodGroup}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Address :</th>
									<td class="col-xs-7">${application.student.user.address1},<br />${application.student.user.address2},<br />${application.student.user.city}&nbsp;-&nbsp;${application.student.user.zipCode}</td>
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
							src="<c:url value='/dist/img/user/${application.student.user.userId}/parent${application.student.user.appliedOn.getTime()}.jpg'/>"
							alt="application.student profile picture">
					</div>
				</div>
				<div class="col-xs-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-xs-5">Father Name :</th>
									<td class="col-xs-7">${application.student.user.parent.parent_firstName}&nbsp;${application.student.user.parent.parent_middleName}&nbsp;${application.student.user.parent.parent_lastName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Father Mobile Number :</th>
									<td class="col-xs-7">${application.student.user.parent.parent_mobileNumber }</td>
								</tr>
								<tr>
									<th class="col-xs-5">Father's Business :</th>
									<td class="col-xs-7">${application.student.user.parent.parent_business}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Father's Income :</th>
									<td class="col-xs-7">${application.student.user.parent.parent_income}</td>
								</tr>
								<tr>
									<th class="col-xs-5">No of Family Member :</th>
									<td class="col-xs-7">${application.student.user.parent.parent_totalMembers}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Native Address :</th>
									<td class="col-xs-7">${application.student.user.nativeVillage},${application.student.user.nativeTaluka}<br />Dist.
										-&nbsp;${application.student.user.nativeDistrict}-&nbsp;${application.student.user.nativeZipCode}
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
							src="<c:url value='/dist/img/user/${application.student.user.userId}/relative${application.student.user.appliedOn.getTime()}.jpg'/>"
							alt="application.student profile picture">
					</div>
				</div>
				<div class="col-xs-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-xs-5">Relative Name :</th>
									<td class="col-xs-7">${application.student.user.relative.relative_firstName}&nbsp;${application.student.user.relative.relative_middleName}&nbsp;${application.student.user.relative.relative_lastName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Relative Mobile Number :</th>
									<td class="col-xs-7">${application.student.user.relative.relative_mobileNumber }</td>
								</tr>
								<tr>
									<th class="col-xs-5">Relation :</th>
									<td class="col-xs-7">${application.student.user.relative.relative_relation}</td>
								</tr>
								<tr>
									<th class="col-xs-5">Relative Address :</th>
									<td class="col-xs-7">${application.student.user.relative.relative_address}</td>
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
									<th class="col-xs-5">Current Year</th>
									<td class="col-xs-7">${application.student.currentYear}</td>
								</tr>
								<tr>
									<th class="col-x`s-5">12th Percentage :</th>
									<td class="col-xs-7">${application.student.user.result.xii}</td>
								</tr>
								
								<tr>
									<th>Last Result :</th>
									<td><c:choose>
											<c:when test="${application.student.currentYear==1}">
											Semester 1 : ${application.student.user.result.sem1}<br><c:if test="${application.student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 2 : ${application.student.user.result.sem2}
											</c:when>
											<c:when test="${application.student.currentYear==2}">
											Semester 3 : ${application.student.user.result.sem3}<br><c:if test="${application.student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 4 : ${application.student.user.result.sem4}
											</c:when>
											<c:when test="${application.student.currentYear==3}">
											Semester 5 : ${application.student.user.result.sem5}<br><c:if test="${application.student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 6 : ${application.student.user.result.sem6}
											</c:when>
											<c:when test="${application.student.currentYear==4}">
											Semester 7 : ${application.student.user.result.sem7}<br><c:if test="${application.student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 8 : ${application.student.user.result.sem8}
											</c:when>
										</c:choose></td>
								</tr>
								
								<tr>
									<th class="col-xs-5">Course :</th>
									<td class="col-xs-7">${application.student.course.subCourseName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">College Name :</th>
									<td class="col-xs-7">${application.student.college.collegeName}</td>
								</tr>
								<tr>
									<th class="col-xs-5">College Address :</th>
									<td class="col-xs-7">${application.student.college.address}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>