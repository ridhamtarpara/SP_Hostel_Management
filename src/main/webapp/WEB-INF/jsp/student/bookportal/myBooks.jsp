<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Book Portal</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<c:if test="${empty myBooks}">No Books Added by you.<div
					class="nav-tabs-custom">
					<label>Add New Book Here : </label> <a
						href="<c:url value='/student/addBook'/>"><button
							class="btn btn-primary">Add New Book</button></a>
				</div>
			</c:if>
			<c:if test="${not empty error}">
				<div class="alert alert-danger" role="alert">
					<strong>Ooops!</strong>&nbsp;${error}
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
			<c:remove var="error" />
			<c:forEach items="${myBooks}" var="book">
				<div class="book col-xs-12 col-md-4 col-sm-6">
					<h4>
						<label class="col-md-12">${book.name}</label>
					</h4>
					<div class="col-md-6">
						<img alt="" class="bookimg"
							src="<c:url value='/dist/img/books/book_${book.bookId}.jpg'/>">
					</div>
					<div class="col-md-6">
						<table class="table">
							<tr>
								<th>Price</th>
								<td>${book.price}</td>
							</tr>
							<tr>
								<th>Semester</th>
								<td>${book.semester}</td>
							</tr>
						</table>
					</div>
					<hr>
					<table class="table table-hover" style="margin-bottom: 5px;">
						<tr>
							<th>Posted By</th>
							<td>${book.student.user.firstName}&nbsp;${book.student.user.lastName}</td>
						</tr>
						<tr>
							<th>Author</th>
							<td>${book.author}</td>
						</tr>
						<tr>
							<th>Publication</th>
							<td>${book.publication}</td>
						</tr>
					</table>
					<hr>
					<a data-target="#myModal${book.bookId}" data-toggle="modal"><button
							class="btn btn-danger pull-left">Remove Book</button></a> <a
						href='<c:url value="/student/books/${book.bookId}" />'><button
							class="btn btn-primary pull-right">View Detail</button></a>
				</div>
				<div class="modal fade" id="myModal${book.bookId}" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					style="margin-top: 100px;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">Remove
									Book(${book.name})</h4>
							</div>
							<div class="modal-body">Are you sure you want to remove
								${book.name} of ${book.author} ?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
								<a href='<c:url value="/student/removeBook/${book.bookId}" />'><button
										type="submit" class="btn btn-danger">Remove</button> </a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>