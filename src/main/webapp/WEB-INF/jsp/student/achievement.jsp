<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(function() {
		$('#datepicker').datepicker({
			format : 'yyyy-mm-dd'
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("input,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>
<section class="content-header">
	<h1>Achievement</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Achievement</a></li>
	</ol>
</section>
<section class="content">
	<div class="box box-info achivement">
		<div class="box-header with-border">
			<h3 class="box-title">Achievement</h3>
		</div>
		<form:form modelAttribute="achievement" cssClass="form-horizontal"
			method="post" novalidate="false">
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
					<form:label path="detail" cssClass="col-sm-2 control-label">Detail</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:textarea path="detail" cssClass="form-control" rows="3"
								placeholder="Enter Detail" required="true"
								data-validation-required-message="Please Enter Detail"></form:textarea>
							<span style="color: red"> <form:errors path="detail" /></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="date" cssClass="col-sm-2 control-label">Date</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<form:input path="Date" cssClass="form-control" id="datepicker"
									placeholder="Enter Date" required="true"
									data-validation-required-message="Please Enter Date"
									data-validation-regex-regex="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"
									data-validation-regex-message="Enter Valid Date" />
								<span style="color: red" id="doberror"><form:errors
										path="date" /></span>
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