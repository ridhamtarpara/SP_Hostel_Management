<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="head" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="sidebar" />
		<div class="content-wrapper">
			<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
	<tiles:insertAttribute name="scripts" />
	<script type="text/javascript">
		$(function() {
			$("input,textarea").not("[type=submit]").jqBootstrapValidation();
		});
	</script>
</body>
</html>