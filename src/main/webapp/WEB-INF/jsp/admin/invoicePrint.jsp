<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="invoice" items="${invoices}">
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
							style="margin: 0; text-align: center; position: relative; font-weight: 500;">
							${invoice.user.student.hostel.address}</p>
						<p
							style="margin: 0; text-align: center; position: relative; font-weight: 500;">Trust
							Regd. No. F-59 DT. 12-07-1955, Society Regd. No. 3171 DT.
							19-02-1955</p>

					</div>


				</div>
				<div class="col-xs-4">
					Phone: (079) ${invoice.user.student.hostel.contactNumber}<br> FCRA
					Reg. No 041910252<br>
				</div>
				<div class="col-xs-8" style="text-align: right;">
					Email: sphostel@gmail.com<br> Website: www.sspkm.org
				</div>
				<!-- /.col -->
			</div>
			<hr>
			<h2 class="page-header2"></h2>
			<!-- info row -->
			<div class="row invoice-info">
				<div class="col-xs-8">
					<c:choose>
						<c:when test="${invoice.invoiceType == 'SHREE DONATION'}">
							<strong>M/s.&nbsp;${invoice.user.parent.parent_firstName}&nbsp;${invoice.user.parent.parent_middleName}&nbsp;${invoice.user.parent.parent_lastName}</strong>
						</c:when>
						<c:otherwise>
							<strong>${invoice.user.firstName}&nbsp;${invoice.user.middleName}&nbsp;${invoice.user.lastName}</strong>
						</c:otherwise>
					</c:choose>
					<br>VILLAGE : ${invoice.user.nativeVillage}&nbsp; TALUKA :
					${invoice.user.nativeTaluka}&nbsp;DIST. :
					${invoice.user.nativeDistrict}<br> PHONE :
					${invoice.user.mobileNumber}

				</div>
				<!-- /.col -->
				<div class="col-xs-4">
					Receipt No.&nbsp;:&nbsp;14522152<br /> Receipt
					Date&nbsp;:&nbsp;${invoice.invoiceDate}
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
		<div style="border: 1px solid; padding: 10px">
			<!-- title row -->
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
							${invoice.user.student.hostel.address}</p>
						<p
							style="margin: 0; text-align: center; position: relative; font-weight: 500;">Trust
							Regd. No. F-59 DT. 12-07-1955, Society Regd. No. 3171 DT.
							19-02-1955</p>

					</div>


				</div>
				<div class="col-xs-4">
					Phone: (079) ${invoice.user.student.hostel.contactNumber}<br>
					FCRA Reg. No 041910252<br>
				</div>
				<div class="col-xs-8" style="text-align: right;">
					Email: sphostel@gmail.com<br> Website: www.sspkm.org

				</div>
				<!-- /.col -->
			</div>
			<hr>
			<h2 class="page-header2"></h2>
			<div class="row invoice-info">
				<div class="col-xs-8">
					<c:choose>
						<c:when test="${invoice.invoiceType == 'SHREE DONATION'}">
							<strong>M/s.&nbsp;${invoice.user.parent.parent_firstName}&nbsp;${invoice.user.parent.parent_middleName}&nbsp;${invoice.user.parent.parent_lastName}</strong>
						</c:when>
						<c:otherwise>
							<strong>${invoice.user.firstName}&nbsp;${invoice.user.middleName}&nbsp;${invoice.user.lastName}</strong>
						</c:otherwise>
					</c:choose>
					<br>VILLAGE : ${invoice.user.nativeVillage}&nbsp; TALUKA :
					${invoice.user.nativeTaluka}&nbsp;DIST. :
					${invoice.user.nativeDistrict}<br> PHONE :
					${invoice.user.mobileNumber}

				</div>
				<!-- /.col -->
				<div class="col-xs-4">
					Receipt No.&nbsp;:&nbsp;14522152<br /> Receipt
					Date&nbsp;:&nbsp;${invoice.invoiceDate}
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

</c:forEach>