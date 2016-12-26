<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<section class="content-header">
	<h1>Add Request</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-3">
			<!-- small box -->
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>${leave}</h3>
					<p>Leave Application</p>
				</div>
				<div class="icon" style="margin-top: 10px">
					<i class="ion ion-clipboard"></i>
				</div>
				<a href="<c:url value='/student/leaveApplication'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-xs-3">
			<div class="small-box bg-green">
				<div class="inner">
					<h3>${complaint}</h3>
					<p>Complaints</p>
				</div>
				<div class="icon" style="margin-top: 10px">
					<i class="ion ion-compose"></i>
				</div>
				<a href="<c:url value='/student/complaint'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-xs-3">
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${vehicle}</h3>
					<p>Vehicle Register</p>
				</div>
				<div class="icon" style="margin-top: 10px">
					<i class="ion ion-model-s"></i>
				</div>
				<a href="<c:url value='/student/vehicleRegister'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-xs-3">
			<div class="small-box bg-red">
				<div class="inner">
					<h3>${achievement}</h3>
					<p>Achievement</p>
				</div>
				<div class="icon" style="margin-top: 10px">
					<i class="ion ion-trophy"></i>
				</div>
				<a href="<c:url value='/student/achievement'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
	</div>
</section>