<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="content-header">
	<h1>Discussion Forum</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary col-md-12">
				<div class="box-header">
					<h3 class="box-title"></h3>
				</div>
				<form method="post">
					<div class="row">
						<label class="col-sm-2">Course Name:</label>
						<div class="col-sm-8">
							<spring:bind path="subCourse.subCourseId">
								<select name="${status.expression}" class="form-control"
									required="required">
									<option selected="selected" disabled="disabled">Select...</option>
									<c:forEach items="${subCourses}" var="subCourse">
										<option value="${subCourse.subCourseId}">${subCourse.subCourseName}</option>
									</c:forEach>
								</select>
							</spring:bind>
						</div>
					</div>
					<div class="row" style="margin-top: 20px">
						<label class="col-sm-2 control-label">Question</label>
						<div class="col-sm-8">
							<spring:bind path="question.question">
								<input class="form-control" name="${status.expression}"
									value="${status.value}" placeholder="Question"
									required="required" />
							</spring:bind>
						</div>
					</div>
					<div class="row" style="margin-top: 20px">
						<label class="col-sm-2 control-label">Question Description</label>
						<div class="col-sm-8">
							<spring:bind path="question.description">
								<textarea class="form-control" name="${status.expression}"
									value="${status.value}" placeholder="Question Description"
									required="required" wrap="physical" cols="6"></textarea>
							</spring:bind>
						</div>
					</div>
					<div class="row">
						<button type="submit"
							class="btn btn-primary center-block proceedbtn">Proceed</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>