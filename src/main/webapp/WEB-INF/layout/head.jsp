<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/dist/img/favicon.ico' />" type="image/x-icon"
	rel="shortcut icon" />

<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'/>">
<!--     <link rel="stylesheet" -->
<%--     href="<c:url value='/dist/css/font-awesome.min.css'/>"> --%>

<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.css'/>"> --%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/jquery-ui.min.css'/>">

<!-- <link rel="stylesheet" -->
<!--     href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.11/css/dataTables.bootstrap.css"> -->
<link rel="stylesheet"
	href="<c:url value='/dist/css/dataTables.bootstrap.css'/>">

<!-- <link rel="stylesheet" -->
<%--     href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.min.css'/>"> --%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/bootstrap-datepicker.min.css'/>">

<!-- Theme style -->
<link rel="stylesheet" href="<c:url value='/dist/css/AdminLTE.css'/>">


<link rel="stylesheet"
	href="<c:url value='/dist/css/skins/skin-blue.min.css'/>">

<!-- jQuery 2.1.4 -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
<script src="<c:url value='/dist/js/jquery.js'/>"></script>
<style>
.tooltip-inner {
	width: 200px;
}
</style>
<script>
	$(function() {

		$('.dataTable').DataTable({
			"paging" : true,
			"lengthChange" : true,
			"searching" : true,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false
		});
	});
</script>