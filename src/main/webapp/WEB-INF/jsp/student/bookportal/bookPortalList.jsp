<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>View Request</h1>
</section>
<script>
	$(function() {

		$('.request').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : true,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false
		});
	});
</script>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<a href="<c:url value='/student/bookPortal'/>"><button
					class="btn btn-primary center-block">Grid View</button></a>
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Book List</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body table-responsive">
					<table
						class="table table-bordered table-hover table-striped request table-responsive">
						<thead>
							<tr>
								<th>Title</th>
								<th>Author</th>
								<th>Publication</th>
								<th>Semester</th>
								<th>Course</th>
								<th>Price</th>
								<th>View</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="book" items="${books}">
								<c:if test="${book.student.user.gender eq user.gender}">
									<tr>
										<td>${book.name}</td>
										<td>${book.author}</td>
										<td>${book.publication}</td>
										<td>${book.semester}</td>
										<td>${book.student.course.subCourseName}</td>
										<td>${book.price}</td>
										<td>
											<div>
												<a href='<c:url value="/student/books/${book.bookId}" />'><button
														class="btn btn-primary">View Detail</button></a>
											</div>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>