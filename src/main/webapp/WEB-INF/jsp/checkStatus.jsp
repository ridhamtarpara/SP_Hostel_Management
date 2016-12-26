<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/simple-line-icons.css'/>">
<section>
	<form:form modelAttribute="applicantApplication"
		class="form-horizontal">
		<div class="box box-primary">
			<!-- Personal Detail -->
			<div class="box-header with-border">
				<h3 class="box-title">Check Status</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<form:label path="applicationId" class="col-sm-3 control-label">Enter Application ID</form:label>
					<div class="col-sm-6">
						<form:input path="applicationId" class="form-control"
							placeholder="Application Id" />
						<span style="color: red"> <form:errors path="applicationId" /></span>
					</div>
				</div>
				<div class="box-footer">
					<button type="reset" class="btn btn-default">Reset</button>
					<button type="submit" class="btn btn-primary pull-right">Continue</button>
				</div>
			</div>
		</div>
	</form:form>
</section>