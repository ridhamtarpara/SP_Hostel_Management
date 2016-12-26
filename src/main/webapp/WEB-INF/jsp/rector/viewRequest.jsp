<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
        $(document).ready(function() {
                $(".leave").show( "fast" );
           $('select').change(function () {
     var optionSelected = $(this).find("option:selected");
     var valueSelected  = optionSelected.val();
      if(valueSelected == 1){
         $(".leave").show( "fast" );
         $(".complaint").hide( "fast" );
         $(".vehical").hide( "fast" );
         $(".achivement").hide( "fast" );
      }else if(valueSelected == 2){
        $(".complaint").show( "fast" );
        $(".leave").hide( "fast" );
        $(".vehical").hide( "fast" );
        $(".achivement").hide( "fast" );
      }else if(valueSelected == 3){
        $(".vehical").show( "fast" );
        $(".leave").hide( "fast" );
        $(".complaint").hide( "fast" );
        $(".achivement").hide( "fast" );
      }else {
        $(".achivement").show( "fast" );
        $(".leave").hide( "fast" );
        $(".complaint").hide( "fast" );
        $(".vehical").hide( "fast" );
      }
   });
        $('.date').datepicker(); 
        });
</script>
<script>
	$(function() {
		$('.example').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : true,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false
		});
	});
</script>
<section class="content-header">
	<h1>Requests</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Requests</a></li>
	</ol>
