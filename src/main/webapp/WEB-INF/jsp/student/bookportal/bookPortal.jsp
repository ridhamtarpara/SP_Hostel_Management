<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="pagedListHolder" scope="request"
	type="org.springframework.beans.support.PagedListHolder<sspkm.models.bookportal.Book>" />
<c:url value="/student/bookPortal" var="pagedLink">
	<c:param name="action" value="list" />
	<c:param name="p" value="~" />
</c:url>
<section class="content-header">
	<h1>Book Portal</h1>
</section>
<section class="content">
	<div class="row">
		<a href="<c:url value='/student/bookPortalList'/>"><button
				class="btn btn-primary center-block">Search/Sort</button></a>
		<div class="col-xs-12">
			<c:forEach items="${pagedListHolder.pageList}" var="book">
				<c:if test="${book.student.user.gender eq user.gender}">
					<div class="book ol-xs-12 col-md-4 col-sm-6">
						<h4>
							<label class="col-md-12">${book.name}</label>
						</h4>
						<div class="col-md-6">
							<img alt="" class="bookimg"
								src="<c:url value='/dist/img/books/book_${book.bookId}.jpg'/>">
						</div>
						<div class="col-md-6">
							<table class="table">
								<tr>
									<th>Price</th>
									<td>${book.price}</td>
								</tr>
								<tr>
									<th>Semester</th>
									<td>${book.semester}</td>
								</tr>
							</table>
						</div>
						<hr>
						<table class="table table-hover" style="margin-bottom: 5px;">
							<tr>
								<th>Posted By</th>
								<td>${book.student.user.firstName}&nbsp;${book.student.user.lastName}</td>
							</tr>
							<tr>
								<th>Course</th>
								<td>${book.student.course.subCourseName}</td>
							</tr>
							<tr>
								<th>Author</th>
								<td>${book.author}</td>
							</tr>
							<tr>
								<th>Publication</th>
								<td>${book.publication}</td>
							</tr>
						</table>
						<hr>
						<a class="" href='<c:url value="/student/books/${book.bookId}" />'><button
								class="btn btn-primary center-block" style="margin-top: 3px;">View
								Detail</button></a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="row center-block" style="margin-top: 20px;">
		<tg:paging pagedListHolder="${pagedListHolder}"
			pagedLink="${pagedLink}" />
	</div>
</section>