<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/'/>"> <span
				class="brandicon icon-grid" style="font-weight: bold; color: #bbb"></span>
				<span class="brandname" style="font-weight: bold; color: #bbb">S.P.Hostels</span>
			</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value='/'/>#about"><span
						class="btnicon icon-diamond"></span>About</a></li>
				<li><a href="<c:url value='/'/>#services"><span
						class="btnicon icon-cup"></span>Services</a></li>
				<li><a href="<c:url value='/'/>#portfolio"><span
						class="btnicon icon-rocket"></span>Activities</a></li>
				<li><a href="<c:url value='/'/>#testimonials"><span
						class="btnicon icon-bubble"></span>Testimonials</a></li>
				<li><a href="<c:url value='/'/>#contact"><span
						class="btnicon icon-plus"></span>Contact</a></li>
				<li><a href="<c:url value='trust'/>"><span
						class="btnicon icon-cloud-download"></span>Trust</a></li>
				<security:authorize access="anonymous">
					<li><a href="<c:url value='basicRegister'/>"><span
							class="btnicon icon-user-follow"></span>Register</a></li>
				</security:authorize>
				<security:authorize access="anonymous">
					<li><a href="<c:url value='login'/>"><span
							class="btnicon icon-login"></span>Login</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="<c:url value='admin/index'/>"><span
							class="btnicon icon-users"></span>${user.firstName}&nbsp;${user.lastName}</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_RECTOR')">
					<li><a href="<c:url value='rector/index'/>"><span
							class="btnicon icon-users"></span>${user.firstName}&nbsp;${user.lastName}</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_TRUSTEE')">
					<li><a href="<c:url value='trustee/index'/>"><span
							class="btnicon icon-users"></span>${user.firstName}&nbsp;${user.lastName}</a></li>
				</security:authorize>
				<security:authorize access="authenticated and principal.evaluator">
					<li><a href="<c:url value='student/index'/>"><span
							class="btnicon icon-users"></span>${user.firstName}&nbsp;${user.lastName}</a></li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>