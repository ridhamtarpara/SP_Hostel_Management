<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(function() {
		$("input,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>
<section class="content-header">
	<h1>Vehicle Register</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Vehicle Register</a></li>
	</ol>
</section>
<section class="content">
	<div class="box box-info vehicle">
		<div class="box-header with-border">
			<h3 class="box-title">Vehicle Ragister</h3>
		</div>
		<form:form modelAttribute="vehicleRegister" cssClass="form-horizontal"
			method="post" novalidate="false">
			<div class="box-body">
				<div class="form-group">
					<form:label path="vehicleNumber" cssClass="col-sm-2 control-label">Vehicle Number&nbsp;(XX 99 XX 9999)</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:input path="vehicleNumber" type="text"
								cssClass="form-control" id="vehicle_no"
								placeholder="vehicle Number" required="required"
								data-validation-required-message="Please Enter Vehicle Number"
								data-validation-regex-regex="^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$"
								data-validation-regex-message="Enter Valid Indian Vehicle Number" />
							<span style="color: red"> <form:errors
									path="vehicleNumber" /></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="vehicleModel" cssClass="col-sm-2 control-label">Vehicle Model</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:input path="vehicleModel" type="text" cssClass=""
								class="form-control" id="vehicle_type"
								placeholder="vehicle Model" required="required"
								data-validation-required-message="Please Enter Vehicle Model" />
							<span style="color: red"> <form:errors path="vehicleModel" /></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="licenceNumber" cssClass="col-sm-2 control-label">Licence Number</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:input path="licenceNumber" type="text" cssClass=""
								class="form-control" id="vehicle_type"
								placeholder="Licence Number" required="required"
								data-validation-required-message="Please Enter Vehicle Model" />
							<span style="color: red"> <form:errors
									path="licenceNumber" /></span>
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