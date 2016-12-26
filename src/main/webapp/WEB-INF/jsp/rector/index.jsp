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
				<div class="box-header">
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
							<c:forEach var="news" items="${news}">
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
				<div class="box-header">
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
							<c:forEach var="notice" items="${notice}">
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
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>${leave}</h3>
					<p>Leave Application</p>
				</div>
				<div class="icon">
					<i class="ion ion-clipboard"></i>
				</div>
				<a href="<c:url value='/rector/viewRequest'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-green">
				<div class="inner">
					<h3>${complaints}</h3>
					<p>Complaints</p>
				</div>
				<div class="icon">
					<i class="ion ion-compose"></i>
				</div>
				<a href="<c:url value='/rector/viewRequest'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${vehicle}</h3>
					<p>Vehicle Registrations</p>
				</div>
				<div class="icon">
					<i class="ion ion-model-s"></i>
				</div>
				<a href="<c:url value='/rector/viewRequest'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-lg-3 col-xs-6">
			<div class="small-box bg-red">
				<div class="inner">
					<h3>${achievement}</h3>
					<p>Achievement Request</p>
				</div>
				<div class="icon">
					<i class="ion ion-trophy"></i>
				</div>
				<a href="<c:url value='/rector/viewRequest'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-xs-12">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${students}</h3>
					<p>Students</p>
				</div>
				<div class="icon">
					<i class="ion ion-ios-people"></i>
				</div>
				<a href="<c:url value='/rector/viewStudents'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-lg-6 col-xs-12">
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>${activities}</h3>
					<p>Activities</p>
				</div>
				<div class="icon">
					<i class="ion ion-compose"></i>
				</div>
				<a href="<c:url value='/rector/viewActivities'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
	</div>
</section>