<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Discussion Forum</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary col-md-12">
				<div class="box-header">
					<h3 class="box-title">Select Category</h3>
				</div>
				<form method="post">
					<div class="row">
						<label class="col-sm-2">Course Name:</label>
						<div class="col-sm-8">
							<select name="courseSelect" id="courseSelect"
								class="form-control" required onchange="getSubcourse();">
								<option value="" disabled="disabled" selected>Select
									Course</option>
								<c:forEach items="${courses}" var="c">
									<option value="${c.courseId}">${c.courseName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<img alt="Loading" class="loader center-block"
						style="margin-top: 10px; display: none"
						src="<c:url value='/dist/img/ajaxloader32.gif'/>">
					<div class="row" style="margin-top: 20px">
						<label class="col-sm-2 control-label">Sub Course Name:</label>
						<div class="col-sm-8">
							<select name="subCourseSelect" id="subCourseSelect"
								class="form-control" required disabled="disabled">
								<option value="" disabled="disabled" selected>Select
									Sub Course</option>
							</select>
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