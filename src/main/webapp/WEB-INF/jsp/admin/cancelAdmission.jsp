<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content">

	<form:form modelAttribute="users" class="form-horizontal" method="POST">
		<div class="box box-primary">

			<div class="box-header with-border">
				<h3 class="box-title">Cancel Admission</h3>
			</div>

			<div class="box-body">

				<div class="form-group">
					<form:label path="email" class="col-sm-3 control-label">Enter Student Email </form:label>
					<div class="col-sm-6">
						<form:input type="email" path="email" class="form-control"
							placeholder="Email Id" required="true" />
						<span style="color: red"><c:if
								test="${not empty emailerror}">
								<c:out value="${emailerror}"></c:out>
							</c:if> <c:remove var="emailerror" /> </span>
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