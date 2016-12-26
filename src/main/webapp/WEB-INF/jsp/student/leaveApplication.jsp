<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css">
<script type="text/javascript">
	$(function() {
		$("input,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>
<script>
	$(function() {
		$('#leaveDate').daterangepicker({
			locale : {
				format : 'YYYY-MM-DD'
			}
		});
	});
</script>
<section class="content-header">
	<h1>Leave Application</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Leave Application</a></li>
	</ol>
</section>
<section class="content">
	<div class="box box-info leave">
		<div class="box-header with-border">
			<h3 class="box-title">Leave Application</h3>
		</div>
		<form:form modelAttribute="leaveApplication"
			cssClass="form-horizontal" method="post" novalidate="false">
			<div class="box-body">
				<div class="form-group">
					<form:label path="title" cssClass="col-sm-2 control-label">Title</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:input path="title" type="text" cssClass="form-control"
								id="title" placeholder="Enter Title" required="required"
								data-validation-required-message="Please Enter Title" />
							<span style="color: red"> <form:errors path="title" /></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="address" cssClass="col-sm-2 control-label">Address</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:textarea path="address" cssClass="form-control" rows="2"
								placeholder="Address of where you go" required="required"
								data-validation-required-message="Please Enter Address"></form:textarea>
							<span style="color: red"> <form:errors path="address" /></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="detail" cssClass="col-sm-2 control-label">Reason</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:textarea path="detail" cssClass="form-control" rows="3"
								placeholder="Enter Reason" required="required"
								data-validation-required-message="Please Enter Reason"></form:textarea>
							<span style="color: red"> <form:errors path="detail" /></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="date" cssClass="col-sm-2 control-label">Leave Date</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<form:input type="text" path="date" cssClass="form-control"
									id="leaveDate" placeholder="YYYY-MM-DD - YYYY-MM-DD"
									required="true"
									data-validation-required-message="Please Enter Date" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<button type="reset" class="btn btn-default">Reset</button>
				<button type="submit" class="btn btn-info pull-right">Proceed</button>
			</div>
		</form:form>
	</div>
</section>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>