<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section class="content-header">
	<h1>Rectors</h1>

</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Rector</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body table-responsive">
					<table class="table table-bordered table-striped dataTable">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Hostel</th>
								<th>Email</th>
								<th>Mobile No</th>
								<th>Qualification</th>
								<th>Action</th>


							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rectors}" var="rector" varStatus="loop">
								<tr>
									<td>${loop.index+1}</td>
									<td>${rector.user.firstName}&nbsp;${rector.user.lastName}</td>
									<td>${rector.hostel.hostelName}</td>
									<td>${rector.user.email}</td>
									<td>${rector.user.mobileNumber}</td>
									<td>${rector.qualifications }</td>
									<td>
										<button type="button" class="btn btn-success"
											data-toggle="modal" data-target="#myModal"
											onclick="getRector(${rector.rectorId});">View</button> 
										<c:if test="${user.trustee.designation eq 'President'}">
											<a href="rectorDelete?id=${rector.rectorId}">
											<button type="submit" class="btn btn-primary">Delete</button>
											</a>
										</c:if>		
									</td>
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
									<h4 class="modal-title">Rector Detail</h4>
								</div>
								<div class="modal-body table-responsive">

									<div class="row">
										<div class="col-md-12">
											<div class="col-md-3">
												<div class="box-body box-profile">
													<img id="photo"
														class="profile-user-img img-responsive img-square" src=""
														alt="Applicant profile picture">
												</div>
											</div>
											<div class="col-md-9">
												<table class="table no-border">
													<tbody>
														<tr>
															<th class="col-md-4">Name:</th>
															<td class="col-md-8"><span id="rectorName"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Email :</th>
															<td class="col-md-8"><span id="rectorEmail"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Qualification:</th>
															<td class="col-md-8"><span id="rectorQualification"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Hostel Name :</th>
															<td class="col-md-8"><span id="rectorHostelName"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Hostel Address</th>
															<td class="col-md-8"><span id="rectorHostelAddress"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Mobile Number :</th>
															<td class="col-md-8"><span id="rectorMobileNumber"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Birthdate :</th>
															<td class="col-md-8"><span id="rectorBirthDate"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Bloodgroup :</th>
															<td class="col-md-8"><span id="rectorBloodGroup"></span></td>
														</tr>
														<tr>
															<th class="col-md-4">Address :</th>
															<td class="col-md-8"><span id="rectorAddress"></span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
				</div>


			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->

	</div>

</section>