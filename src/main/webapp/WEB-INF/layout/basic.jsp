<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="head" />
</head>
<body class="hold-transition register-page">
	<header> <tiles:insertAttribute name="header" /> </header>
	<div class="register-box" style="width: 80%">
		<div class="wrapper"
			style="background-color: #d2d6de; margin-left: 5%; margin-right: 5%">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$("input,textarea").not("[type=submit]").jqBootstrapValidation();
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('#datepicker').datepicker({
				format : 'yyyy-mm-dd'
			});
		});
	</script>
	<tiles:insertAttribute name="scripts" />
</body>
</html>