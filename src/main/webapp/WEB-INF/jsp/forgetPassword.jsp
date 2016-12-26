<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<security:authorize access="anonymous">
	<c:if test="${not empty message}">
		<div class="alert alert-success" role="alert">
			<p style="text-align: center;font-weight: bold;">${message}
				<p>
		<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button></div>
	</c:if>
	<c:remove var="message" />
	<div class="login-box">
		<div class="login-logo">
			<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>" height="80"
				width="80"> <a href="<c:url value="/"/>"><b>SSPKM</b></a>
		</div>
		<div class="login-box-body">
			<p class="login-box-msg">
				<b>Enter your Email</b>
			</p>
			<form method="post">
				<div class="form-group has-feedback">
					<input name="email" type="email" class="form-control"
						placeholder="Enter Your Email"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="row center-block">
					<div class="center-block">
						<button type="submit"
							class="btn btn-primary btn-block btn-flat center-block">Reset
							Password</button>
					</div>
				</div>
			</form>
			<br>
		</div>
	</div>
</security:authorize>