<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="S.P.Hostels provides facilities to the students who are studying in Ahmedabad aways from their home">
<meta name="keywords"
	content="S.P.hostel,Saurastra patel,hostel,ahmedabad,sp,boys,girls,hostel">
<meta name="author" content="Ridham tarpara">
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="head" />
</head>
<body data-spy="scroll">
	<header> <tiles:insertAttribute name="preloader" /> <tiles:insertAttribute
		name="header" /> </header>
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	<tiles:insertAttribute name="scripts" />
</body>
</html>