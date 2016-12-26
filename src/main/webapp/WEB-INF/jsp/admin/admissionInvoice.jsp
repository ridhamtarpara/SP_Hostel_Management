<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Receipt</h1>
</section>
<section class="content">
	<section class="invoice">
		<div class="row">
			<c:forEach var="invoice" items="${invoices}">
				<div class="row">
					<div class="col-xs-12">
						<div class="col-md-2">
							<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>"
								height="100" width="100">
						</div>
						<div class="col-md-10">
							<h2 style="margin: 0; text-align: center; position: relative;">SHREE
								SAURASHTRA PATEL KELAVANI MANDAL</h2>
							<p
								style="margin: 0; text-align: center; position: relative; font-weight: 500;">80G
								Reg.No. DIT.(E)/80 G(5)/1258/07-08 DT. 09-04-2008</p>
							<p
								style="margin: 0; text-align: center; position: relative; font-weight: 500;">
								${invoice.user.student.hostel.address}</p>
							<p
								style="margin: 0; text-align: center; position: relative; font-weight: 500;">Trust
								Regd. No. F-59 DT. 12-07-1955, Society Regd. No. 3171 DT.
								19-02-1955</p>
						</div>
					</div>
				</div>
				<h2 class="page-header"></h2>
				<!-- info row -->
				<div class="row invoice-info">
					<div class="col-sm-6 invoice-col">
						From,
						<address>
							<strong>SHREE SAURASHTRA PATEL KELAVANI MANDAL</strong><br>
							Phone: (079) ${invoice.user.student.hostel.contactNumber}<br>
							Email: sphostel@gmail.com<br> Website: www.sspkm.org<br>
							FCRA Reg. No 041910252<br>
						</address>
					</div>
					<div class="col-sm-6 invoice-col">
						To,
						<address>
							<c:choose>
								<c:when test="${invoice.invoiceType == 'SHREE DONATION'}">
									<strong>M/s.&nbsp;${invoice.user.parent.parent_firstName}&nbsp;${invoice.user.parent.parent_middleName}&nbsp;${invoice.user.parent.parent_lastName}</strong>
								</c:when>
								<c:otherwise>
									<strong>${invoice.user.firstName}&nbsp;${invoice.user.middleName}&nbsp;${invoice.user.lastName}</strong>
								</c:otherwise>
							</c:choose>
							<br>VILLAGE : ${invoice.user.nativeVillage}<br> TALUKA
							: ${invoice.user.nativeTaluka}<br>DIST. :
							${invoice.user.nativeDistrict}<br> PHONE :
							${invoice.user.mobileNumber}
						</address>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Sr. No.</th>
									<th>Description</th>
									<th>Payment Type</th>
									<th>Amount(Rs.)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>${invoice.invoiceType}</td>
									<td>${invoice.paymentType}</td>
									<td>${invoice.amount}</td>
								</tr>
								<tr>
									<td colspan="3" style="text-align: right; font-weight: bold">Total
										Amount:</td>
									<td>${invoice.amount}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 pull-right"
						style="margin-right: 35px; margin-left: 35px; text-align: center">Receiver's
						Sign</div>
					<div class="col-md-2 pull-right"
						style="margin-right: 10px; text-align: center">Hon.
						Secretary</div>
				</div>
				<div class="row">
					<div class="center-block col-md-2 pull-right"
						style="border: 1px black solid; height: 35px; margin-right: 35px; margin-left: 35px"></div>
					<div class="center-block col-md-2 pull-right"
						style="border: 1px black solid; height: 35px"></div>
				</div>
				<br />
				<hr>
				<br />
				<!-- /.row -->
			</c:forEach>
			<!-- this row will not appear when printing -->
			<div class="row no-print">
				<div class="col-xs-12 proceedbtn">
					<a href="<c:url value='/admin/print'/>" target="_blank"
						class="btn btn-default"><i class="fa fa-print"></i> Print</a>
				</div>
			</div>
		</div>
	</section>
</section>