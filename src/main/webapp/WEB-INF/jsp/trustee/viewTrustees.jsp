<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section class="content-header">
	<h1>Trustees</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body table-responsive">
					<table class="table table-bordered table-striped dataTable">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Email</th>
								<th>Mobile No</th>
								<th>Designation</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${trustees}" var="trustee" varStatus="loop">
								<tr>
									<td>${loop.index+1}</td>
									<td>${trustee.user.firstName}&nbsp;${trustee.user.lastName}</td>
									<td>${trustee.user.email}</td>
									<td>${trustee.user.mobileNumber}</td>
									<td>${trustee.designation }</td>
									<td><button type="button" class="btn btn-success"
											data-toggle="modal" data-target="#myModal"
											onclick="getTrustee(${trustee.trusteeId});">View</button> 
										<c:if test="${user.trustee.designation eq 'President'}">
										<a href="editTrustee?id=${trustee.trusteeId}">
											<button type="submit" class="btn btn-primary">Edit</button>
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
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Trustee Detail</h4>
								</div>
								<div class="modal-body">
									<div class="table-responsive">
										<table class="table no-border">
											<tbody>
												<tr>
													<th>Name</th>
													<td><span id="trusteeName"></span></td>
												</tr>
												<tr>
													<th>Email :</th>
													<td><span id="trusteeEmail"></span></td>
												</tr>
												<tr>
													<th>Designation :</th>
													<td><span id="trusteeDesignation"></span></td>
												</tr>
												<tr>
													<th>Mobile Number :</th>
													<td><span id="trusteeMobileNumber"></span></td>
												</tr>
												<tr>
													<th>Birthdate :</th>
													<td><span id="trusteeBirthDate"></span></td>
												</tr>
												<tr>
													<th>Bloodgroup :</th>
													<td><span id="trusteeBloodGroup"></span></td>
												</tr>
												<tr>
													<th>Address :</th>
													<td><span id="trusteeAddress"></span></td>
												</tr>
											</tbody>
										</table>
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
	</div>
</section>