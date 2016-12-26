<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script>

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
		<div class="col-xs-4">
			<!-- small box -->
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>${approvedApplicants}</h3>
					<p>Approved Applicants</p>
				</div>
				<div class="icon">
					<i class="ion ion-person-add"></i>
				</div>
				<a href="<c:url value='/admin/viewNewApplications'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-xs-4">
			<!-- small box -->
			<div class="small-box bg-green">
				<div class="inner">
					<h3>${applicants}</h3>
					<p>Applicants</p>
				</div>
				<div class="icon">
					<i class="ion ion-person-add"></i>
				</div>
				<a href="<c:url value='/admin/viewNewApplications'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-xs-4">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${students}</h3>
					<p>Students</p>
				</div>
				<div class="icon">
					<i class="ion ion-ios-people"></i>
				</div>
				<a href="<c:url value='/admin/viewStudents'/>"
					class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-md-6">
			<!-- RECTORS LIST -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Rectors</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<c:if test="${not empty rectors}">
					<div class="box-body no-padding">
						<ul class="users-list clearfix">
							<c:forEach var="rectors" items="${rectors}" begin="0" end="7">
								<li><img
									src="<c:url value='/dist/img/user/${rectors.user.userId}/self${rectors.user.appliedOn.getTime()}.jpg'/>"
									alt="User Image">
									<div class="users-list-name">${rectors.user.firstName}
										&nbsp;${rectors.user.lastName}</div></li>
							</c:forEach>
						</ul>
						<!-- /.users-list -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer text-center">
						<a href="<c:url value='/admin/viewRectors'/>" class="uppercase">View
							All Rector</a>
					</div>
					<!-- /.box-footer -->
				</c:if>
				<c:if test="${empty rectors}">
					<div class="box-body text-center">No Rector</div>

				</c:if>
			</div>
			<!--/.box -->
			<!-- REPORT LIST -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Recently Added Reports</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<c:if test="${not empty reports}">
					<div class="box-body">
						<ul class="products-list product-list-in-box">
							<c:forEach var="reports" items="${reports}" begin="0" end="4">
								<li class="item"><div class="product-title">${reports.title}
										<span class="label label-success pull-right">${reports.date}</span>
									</div> <span class="product-description">${reports.description}</span></li>
							</c:forEach>
						</ul>
					</div>
					<!-- /.box-body -->
					<div class="box-footer text-center">
						<a href="<c:url value='/admin/viewReports'/>" class="uppercase">View
							All Reports</a>
					</div>
					<!-- /.box-footer -->
				</c:if>
				<c:if test="${empty reports}">
					<div class="box-body text-center">No Report</div>
				</c:if>
			</div>
			<!-- /.box -->

		</div>
		<!-- /.col -->
		<div class="col-md-6">
			<!-- TRUSTEES LIST -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Trustee</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<c:if test="${not empty trustees}">
					<div class="box-body no-padding">
						<ul class="users-list clearfix">
							<c:forEach var="trustees" items="${trustees}" begin="0" end="7">
								<li><img
									src="<c:url value='/dist/img/user/${trustees.user.userId}/self${trustees.user.appliedOn.getTime()}.jpg'/>"
									alt="User Image">
									<div class="users-list-name">${trustees.user.firstName}
										&nbsp;${trustees.user.lastName}</div> <span class="users-list-date">${trustees.designation}</span></li>
							</c:forEach>
						</ul>
						<!-- /.users-list -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer text-center">
						<a href="<c:url value='/admin/viewTrustees'/>" class="uppercase">View
							All Trustee</a>
					</div>
					<!-- /.box-footer -->
				</c:if>
				<c:if test="${empty trustees}">
					<div class="box-body text-center">No Trustee</div>
				</c:if>
			</div>
			<!--/.box -->
			<!-- CHART -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Students</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="row">
						<div class="col-md-8">
							<div class="chart-responsive">
								<canvas id="pieChart" height="200"></canvas>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" style="margin-top: 10px">
							<ul class="chart-legend clearfix">
								<li></li>
								<c:forEach items="${hostels}" var="hostel" varStatus="">
									<li><i class="fa fa-circle text-aqua"></i>
										${hostel.hostelName}:${hostel.seats}</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="box-footer text-center">
					<a href="<c:url value='/admin/availableSeats'/>" class="uppercase">View
						Available Seats</a>
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

</section>
<script src="../dist/js/Chart.min.js" /></script>
<script>
	var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
	var pieChart = new Chart(pieChartCanvas);
	var PieData = [
	               <c:forEach items="${hostels}" var="hostel" varStatus="x"> {
		value : ${hostel.seats},
		<c:if test='${x.count==1}'>
		color :"#f56954",
		highlight : "#f56954",</c:if>
		<c:if test='${x.count==2}'>
		color :"#f39c12",
		highlight :"#f39c12",</c:if>
		<c:if test='${x.count==3}'>
		color :"#00a65a",
		highlight :"#00a65a",</c:if>
		label : "${hostel.hostelName}"
	},	</c:forEach>];
	var pieOptions = {
		segmentShowStroke : true,
		segmentStrokeColor : "#fff",
		segmentStrokeWidth : 1,
		percentageInnerCutout : 35,
		animationSteps : 100,
		animationEasing : "easeOutBounce",
		animateRotate : true,
		animateScale : false,
		responsive : true,
		maintainAspectRatio : false,
	};
	pieChart.Doughnut(PieData, pieOptions);
</script>