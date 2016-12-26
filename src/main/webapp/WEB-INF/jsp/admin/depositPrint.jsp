
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="invoice">
	<div style="border: 1px solid; padding: 10px">
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
						style="margin: 0; text-align: center; position: relative; font-weight: 500;">${student.hostel.address}</p>
					<p
						style="margin: 0; text-align: center; position: relative; font-weight: 500;">Trust
						Regd. No. F-59 DT. 12-07-1955, Society Regd. No. 3171 DT.
						19-02-1955</p>
				</div>
			</div>
			<div class="col-xs-4">
				Phone: (079) ${student.hostel.contactNumber}<br> FCRA
					Reg. No 041910252<br>
			</div>
			<div class="col-xs-8" style="text-align: right;">
				Email: sphostel@gmail.com<br> Website: www.sspkm.org<br>
			</div>
		</div>
		<h2 class="page-header2"></h2>
		<div class="row invoice-info">
			<div class="col-xs-8">
				<strong>M/s.&nbsp;${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</strong><br>VILLAGE
				: ${student.user.nativeVillage}&nbsp; TALUKA :
				${student.user.nativeTaluka}&nbsp;DIST. :
				${student.user.nativeDistrict}<br> PHONE :
				${student.user.mobileNumber}
			</div>
			<div class="col-xs-4">
				Receipt No.&nbsp;:&nbsp;14522152<br /> Receipt Date&nbsp;:&nbsp;
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<fmt:formatDate pattern="dd-MM-yyyy" value="${today}" />
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 table-responsive">
				<table class="table table-striped table-bordered">
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
							<td>Deposit Refund</td>
							<td>CASH</td>
							<td>${deposit}</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: right; font-weight: bold">Total
								Amount:</td>
							<td>${deposit}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-3 pull-right"
				style="margin-right: 35px; margin-left: 35px; text-align: center">Receiver's
				Sign</div>
			<div class="col-xs-3 pull-right"
				style="margin-right: 10px; text-align: center">Hon. Secretary</div>
		</div>
		<div class="row">
			<div class="center-block col-xs-3 pull-right"
				style="border: 1px black solid; height: 35px; margin-right: 35px; margin-left: 35px"></div>
			<div class="center-block col-xs-3 pull-right"
				style="border: 1px black solid; height: 35px"></div>
		</div>
	</div>
	<hr>
	<div style="border: 1px solid; padding: 10px">
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
						style="margin: 0; text-align: center; position: relative; font-weight: 500;">${student.hostel.address}</p>
					<p
						style="margin: 0; text-align: center; position: relative; font-weight: 500;">Trust
						Regd. No. F-59 DT. 12-07-1955, Society Regd. No. 3171 DT.
						19-02-1955</p>
				</div>
			</div>
			<div class="col-xs-4">
				Phone: <br />(079) ${student.hostel.contactNumber}<br>
				FCRA Reg. No 041910252
			</div>
			<div class="col-xs-8" style="text-align: right;">
				Email: sphostel@gmail.com<br> Website: www.sspkm.org
			</div>
		</div>
		<h2 class="page-header2"></h2>
		<div class="row invoice-info">
			<div class="col-xs-8">
				<strong>M/s.&nbsp;${student.user.firstName}&nbsp;${student.user.middleName}&nbsp;${student.user.lastName}</strong><br>VILLAGE
				: ${student.user.nativeVillage}&nbsp; TALUKA :
				${student.user.nativeTaluka}&nbsp;DIST. :
				${student.user.nativeDistrict}<br> PHONE :
				${student.user.mobileNumber}

			</div>
			<!-- /.col -->
			<div class="col-xs-4">
				Receipt No.&nbsp;:&nbsp;14522152<br /> Receipt Date&nbsp;:&nbsp;
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<fmt:formatDate pattern="dd-MM-yyyy" value="${today}" />
			</div>
		</div>
		<!-- /.row -->

		<!-- Table row -->
		<div class="row">
			<div class="col-xs-12 table-responsive">
				<table class="table table-striped table-bordered">
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
							<td>Deposit Refund</td>
							<td>CASH</td>
							<td>${deposit}</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: right; font-weight: bold">Total
								Amount:</td>
							<td>${deposit}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- /.col -->
		</div>

		<!-- /.row -->

		<div class="row">

			<div class="col-xs-3 pull-right"
				style="margin-right: 35px; margin-left: 35px; text-align: center">Receiver's
				Sign</div>

			<div class="col-xs-3 pull-right"
				style="margin-right: 10px; text-align: center">Hon. Secretary</div>

		</div>


		<div class="row">
			<div class="center-block col-xs-3 pull-right"
				style="border: 1px black solid; height: 35px; margin-right: 35px; margin-left: 35px"></div>
			<div class="center-block col-xs-3 pull-right"
				style="border: 1px black solid; height: 35px"></div>

		</div>
		<!-- /.row -->


	</div>
	<hr>
</section>