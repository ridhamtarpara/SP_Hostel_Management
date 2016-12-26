<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="student/index">Student</a>
<a href="admin/index">Admin</a>
<a href="rector/index">Rector</a>
<a href="trustee/index">Trustee</a>
<a href="basicRegister">Register</a>
<security:authorize access="anonymous">
<a href="login">Login</a>
</security:authorize>
<security:authorize access="hasRole('ROLE_ADMIN')">
<a href="admin/index">Home</a>
</security:authorize>
<security:authorize access="hasRole('ROLE_RECTOR')">
<a href="rector/index">Home</a>
</security:authorize>
<security:authorize access="hasRole('ROLE_TRUSTEE')">
<a href="trustee/index">Home</a>
</security:authorize>
<security:authorize access="not hasRole('ROLE_RECTOR')">
<security:authorize access="not hasRole('ROLE_ADMIN')">
<security:authorize access="not hasRole('ROLE_TRUSTEE')">
<security:authorize access="authenticated">
<a href="student/index">Home</a>
</security:authorize>
</security:authorize>
</security:authorize>
</security:authorize>
<a href="checkStatus">Check Status</a>
</body>
</html>