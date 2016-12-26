<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content-header">
	<h1>Detail</h1>
</section>



<!-- Main content -->
<section class="content">

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
							src="<c:url value='/dist/img/user/${student.user.userId}/self${student.user.appliedOn.getTime()}.jpg'/>"
							alt="student profile picture">
					</div>
				</div>

				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-5">Name :</th>
									<td>${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</td>
								</tr>
								<tr>
									<th>Email :</th>
									<td>${student.user.email }</td>
								</tr>
								<tr>
									<th>Mobile Number :</th>
									<td>${student.user.mobileNumber}</td>
								</tr>
								<tr>
									<th>Birthdate :</th>
									<td>${student.user.birthDate}</td>
								</tr>
								<tr>
									<th>Bloodgroup :</th>
									<td>${student.user.bloodGroup}</td>
								</tr>
								<tr>
									<th>Address :</th>
									<td>${student.user.address1},<br />${student.user.address2},&nbsp;${student.user.city}&nbsp;-&nbsp;${student.user.zipCode}</td>
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
							src="<c:url value='/dist/img/user/${student.user.userId}/parent${student.user.appliedOn.getTime()}.jpg'/>"
							alt="student profile picture">
					</div>
				</div>

				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-5">Father Name :</th>
									<td>${student.user.parent.parent_firstName}&nbsp;${student.user.parent.parent_middleName}&nbsp;${student.user.parent.parent_lastName}</td>
								</tr>
								<tr>
									<th>Father Mobile Number :</th>
									<td>${student.user.parent.parent_mobileNumber }</td>
								</tr>
								<tr>
									<th>Father's Business :</th>
									<td>${student.user.parent.parent_business}</td>
								</tr>
								<tr>
									<th>Father's Income :</th>
									<td>${student.user.parent.parent_income}</td>
								</tr>
								<tr>
									<th>No of Family Member :</th>
									<td>${student.user.parent.parent_totalMembers}</td>
								</tr>
								<tr>
									<th>Native Address :</th>
									<td>${student.user.nativeVillage}<br />Taluka
										-&nbsp;${student.user.nativeTaluka}<br />Dist.
										-&nbsp;${student.user.nativeDistrict}<br />Pincode
										-&nbsp;${student.user.nativeZipCode}
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
							src="<c:url value='/dist/img/user/${student.user.userId}/relative${student.user.appliedOn.getTime()}.jpg'/>"
							alt="student profile picture">
					</div>
				</div>

				<div class="col-md-9">
					<div class="box-body">
						<table class="table no-border">
							<tbody>
								<tr>
									<th class="col-md-5">Relative Name :</th>
									<td>${student.user.relative.relative_firstName}&nbsp;${student.user.relative.relative_middleName}&nbsp;${student.user.relative.relative_lastName}</td>
								</tr>
								<tr>
									<th>Relative Mobile Number :</th>
									<td>${student.user.relative.relative_mobileNumber }</td>
								</tr>
								<tr>
									<th>Relation :</th>
									<td>${student.user.relative.relative_relation}</td>
								</tr>
								<tr>
									<th>Relative Address :</th>
									<td>${student.user.relative.relative_address}</td>
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
									<th class="col-md-5">10th Percentage :</th>
									<td>${student.user.result.x}</td>
								</tr>
								<tr>
									<th>12th Percentage :</th>
									<td>${student.user.result.xii}</td>
								</tr>
								<tr>
									<th>Last Result :</th>
									<td><c:choose>
											<c:when test="${student.currentYear==1}">
											Semester 1 : ${student.user.result.sem1}<br><c:if test="${student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 2 : ${student.user.result.sem2}
											</c:when>
											<c:when test="${student.currentYear==2}">
											Semester 3 : ${student.user.result.sem3}<br><c:if test="${student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 4 : ${student.user.result.sem4}
											</c:when>
											<c:when test="${student.currentYear==3}">
											Semester 5 : ${student.user.result.sem5}<br><c:if test="${student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 6 : ${student.user.result.sem6}
											</c:when>
											<c:when test="${student.currentYear==4}">
											Semester 7 : ${student.user.result.sem7}<br><c:if test="${student.user.result.sem2==0}">Haven't Got Result Yet - </c:if>Semester 8 : ${student.user.result.sem8}
											</c:when>
										</c:choose></td>
								</tr>
								<tr>
									<th>Course :</th>
									<td>${student.course.subCourseName}</td>
								</tr>
								<tr>
									<th>Current Year :</th>
									<td>${student.currentYear}</td>
								</tr>
								<tr>
									<th>College Name :</th>
									<td>${student.college.collegeName}</td>
								</tr>
								<tr>
									<th>College Address :</th>
									<td>${student.college.address}</td>
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
					href="<c:url value='approveStudentAdmission?id=${student.currentStudentApplication.studentApplicationId}' />"><button
						class="btn btn-primary pull-right">Next</button> </a>
			</div>
		</div>
		<!-- /.col -->


		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>