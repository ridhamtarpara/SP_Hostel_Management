<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section class="invoice">
	<div class="row">
		<div class="col-xs-12">
			<div class="col-xs-2">
				<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>"
					height="85" width="85">
			</div>
			<div class="col-xs-10">
				<h4 style="margin: 0; text-align: center; position: relative;">SHREE
					SAURASHTRA PATEL KELAVANI MANDAL</h4>
				<p
					style="margin: 0; text-align: center; position: relative; font-weight: 500;">80G
					Reg.No. DIT.(E)/80 G(5)/1258/07-08 DT. 09-04-2008</p>
				<p
					style="margin: 0; text-align: center; position: relative; font-weight: 500;">
					${student.hostel.address}</p>
				<p
					style="margin: 0; text-align: center; position: relative; font-weight: 500;">Trust
					Regd. No. F-59 DT. 12-07-1955, Society Regd. No. 3171 DT.
					19-02-1955</p>
			</div>
		</div>
		<div class="col-xs-4">
			Phone: (079) ${student.hostel.contactNumber}<br> FCRA Reg. No 041910252<br>
		</div>
		<div class="col-xs-8" style="text-align: right;">
			Email: sphostel@gmail.com<br> Website: www.sspkm.org
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-xs-12">
			<h2>
				<div class="text-center">Cancel Admission Application</div>
				<br>
			</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-4 pull-right invoice-col">
			<address>
				<strong>Name : ${student.user.firstName}
					${student.user.middleName} ${student.user.lastName}</strong><br>City :
				${student.user.city}<br> Course :
				${student.course.subCourseName}<br>Room No. :
				${student.room.roomNumber}<br> Date :
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<fmt:formatDate pattern="dd-MM-yyyy" value="${today}" />
				<br> Mobile No. : ${student.user.mobileNumber}<br> Parent
				Mobile No. : ${student.user.parent.parent_mobileNumber }
			</address>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<br>
			<div class="no-shodow">
				&emsp; &emsp; &emsp; &emsp; With compliments to state that I<b>
					${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</b>
				was studying <b>${student.course.subCourseName}</b> in
				${student.hostel.hostelName}. Since completing my studies, I go home
				with my father <b>${student.user.parent.parent_firstName}&nbsp;${student.user.parent.parent_middleName}&nbsp;${student.user.parent.parent_lastName}</b>
				cancel my admission from the hostel. There will be no obligation of
				the organization.

			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-4 pull-right">
			<div>
				<br>Sincerely,<br> <span
					style="text-transform: capitalize">${fn:toLowerCase(student.user.firstName)}&nbsp;${fn:toLowerCase(student.user.lastName)}</span>
			</div>
		</div>
	</div>
	<div class="row">
		<br> <br>
		<h3 class="box-header with-border">&nbsp;Parent Note</h3>
		<div class="col-xs-12">
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
	</div>
	<div class="row">
		<div class="col-xs-4 pull-right">
			<div>
				<br>Sincerely,<br>${student.user.parent.parent_firstName}&nbsp;${student.user.parent.parent_lastName}</div>
		</div>
	</div>
	<br />
</section>