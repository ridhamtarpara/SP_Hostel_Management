<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(function() {
		$("input,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>Add Report</h1>
</section>

<!-- Main content -->
<section class="content" style="width: 90%">

	<!-- Horizontal Form -->
	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">Report Detail</h3>
		</div>
		<!-- /.box-header -->
		<!-- form start -->
		<form:form modelAttribute="report" class="form-horizontal"
			novalidate="false">

			<div class="box-body">

				<div class="form-group">
					<form:label path="title" class="col-sm-3 control-label">Title</form:label>
					<div class="control-group">
						<div class="controls col-sm-7">
							<form:input path="title" class="form-control" id="title"
								placeholder="Report Title" required="required"
								data-validation-required-message="Please Enter Title"
								 />
							<span style="color: red"> <form:errors path="title" /></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<form:label path="description" class="col-sm-3 control-label">Description</form:label>
					<div class="control-group">
						<div class="controls col-sm-7">
							<form:textarea path="description" cssClass="form-control"
								rows="3" placeholder="Description" required="true"
								data-validation-required-message="Please Enter Description"></form:textarea>
							<span style="color: red"> <form:errors path="description" /></span>
						</div>
					</div>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="submit" class="btn btn-default">Reset</button>
					<button type="submit" class="btn btn-primary pull-right">Add
						Report</button>
				</div>
				<!-- /.box-footer -->
			</div>
		</form:form>
	</div>
	<!-- /.box -->

</section>
<!-- /.content -->

