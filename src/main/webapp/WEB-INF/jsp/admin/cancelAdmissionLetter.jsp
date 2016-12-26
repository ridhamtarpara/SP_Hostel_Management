<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section class="content-header">
	<h1>Cancel Admission Letter</h1>
</section>

<section class="invoice">
	<!-- title row -->
	<div class="row">
		<div class="col-md-4 col-xs-6 pull-right">

			<address>
				<strong>Name :
					${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</strong><br>City
				: ${student.user.city}<br> Course :
				${student.course.subCourseName}<br>Room No. :
				${student.room.roomNumber}<br> Date :
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<fmt:formatDate pattern="dd-MM-yyyy" value="${now}" />
				<br> Mobile No. : ${student.user.mobileNumber}<br> Parent
				Mobile No. : ${student.user.parent.parent_mobileNumber }
			</address>


		</div>

		<!-- /.col -->
	</div>

	<!-- info row -->
	<div class="row invoice-info">
		<div class="col-sm-12 invoice-col">
			<br>
			<div class="no-shodow">
				&emsp; &emsp; &emsp; &emsp; With compliments to state that I<b>
					${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</b>
				was studying <b>${student.course.subCourseName}</b> in
				${student.hostel.hostelName}. Since completing my studies, I go home
				with my father <b>${student.user.parent.parent_firstName}&nbsp;${student.user.parent.parent_middleName}&nbsp;${student.user.parent.parent_lastName}</b> so I want to
				cancel my admission from the hostel. There will be no obligation of
				the organization.

			</div	>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

	<!-- Table row -->
	<div class="row invoice-info">
		<div class="col-md-4 col-xs-6 pull-right">
			<div>
				<br>Sincerely,<br> <span
					style="text-transform: capitalize">${fn:toLowerCase(student.user.firstName)}&nbsp;${fn:toLowerCase(student.user.lastName)}</span>
			</div>
		</div>
	</div>
	<!-- /.row -->

	<div class="row">
		<br> <br>
		<h3 class="box-header with-border">Parent Note</h3>
		<div class="col-sm-12 invoice-col">
			<br>
			<c:if test="${student.user.gender eq 'FEMALE'}">
				<div class="no-shodow">
					&emsp; &emsp; &emsp; &emsp; With compliments to state that <b>
						${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</b>
					is my Daughter.Since her study was completed in <b>${student.course.subCourseName}</b>
					I take her home with all the baggage liability by the cancellation
					of admission. There will be no obligation of the organization.

				</div>
			</c:if>
			<c:if test="${student.user.gender eq 'MALE'}">
				<div class="no-shodow">
					&emsp; &emsp; &emsp; &emsp; With compliments to state that <b>
						${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</b>
					is my Son.Since his study was completed in <b>${student.course.subCourseName}</b>
					I take him home with all the baggage liability by the cancellation
					of admission. There will be no obligation of the organization.

				</div>
			</c:if>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

	<div class="row invoice-info">
		<div class="col-md-4 col-xs-6 pull-right">
			<div>
				<br>Sincerely,<br>${student.user.parent.parent_firstName}&nbsp;${student.user.parent.parent_lastName}</div>
		</div>
	</div>
	<!-- /.row -->

	<br />


	<!-- this row will not appear when printing -->
	<div class="row no-print">
		<div class="col-xs-12 proceedbtn">
			<a href="<c:url value='/admin/printCancelAdmissionLetter'/>"
				target="_blank" class="btn btn-default"><i class="fa fa-print"></i>
				Print</a>
		</div>
	</div>


</section>

<section class="content">
	<form class="form-horizontal hostelDetail" method="post">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Deposit Detail</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">Deposit</label>
					<div class="col-sm-6">
						<input name="deposit" type="number" class="form-control"
							placeholder="Enter Deposit" /> <span style="color: red">
						</span>
					</div>
					<div class="col-sm-3">
						<button type="submit" class="btn btn-primary">Continue</button>
					</div>
				</div>


			</div>
		</div>
	</form>
</section>