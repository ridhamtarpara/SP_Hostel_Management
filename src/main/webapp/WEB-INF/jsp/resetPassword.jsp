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
				<b>Enter New Password</b>
			</p>
			<div>
				<form method="post">
					<div class="control-group">
						<div class="controls col-sm-12">
							<input type="password" name="password" class="form-control"
								placeholder="Password" required
								data-validation-required-message="Please Enter Password"
								minlength="6"
								data-validation-minlength-message="Min 6 characters"
								maxlength="20"
								data-validation-maxlength-message="Max 20 characters" />
						</div>
					</div>
					<div class="control-group">
						<div class="controls col-sm-12">
							<input type="password" class="form-control"
								placeholder="Enter Same Password Again"
								data-validation-matches-match="password"
								data-validation-matches-message="Password Must Match" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<button type="submit" class="btn btn-primary btn-block btn-flat">Reset
								Password</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</security:authorize>