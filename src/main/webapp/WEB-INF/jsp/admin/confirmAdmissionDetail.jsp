<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip({
			title : 'Room Suggestion',
			trigger : 'blur',
			html : 'true'
		});
	});

	$(document).ready(function() {

		$(".error").fadeOut(10000);

	});
</script>

<section class="content-header">
	<h1>Admission Detail</h1>
</section>

<!-- Main content -->
<section class="content">

	<div class="row">
		<div class="col-md-12">

			<form class="form-horizontal hostelDetail" action="" method="POST">
				<div class="box box-primary col-md-3">
					<div class="box-body">

						<div class="form-group">
							<label class="col-sm-3 control-label">Name </label>
							<div class="col-sm-6">
								<span><c:out
										value="${applicantToConfirm.user.firstName} ${applicantToConfirm.user.middleName} ${applicantToConfirm.user.lastName}"></c:out></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Hostel Name</label>
							<div class="col-sm-6">
								<select name="hostelSelect" id="hostelSelect"
									class="form-control" required="required"
									onchange="getHostel(); getRooms();">
									<option value="select" disabled="disabled" selected>Select
										Hostel</option>
									<c:forEach items="${hostels}" var="h">
										<option value="${h.hostelId}">${h.hostelName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<img alt="Loading" class="loader center-block"
							style="margin-top: 10px; display: none"
							src="<c:url value='/dist/img/ajaxloader32.gif'/>">

						<div class="form-group">
							<label class="col-sm-3 control-label">Deposit</label>
							<div class="col-sm-6">
								<spring:bind path="hostel.deposit">
									<input id="deposit" class="form-control" placeholder="deposit"
										name="${status.expression}" value="${status.value}" />
									<span style="color: red"> <form:errors path="deposit" /></span>
								</spring:bind>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Fee</label>
							<div class="col-sm-6">
								<spring:bind path="hostel.fee">
									<input id="fee" class="form-control" placeholder="fee"
										name="${status.expression}" value="${status.value}" />
									<span style="color: red"> <form:errors path="fee" /></span>
								</spring:bind>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Food Bill</label>
							<div class="col-sm-6">
								<spring:bind path="hostel.foodBill">
									<input id="foodBill" class="form-control"
										placeholder="foodBill" name="${status.expression}"
										value="${status.value}" />
									<span style="color: red"> <form:errors path="foodBill" /></span>
								</spring:bind>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Degree Year</label>
							<div class="col-sm-6">

								<input type="number" required="required" id="currentYear"
									class="form-control" placeholder="Current Year"
									name="currentYear" value="1" />

							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Payment Type</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<select class="form-control" id="paymentType"
										name="paymentType" required="required">
										<option value="" disabled="disabled" selected="selected">Select...</option>
										<option value="CASH">CASH</option>
										<option value="CHEQUE">CHEQUE</option>
									</select>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Room Number</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="room.roomId">
										<a href="#" data-toggle="tooltip" data-placement="right"><select
											class="form-control" id="roomSelect"
											name="${status.expression}" required>
												<option id="roomDefault" value="" disabled
													selected="selected">Select...</option>
										</select> </a>
									</spring:bind>
								</div>
							</div>
						</div>

						<spring:bind path="hostel.hostelId">
							<input id="hostelId" name="${status.expression}"
								value="${status.value}" type="hidden" />
						</spring:bind>
						<input id="applicantId" type="hidden"
							value="${applicantToConfirm.applicantId}" name="applicantId" />

						<div class="box-footer">
							<a href="<c:url value='viewApplicants' />"><button
									class="btn btn-default">Back</button> </a>
							<button type="submit" class="btn btn-primary pull-right">Confirm</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- /.row -->
</section>