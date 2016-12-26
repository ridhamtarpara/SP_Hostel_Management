<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content-header">
	<h1>List Of Receipt</h1>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
					<table class="table table-bordered table-striped dataTable">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Receipt Type</th>
								<th>Amount</th>
								<th>Date</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="invoice" items="${invoices}"
								varStatus="statuss">
								<tr>
									<td>${statuss.count}</td>
									<td>${invoice.user.firstName}&nbsp;${invoice.user.middleName}&nbsp;${invoice.user.lastName}</td>
									<td>${invoice.invoiceType}</td>
									<td>${invoice.amount}</td>
									<td>${invoice.invoiceDate}</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->

		</div>
	</div>
</section>