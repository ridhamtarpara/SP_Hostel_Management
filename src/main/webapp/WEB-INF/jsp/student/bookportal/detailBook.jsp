<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Book Detail</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12 col-md-8">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">${book.name}</h3>
				</div>
				<div class="box-body">
					<div class="col-xs-12 col-md-4" style="margin-bottom: 10px">
						<img style="margin-bottom: 5px" class="col-xs-12" alt=""
							src='<c:url value="/dist/img/books/book_${book.bookId}.jpg"/>'>
						<h3>Posted by:</h3>
						<table class="table table-responsive">
							<tr>
								<th colspan="2">${book.student.user.firstName}&nbsp;${book.student.user.lastName}</th>
							</tr>
							<tr>
								<th>Mobile:</th>
								<td>${book.student.user.mobileNumber}</td>
							</tr>
							<tr>
								<th>Email:</th>
								<td>${book.student.user.email}</td>
							</tr>
						</table>
						<a
							href="<c:url value='/student/searchuser/profile?userid=${book.student.user.userId}'/>"><button
								class="btn btn-success">Visit profile</button></a>
					</div>
					<div class="col-xs-12 col-md-8">
						<table class="table table-responsive">
							<tr>
								<th>Author</th>
								<td>${book.author}</td>
							</tr>
							<tr>
								<th>Publication</th>
								<td>${book.publication}</td>
							</tr>
							<tr>
								<th>Semester</th>
								<td>${book.semester}</td>
							</tr>
							<tr>
								<th>Course</th>
								<td>${book.course.subCourseName}</td>
							</tr>
							<tr>
								<th>Description</th>
								<td>${book.description}</td>
							</tr>
							<tr>
								<th>Posted on</th>
								<td>${book.date}</td>
							</tr>
							<tr class="bookprice">
								<th>Price</th>
								<td><b>${book.price}</b></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>