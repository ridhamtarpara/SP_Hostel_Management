<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value='/dist/js/ajax.js'/>"></script>
<div class="container">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="width: 150px;">Date</th>
				<th>Report</th>
				<th>Detail</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="report" items="${reports}">
				<tr>
					<td>${report.date}</td>
					<td><a target="_blank" href="#">${report.title}</a></td>
					<td>${report.description}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>