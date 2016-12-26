<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content">

	<form:form modelAttribute="applicantApplication"
		class="form-horizontal" method="POST">
		<div class="box box-primary">
			<!-- Personal Detail -->
			<div class="box-header with-border">
				<h3 class="box-title">Confirm Admission</h3>
			</div>

			<div class="box-body">

				<div class="form-group">
					<form:label path="applicationId" class="col-sm-3 control-label">Enter Application ID</form:label>
					<div class="col-sm-6">
						<form:input path="applicationId" class="form-control"
							placeholder="Application Id" />
						<span style="color: red"><c:if
								test="${not empty applicationerror}">
								<c:out value="${applicationerror}"></c:out>
							</c:if> <c:remove var="applicationerror" /> </span>
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