<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(function() {
		$("input,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>
<section class="content-header">
	<h1>Complaint</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Complaint</a></li>
	</ol>
</section>
<section class="content">
	<div class="box box-info complaint">
		<div class="box-header with-border">
			<h3 class="box-title">Complaint Form</h3>
		</div>
		<form:form modelAttribute="complaint" cssClass="form-horizontal"
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
					<form:label path="complaintType" cssClass=""
						class="col-sm-2 control-label">Complaint Type:</form:label>
					<div class="col-sm-10">
						<form:select path="complaintType" name="" id="complaintType"
							cssClass="form-control" required="required">
							<form:option value="" disabled="disabled" selected="selected">Select...</form:option>
							<form:option value="plumbingcomplaint">Plumbing Complaint</form:option>
							<form:option value="cleanercomplaint">Electricity Complaint</form:option>
							<form:option value="foodcomplaint">Furniture Complaint</form:option>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<form:label path="detail" cssClass="col-sm-2 control-label">Detail</form:label>
					<div class="control-group">
						<div class="controls col-sm-10">
							<form:textarea path="detail" cssClass="form-control" rows="3"
								placeholder="Enter Detail" required="required"
								data-validation-required-message="Please Enter Detail"></form:textarea>
							<span style="color: red"> <form:errors path="detail" /></span>
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