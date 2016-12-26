<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section class="content-header">
	<h1>Admins</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Admin</h3>
				</div>
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
							<c:forEach items="${admins}" var="admin" varStatus="loop">
								<tr>
									<td>${loop.index+1}</td>
									<td>${admin.user.firstName}&nbsp;${admin.user.lastName}</td>
									<td>${admin.hostel.hostelName }</td>
									<td>${admin.user.email}</td>
									<td>${admin.user.mobileNumber}</td>
									<td>${admin.qualifications }</td>
									<td><button type="button" class="btn btn-success"
											data-toggle="modal" data-target="#myModal"
											onclick="getAdmin(${admin.adminId});">View</button> <a
										href="adminEdit?id=${admin.adminId}"> </a> 
										<c:if test="${user.trustee.designation eq 'President'}">
										<a href="adminDelete?id=${admin.adminId}">
											<button type="submit" class="btn btn-primary btn-danger">Delete</button>
										</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="myModal" class="modal fade" role="dialog" tabindex="-1"
					aria-labelledby="gridModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Admin Detail</h4>
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
														<th class="col-md-4">Name :</th>
														<td class="col-md-8"><span id="adminName"></span></td>
													</tr>
													<tr>
														<th class="col-md-4">Email :</th>
														<td class="col-md-8"><span id="adminEmail"></span></td>
													</tr>
													<tr>
														<th class="col-md-4">Designation :</th>
														<td class="col-md-8"><span id="adminQualification"></span></td>
													</tr>
													<tr>
														<th class="col-md-4">Mobile Number :</th>
														<td class="col-md-8"><span id="adminMobileNumber"></span></td>
													</tr>
													<tr>
														<th class="col-md-4">Birthdate :</th>
														<td class="col-md-8"><span id="adminBirthDate"></span></td>
													</tr>
													<tr>
														<th class="col-md-4">Bloodgroup :</th>
														<td class="col-md-8"><span id="adminBloodGroup"></span></td>
													</tr>
													<tr>
														<th class="col-md-4">Address :</th>
														<td class="col-md-8"><span id="adminAddress"></span></td>
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
	</div>
</section>