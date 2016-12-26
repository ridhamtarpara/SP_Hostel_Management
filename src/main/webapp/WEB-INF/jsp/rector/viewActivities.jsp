<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section class="content-header">
	<h1>Activities</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body table-responsive">
					<table
						class="table table-bordered table-responsive table-striped dataTable">
						<thead>
							<tr>
								<th>#</th>
								<th>Type</th>
								<th>Title</th>
								<th>Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${activities}" var="activity" varStatus="loop">
								<tr>
									<td>${loop.index+1}</td>
									<td>${activity.type}</td>
									<td>${activity.title}</td>
									<td>${activity.date}</td>
									<td>
										<div>
											<button type="button" class="btn btn-primary view"
												data-toggle="modal" data-target="#activity"
												onclick="getActivity(${activity.activityId});">View</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="activity" class="modal fade" role="dialog" tabindex="-1"
					aria-labelledby="gridModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Activity</h4>
							</div>
							<div class="modal-body">
								<div class="table-responsive">
									<table class="table table-bordered table-striped">
										<tbody>
											<tr>
												<th>Type</th>
												<td><span id="type"></span></td>
											</tr>
											<tr>
												<th>Title</th>
												<td><span id="title"></span></td>
											</tr>
											<tr>
												<th>Description</th>
												<td><span id="description"></span></td>
											</tr>
											<tr>
												<th>Date</th>
												<td><span id="date"></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>