</section>
<section class="content">
	<div class="nav-tabs-custom">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#activity1" data-toggle="tab">View
					Request</a></li>
		</ul>
		<div class="tab-content">
			<div class="active tab-pane" id="activity1">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">Request Type:</label>
						<div class="col-sm-8">
							<select name="" id="input" class="form-control"
								required="required">
								<option value="1" selected="selected">Leave Application</option>
								<option value="2">Complaint</option>
								<option value="3">Vehical Ragister</option>
								<option value="4">Achivement</option>
							</select>
						</div>
					</div>
				</form>
				<div class="box box-info leave" style="display: none;">
					<div class="box-header with-border">
						<h3 class="box-title">View Leave Request</h3>
					</div>
					<div class="box-body table-responsive">
						<table
							class="table table-bordered table-hover table-striped example">
							<thead>
								<tr>
									<th>Application ID</th>
									<th>Name</th>
									<th>Title</th>
									<th>Leave Date</th>
									<th>Return Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="leaveApplication" items="${leaveApplications}"
									varStatus="statuss">
									<tr>
										<td>${leaveApplication.leaveApplicationId}</td>
										<td>${leaveApplication.student.user.firstName}&nbsp;${leaveApplication.student.user.lastName}</td>
										<td>${leaveApplication.title}</td>
										<td>${leaveApplication.leaveDate}</td>
										<td>${leaveApplication.returnDate}</td>
										<c:if test="${leaveApplication.status=='Not Approved'}">
											<td><span class="label label-warning">${leaveApplication.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#leave"
														onclick="viewStudentLeaveRequest(${leaveApplication.leaveApplicationId});">View</button>
													<security:authorize access="hasRole('ROLE_RECTOR')">
														<a
															href="<c:url value='approveStudentLeaveRequest?id=${leaveApplication.leaveApplicationId}' />"><button
																class="btn btn-primary" id="approveButton">Approve</button>
														</a>
													</security:authorize>
												</div>
											</td>
										</c:if>
										<c:if test="${leaveApplication.status=='Approved'}">
											<td><span class="label label-success">${leaveApplication.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#leave"
														onclick="viewStudentLeaveRequest(${leaveApplication.leaveApplicationId});">View</button>
												</div>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="leave" class="modal fade" role="dialog" tabindex="-1"
							aria-labelledby="gridModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Leave Application</h4>
									</div>
									<div class="modal-body">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
												<tbody>
													<tr>
														<th class="col-md-2">Leave Application ID</th>
														<td class="col-md-10"><span id="lId"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Title</th>
														<td class="col-md-10"><span id="ltitle"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Detail</th>
														<td class="col-md-10"><span id="ldetail"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Address</th>
														<td class="col-md-10"><span id="laddress"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Status</th>
														<td class="col-md-10"><span id="lstatus"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Leave Date</th>
														<td class="col-md-10"><span id="ldate"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Return Date</th>
														<td class="col-md-10"><span id="rdate"></span></td>
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
				<div class="box box-info complaint" style="display: none;">
					<div class="box-header with-border">
						<h3 class="box-title">View Complaints</h3>
					</div>
					<div class="box-body table-responsive">
						<table
							class="table table-bordered table-hover table-striped example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Title</th>
									<th>Type</th>
									<th>Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="complaint" items="${complaints}"
									varStatus="statuss">
									<tr>
										<td>${statuss.count}</td>
										<td>${complaint.student.user.firstName}&nbsp;${complaint.student.user.lastName}</td>
										<td>${complaint.title}</td>
										<td>${complaint.complaintType}</td>
										<td>${complaint.date}</td>
										<c:if test="${complaint.status=='Not Approved'}">
											<td><span class="label label-warning">${complaint.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#complaint"
														onclick="viewStudentComplaintRequest(${complaint.complaintId});">View</button>
													<security:authorize access="hasRole('ROLE_RECTOR')">
														<a
															href="<c:url value='approveStudentComplaintRequest?id=${complaint.complaintId}' />"><button
																class="btn btn-primary" id="approveButton">Approve</button>
														</a>
													</security:authorize>
												</div>
											</td>
										</c:if>
										<c:if test="${complaint.status=='Approved'}">
											<td><span class="label label-success">${complaint.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#complaint"
														onclick="viewStudentComplaintRequest(${complaint.complaintId});">View</button>
												</div>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="complaint" class="modal fade" role="dialog" tabindex="-1"
							aria-labelledby="gridModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Complaint</h4>
									</div>
									<div class="modal-body">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
												<tbody>
													<tr>
														<th class="col-md-2">Title</th>
														<td class="col-md-10"><span id="ctitle"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Complaint Type</th>
														<td class="col-md-10"><span id="ctype"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Detail</th>
														<td class="col-md-10"><span id="cdetail"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Status</th>
														<td class="col-md-10"><span id="cstatus"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Complaint Date</th>
														<td class="col-md-10"><span id="cdate"></span></td>
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
				<div class="box box-info vehical" style="display: none;">
					<div class="box-header with-border">
						<h3 class="box-title">View Vehicle Requests</h3>
					</div>
					<div class="box-body table-responsive">
						<table
							class="table table-bordered table-hover table-striped example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Vehicle Model</th>
									<th>Vehicle Number</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vehicleRegister" items="${vehicleRegisters}"
									varStatus="statuss">
									<tr>
										<td>${statuss.count}</td>
										<td>${vehicleRegister.student.user.firstName}&nbsp;${vehicleRegister.student.user.lastName}</td>
										<td>${vehicleRegister.vehicleModel}</td>
										<td>${vehicleRegister.vehicleNumber}</td>
										<c:if test="${vehicleRegister.status=='Not Approved'}">
											<td><span class="label label-warning">${vehicleRegister.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#vehicle"
														onclick="viewStudentVehicleRequest(${vehicleRegister.vehicleRegisterId});">View</button>
													<security:authorize access="hasRole('ROLE_RECTOR')">
														<a
															href="<c:url value='approveStudentVehicleRequest?id=${vehicleRegister.vehicleRegisterId}' />"><button
																class="btn btn-primary" id="approveButton">Approve</button>
														</a>
													</security:authorize>
												</div>
											</td>
										</c:if>
										<c:if test="${vehicleRegister.status=='Approved'}">
											<td><span class="label label-success">${vehicleRegister.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#vehicle"
														onclick="viewStudentVehicleRequest(${vehicleRegister.vehicleRegisterId});">View</button>
												</div>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="vehicle" class="modal fade" role="dialog" tabindex="-1"
							aria-labelledby="gridModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Vehicle Register</h4>
									</div>
									<div class="modal-body">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
												<tbody>
													<tr>
														<th class="col-md-2">Vehicle Number</th>
														<td class="col-md-10"><span id="vehicleNumber"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Vehicle Model</th>
														<td class="col-md-10"><span id="vehicleModel"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Licence Number</th>
														<td class="col-md-10"><span id="licenceNumber"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Status</th>
														<td class="col-md-10"><span id="vstatus"></span></td>
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
				<div class="box box-info achivement" style="display: none;">
					<div class="box-header with-border">
						<h3 class="box-title">View Achivement Request</h3>
					</div>
					<div class="box-body table-responsive">
						<table
							class="table table-bordered table-hover table-striped example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Title</th>
									<th>Detail</th>
									<th>Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="achievement" items="${achievements}"
									varStatus="statuss">
									<tr>
										<td>${statuss.count}</td>
										<td>${achievement.student.user.firstName}&nbsp;${achievement.student.user.lastName}</td>
										<td>${achievement.title}</td>
										<td>${achievement.detail}</td>
										<td>${achievement.date}</td>
										<c:if test="${achievement.status=='Not Approved'}">
											<td><span class="label label-warning">${achievement.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#achievement"
														onclick="viewStudentAchievementRequest(${achievement.achievementId});">View</button>
													<security:authorize access="hasRole('ROLE_RECTOR')">
														<a
															href="<c:url value='approveStudentAchievementRequest?id=${achievement.achievementId}' />"><button
																class="btn btn-primary" id="approveButton">Approve</button>
														</a>
													</security:authorize>
												</div>
											</td>
										</c:if>
										<c:if test="${achievement.status=='Approved'}">
											<td><span class="label label-success">${achievement.status}</span></td>
											<td>
												<div>
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#achievement"
														onclick="viewStudentAchievementRequest(${achievement.achievementId});">View</button>
												</div>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="achievement" class="modal fade" role="dialog"
							tabindex="-1" aria-labelledby="gridModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Achievement</h4>
									</div>
									<div class="modal-body">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
												<tbody>
													<tr>
														<th class="col-md-2">Title</th>
														<td class="col-md-10"><span id="atitle"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Detail</th>
														<td class="col-md-10"><span id="adetail"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Status</th>
														<td class="col-md-10"><span id="astatus"></span></td>
													</tr>
													<tr>
														<th class="col-md-2">Date</th>
														<td class="col-md-10"><span id="adate"></span></td>
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
	</div>
</section>