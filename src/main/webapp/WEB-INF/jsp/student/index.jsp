<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>
		Welcome, <small>${user.firstName}&nbsp;${user.lastName}</small>
	</h1>
</section>
<section class="content">
	<c:if test="${not empty error}">
		<div class="alert alert-danger" role="alert">
			${error}
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<c:remove var="error" />
	<div class="row">
		<div class="col-xs-12 col-md-6">
			<div class="box box-primary">
				<div class="box-header with-border">
					<i class="ion ion-clipboard"></i>
					<h3 class="box-title">News</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<c:if test="${not empty news}">
					<div class="box-body">
						<ul class="todo-list">
							<c:forEach var="news" items="${news}" begin="0" end="4">
								<li><div class="users-list-name">
										<span class="text">${news.title}</span>
									</div></li>
							</c:forEach>
						</ul>
					</div>
					<div class="box-footer text-center">
						<a href="javascript::" class="uppercase">View All News</a>
					</div>
				</c:if>
				<c:if test="${empty news}">
					<div class="box-body text-center">No news</div>
				</c:if>
			</div>
		</div>
		<div class="col-xs-12 col-md-6">
			<div class="box box-primary">
				<div class="box-header with-border">
					<i class="ion ion-clipboard"></i>
					<h3 class="box-title">Notice</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<c:if test="${not empty notice}">
					<div class="box-body">
						<ul class="todo-list">
							<c:forEach var="notice" items="${notice}" begin="0" end="4">
								<li><div class="users-list-name">
										<span class="text">${notice.title}</span>
									</div></li>
							</c:forEach>
						</ul>
					</div>
					<div class="box-footer text-center">
						<a href="javascript::" class="uppercase">View All Notice</a>
					</div>
				</c:if>
				<c:if test="${empty notice}">
					<div class="box-body text-center">No notice</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<!-- STUDENT BOOK -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">My Books</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<c:if test="${not empty books}">
					<div class="box-body no-padding">
						<ul class="bookimage users-list clearfix">
							<c:forEach var="books" items="${books}">
								<li><img
									src="<c:url value='/dist/img/books/book_${books.bookId}.jpg'/>"
									alt="User Image" class="bookimage">
									<div class="users-list-name">${books.name}</div> <span
									class="users-list-date">${books.price}</span></li>
							</c:forEach>
						</ul>
					</div>
					<div class="box-footer text-center">
						<a href="<c:url value='/student/myBooks'/>" class="uppercase">View
							All Books</a>
					</div>
				</c:if>
				<c:if test="${empty books}">
					<div class="box-body text-center">No Books</div>
				</c:if>
			</div>
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Results</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body">
					<div class="table-responsive">
						<table class="table no-margin">
							<thead>
								<tr>
									<th>#</th>
									<th>Semester/Year</th>
									<th>Percentage</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty result.x}">
									<tr>
										<td><a href="">1</a></td>
										<td>10th</td>
										<td><span class="label label-success">${result.x}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.xii}">
									<tr>
										<td><a href="">2</a></td>
										<td>12th</td>
										<td><span class="label label-warning">${result.xii}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem1}">
									<tr>
										<td><a href="">3</a></td>
										<td>Semester 1</td>
										<td><span class="label label-danger">${result.sem1}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem2}">
									<tr>
										<td><a href="">4</a></td>
										<td>Semester 2</td>
										<td><span class="label label-info">${result.sem2}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem3}">
									<tr>
										<td><a href="">5</a></td>
										<td>Semester 3</td>
										<td><span class="label label-warning">${result.sem3}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem4}">
									<tr>
										<td><a href="">6</a></td>
										<td>Semester 4</td>
										<td><span class="label label-danger">${result.sem4}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem5}">
									<tr>
										<td><a href="">7</a></td>
										<td>Semester 5</td>
										<td><span class="label label-danger">${result.sem5}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem6}">
									<tr>
										<td><a href="">8</a></td>
										<td>Semester 6</td>
										<td><span class="label label-danger">${result.sem5}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem7}">
									<tr>
										<td><a href="">9</a></td>
										<td>Semester 7</td>
										<td><span class="label label-danger">${result.sem7}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty result.sem8}">
									<tr>
										<td><a href="">10</a></td>
										<td>Semester 8</td>
										<td><span class="label label-danger">${result.sem8}</span></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="col-md-6 col-xs-6">
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>${leave}</h3>
						<p>Leave Applications</p>
					</div>
					<div class="icon" style="margin-top: 10px">
						<i class="ion ion-clipboard"></i>
					</div>
					<a href="<c:url value='/student/viewRequest'/>"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<div class="col-md-6 col-xs-6">
				<div class="small-box bg-green">
					<div class="inner">
						<h3>${complaint}</h3>
						<p>Complaints</p>
					</div>
					<div class="icon" style="margin-top: 10px">
						<i class="ion ion-compose"></i>
					</div>
					<a href="<c:url value='/student/viewRequest'/>"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<div class="col-md-6 col-xs-6">
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>${vehicle}</h3>
						<p>Vehicle Registrations</p>
						<div class="icon" style="margin-top: 10px">
							<i class="ion ion-model-s"></i>
						</div>
					</div>
					<a href="<c:url value='/student/viewRequest'/>"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<div class="col-md-6 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>${achievement}</h3>
						<p>Achievement Request</p>
					</div>
					<div class="icon" style="margin-top: 10px">
						<i class="ion ion-trophy"></i>
					</div>
					<a href="<c:url value='/student/viewRequest'/>"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<div class="col-md-12 col-xs-12">
				<div class="box box-primary">
					<div class="box-header">
						<i class="fa fa-comments-o"></i>
						<h3 class="box-title">Forum</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<c:if test="${not empty questions}">
						<div class="box-body chat" id="chat-box">
							<c:forEach var="questions" items="${questions}">
								<!-- chat item -->
								<div class="item">
									<img
										src='<c:url value='/dist/img/user/${questions.student.user.userId}/self${questions.student.user.appliedOn.getTime()}.jpg'/>'
										alt="user image">
									<p class="message">
										<a href="#" class="name"> <small
											class="text-muted pull-right"><i
												class="fa fa-clock-o"></i> ${questions.date }</small> ${ questions.question}
										</a>${ questions.description}
									</p>
								</div>
							</c:forEach>
						</div>
						<div class="box-footer text-center">
							<a href="<c:url value='/student/forum/postQuestion'/>"
								class="uppercase">Post Question</a>
						</div>
					</c:if>
					<c:if test="${empty questions }">
						<div class="box-body text-center">No Question</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-xs-12"></div>
		<div class="col-md-6 col-xs-12"></div>
	</div>
</section>