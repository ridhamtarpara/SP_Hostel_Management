<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content-header">
	<h1>Cancel Admission Applications</h1>

</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body table-responsive">
					<table class="table table-bordered table-hover dataTable">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Room No.</th>
								<th>Course</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="application" items="${ApplicationList}"
								varStatus="statuss">

								<tr>
									<td>${statuss.count}</td>
									<td>${application.student.user.firstName}&nbsp;${application.student.user.middleName}&nbsp;${application.student.user.lastName}</td>
									<td>${application.student.room.roomNumber}</td>
									<td>${application.student.course.subCourseName}</td>
									<c:choose>
										<c:when test="${application.status=='Not Approved'}">
											<td><span class="label label-warning">${application.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#myModal"
														onclick="viewStudent(${application.student.studentId});">View</button>

													<a
														href="<c:url value='getStudentDetail?id=${application.student.studentId}' />"><button
															class="btn btn-primary" id="approveButton">Approve</button>
													</a>
												</div>
										</c:when>

										<c:otherwise>
											<td><span class="label label-success">${application.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#myModal"
														onclick="viewStudent(${application.student.studentId});">View</button>
													<a
														href="<c:url value='cancelAdmissionLetter?id=${application.student.studentId}' />"><button
															class="btn btn-success" id="confirmButton">Cancel</button>
													</a>
												</div>
										</c:otherwise>
									</c:choose>
								</tr>

							</c:forEach>
						</tbody>
					</table>
					<div id="myModal" class="modal fade" role="dialog" tabindex="-1"
						aria-labelledby="gridModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Applicant Detail</h4>
								</div>

								<div class="modal-body table-responsive">

									<div class="row">
										<div class="col-md-12">

											<!-- Profile Image -->
											<div class="box box-primary col-md-3">
												<div class="box-header">
													<h3 class="box-title">Personal Detail</h3>
												</div>
												<div class="col-md-3">
													<div class="box-body box-profile">
														<img id="self"
															class="profile-user-img img-responsive img-square" src=""
															alt="Applicant profile picture">
													</div>
												</div>

												<div class="col-md-9">
													<div class="box-body">
														<table class="table no-border">
															<tbody>
																<tr>
																	<th class="col-md-4">Name</th>
																	<td class="col-md-8"><span id="applicantName"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Email :</th>
																	<td class="col-md-8"><span id="applicantEmail"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Mobile Number :</th>
																	<td class="col-md-8"><span
																		id="applicantMobileNumber"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Birthdate :</th>
																	<td class="col-md-8"><span id="applicantBirthDate"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Bloodgroup :</th>
																	<td class="col-md-8"><span
																		id="applicantBloodGroup"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Address :</th>
																	<td class="col-md-8"><span id="applicantAddress"></span></td>
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
														<img id="parent"
															class="profile-user-img img-responsive img-square" src=""
															alt="Father profile picture">
													</div>
												</div>

												<div class="col-md-9">
													<div class="box-body">
														<table class="table no-border">
															<tbody>
																<tr>
																	<th class="col-md-4">Father Name :</th>
																	<td class="col-md-8"><span id="fatherName"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Father Mobile Number :</th>
																	<td class="col-md-8"><span id="fatherMobileNumber"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Father's Business :</th>
																	<td class="col-md-8"><span id="fatherBusiness"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Father's Income :</th>
																	<td class="col-md-8"><span id="fatherIncome"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">No of Family Member :</th>
																	<td class="col-md-8"><span id="familyMember"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Native Address :</th>
																	<td class="col-md-8"><span id="nativeAddress"></span></td>
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
														<img id="relative"
															class="profile-user-img img-responsive img-square" src=""
															alt="Relative profile picture">
													</div>
												</div>

												<div class="col-md-9">
													<div class="box-body">
														<table class="table no-border">
															<tbody>
																<tr>
																	<th class="col-md-4">Relative Name :</th>
																	<td class="col-md-8"><span id="relativeName"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Relative Mobile Number :</th>
																	<td class="col-md-8"><span
																		id="relativeMobileNumber"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Relation :</th>
																	<td class="col-md-8"><span id="relation"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Relative Address :</th>
																	<td class="col-md-8"><span id="relativeAddress"></span></td>
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
																	<td class="col-md-8"><span id="10thPer"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">12th Percentage :</th>
																	<td class="col-md-8"><span id="12thPer"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">Course :</th>
																	<td class="col-md-8"><span id="courseName"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">College Name :</th>
																	<td class="col-md-8"><span id="collegeName"></span></td>
																</tr>
																<tr>
																	<th class="col-md-4">College Address :</th>
																	<td class="col-md-8"><span id="collegeAddress"></span></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<!-- /.box-body -->
											</div>

										</div>
										<!-- /.col -->


										<!-- /.col -->
									</div>
									<!-- /.row -->

								</div>

							</div>

						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->

		</div>
	</div>
</section>