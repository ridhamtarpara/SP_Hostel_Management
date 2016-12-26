<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<h1>Add Activity</h1>
</section>
<section class="content" style="width: 90%">
	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">Activity Detail</h3>
		</div>
		<form:form modelAttribute="acitivity" class="form-horizontal"
			method="post" novalidate="false">
			<div class="box-body">
				<div class="form-group">
					<form:label path="type" cssClass="col-sm-3 control-label">Type</form:label>
					<div class="control-group">
						<div class="controls col-sm-7">
							<form:select path="type" class="form-control" id="type">
								<form:option value="">Select...</form:option>
								<form:option value="Event">Add Event</form:option>
								<form:option value="News">Add News</form:option>
								<form:option value="Notice">Add Notice</form:option>
							</form:select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="title" class="col-sm-3 control-label">Title</form:label>
					<div class="control-group">
						<div class="controls col-sm-7">
							<form:input path="title" class="form-control" id="title"
								placeholder="Acitivity Title" required="required"
								data-validation-required-message="Please Enter Title" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:label path="date" class="col-sm-3 control-label">Date</form:label>
					<div class="control-group">
						<div class="controls col-sm-7">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<form:input type="date" path="date" class="form-control"
									id="datepicker" placeholder="Enter Date" required="true"
									data-validation-required-message="Please Enter Date"
									data-validation-regex-regex="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"
									data-validation-regex-message="Enter Valid Date" />
							</div>
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
				<div class="box-footer">
					<button type="submit" class="btn btn-default">Reset</button>
					<button type="submit" class="btn btn-primary pull-right">Add
						Activity</button>
				</div>
			</div>
		</form:form>
	</div>
</section>