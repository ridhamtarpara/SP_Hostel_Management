<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<security:authorize access="anonymous">
	<div class="login-box">
		<div class="login-logo">
			<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>" height="80"
				width="80"> <a href="<c:url value="/"/>"><b>SSPKM</b></a>
		</div>
		<div class="login-box-body">
			<p class="login-box-msg">
				<b>Sign in to start your session</b>
			</p>
			<div>
				<form action="<c:url value='/j_spring_security_check' />"
					method="post">
					<div class="form-group has-feedback">
						<input name="j_username" type="email" class="form-control"
							placeholder="Email"> <span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input name="j_password" type="password" class="form-control"
							placeholder="Password"> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<c:if
						test="${not empty sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}">
						<p class="login-box-error">
							<b>Invalid Login Credentials</b>
						</p>
					</c:if>
					<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
					<div class="row">
						<div class="col-xs-8">
							<div class="checkbox icheck">
								<label> <input type="checkbox"
									name="_spring_security_remember_me" /> Remember Me
								</label>
							</div>
						</div>
						<div class="col-xs-4">
							<button type="submit" class="btn btn-primary btn-block btn-flat">Sign
								In</button>
						</div>
					</div>
				</form>
				<a href="<c:url value="forgetPassword"/>">Forgot Your Password..<span
					class="fa fa-question"></span>
				</a><br>
			</div>
		</div>
	</div>
</security:authorize>