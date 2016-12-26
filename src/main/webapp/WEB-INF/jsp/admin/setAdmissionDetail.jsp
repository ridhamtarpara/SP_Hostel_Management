<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content-header">
	<h1>Set Hostel Details</h1>
	<form action="updateAdmissionStatus" method="post">
		Admission Status :
		<c:choose>
			<c:when test="${globalParam.admissionOn}">
		Admission is currently ON <input type="hidden" value="false"
					name="status">
				<a data-target="#myModal" data-toggle="modal"><button
						class="btn btn-danger">Stop Admission</button></a>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					style="margin-top: 100px;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">Stop Admission</h4>
							</div>
							<div class="modal-body">Are you sure you want to Stop
								Admission ?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-danger">Stop
									Admission</button>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
		Admission is currently OFF <input type="hidden" value="true"
					name="status">
				<a data-target="#myModal" data-toggle="modal"><button
						class="btn btn-success">Start Admission</button></a>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					style="margin-top: 100px;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">Start Admission</h4>
							</div>
							<div class="modal-body">Are you sure you want to Start
								Admission ?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success">Start
									Admission</button>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</form>
</section>

<section class="content">
	<c:if test="${not empty error}">
		<div class="alert alert-danger" role="alert">
			${error}
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<c:remove var="error" />
	<div class="nav-tabs-custom">
		<form action="" name="hostelFetcher"
			class="form-horizontal hostelForm">
			<div class="form-group">
				<label class="col-sm-2 control-label">Hostel Name:</label>
				<div class="col-sm-8">
					<select name="hostelSelect" id="hostelSelect" class="form-control"
						required="required" onchange="getHostel();">
						<option value="select" disabled="disabled" selected>Select
							Hostel</option>
						<c:forEach items="${hostels}" var="h">
							<option value="${h.hostelId}">${h.hostelName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</form>
	</div>



	<form:form modelAttribute="hostel" class="form-horizontal hostelDetail"
		style="display:none;">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Update Detail</h3>
			</div>
			<div class="box-body">

				<div class="form-group">
					<form:label path="hostelName" class="col-sm-3 control-label">Hostel Name</form:label>
					<div class="col-sm-6">
						<form:input id="hostelName" path="hostelName" class="form-control"
							placeholder="Name" disabled="true" />
						<span style="color: red"> <form:errors path="hostelName" /></span>
					</div>
				</div>

				<div class="form-group">
					<form:label path="availableSeats" class="col-sm-3 control-label">Available Seats</form:label>
					<div class="col-sm-6">
						<form:input id="availableSeats" path="availableSeats"
							class="form-control" placeholder="AvailableSeats" disabled="true" />
						<span style="color: red"> <form:errors
								path="availableSeats" /></span>
					</div>
				</div>

				<div class="form-group">
					<form:label path="contactNumber" class="col-sm-3 control-label">Contact Number</form:label>
					<div class="col-sm-6">
						<form:input id="contactNumber" path="contactNumber"
							class="form-control" placeholder="contactNumber" />
						<span style="color: red"> <form:errors path="contactNumber" /></span>
					</div>
				</div>




				<div class="form-group">
					<form:label path="deposit" class="col-sm-3 control-label">Deposit</form:label>
					<div class="col-sm-6">
						<form:input id="deposit" path="deposit" class="form-control"
							placeholder="deposit" />
						<span style="color: red"> <form:errors path="deposit" /></span>
					</div>
				</div>

				<div class="form-group">
					<form:label path="fee" class="col-sm-3 control-label">Fee</form:label>
					<div class="col-sm-6">
						<form:input id="fee" path="fee" class="form-control"
							placeholder="fee" />
						<span style="color: red"> <form:errors path="fee" /></span>
					</div>
				</div>

				<div class="form-group">
					<form:label path="foodBill" class="col-sm-3 control-label">Food Bill</form:label>
					<div class="col-sm-6">
						<form:input id="foodBill" path="foodBill" class="form-control"
							placeholder="foodBill" />
						<span style="color: red"> <form:errors path="foodBill" /></span>
					</div>
				</div>
				<form:input id="hostelId" path="hostelId" class="form-control"
					type="hidden" />
				<div class="box-footer">

					<button type="submit" class="btn btn-primary pull-right">Continue</button>
				</div>

			</div>
		</div>
	</form:form>
</section>