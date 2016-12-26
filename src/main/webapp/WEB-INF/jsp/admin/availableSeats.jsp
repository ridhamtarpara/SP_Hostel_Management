<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Student List</h1>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Total Seats</th>
								<th>Filled Seats</th>
								<th>Available Seats</th>
							</tr>
						</thead>
						<c:forEach var="hostel" items="${hostels}" varStatus="x">
							<tr>
								<td>${x.count}</td>
								<td>${hostel.hostelName}</td>
								<td>${hostel.seats}</td>
								<td>${hostel.seats-hostel.availableSeats}</td>
								<td>${hostel.availableSeats}</td>
								
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>