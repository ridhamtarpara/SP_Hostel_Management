<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section class="content-header">
	<h1>Rectors</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Rector</h3>
				</div>
				<div class="box-body table-responsive">
					<table class="table table-bordered table-striped dataTable">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Email</th>
								<th>Mobile No</th>
								<th>Message</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${feedbacks}" var="feedback" varStatus="loop">
								<tr>
									<td>${loop.index+1}</td>
									<td>${feedback.name}</td>
									<td>${feedback.email}</td>
									<td>${feedback.mobileNumber}</td>
									<td>${feedback.message}</td>
									<td>${feedback.date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>