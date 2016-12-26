<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/simple-line-icons.css'/>">
<div class="register-logo">
	<b>Applicant form</b>
</div>
<div class="progress">
	<div class="progress-bar progress-bar-striped active"
		role="progressbar" aria-valuenow="66" aria-valuemin="0"
		aria-valuemax="100" style="width: 66%">Form&nbsp;:&nbsp;66%&nbsp;Complete</div>
</div>
<section>
	<form action="" class="form-horizontal" method="post" novalidate>
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Educational Details</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="10th_per" class="col-sm-3 control-label">10th
								Percentage</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<div class="input-group">
										<spring:bind path="result.x">
											<input type="text" class="form-control" id="10th_per"
												name="${status.expression}" value="${status.value}"
												placeholder="10th Percentage" required
												data-validation-required-message="Please Enter 10th Percentage"
												data-validation-regex-regex="\d+(\.\d{1,2})?"
												data-validation-regex-message="Only Numbers allowed" />
											<span class="input-group-addon">%</span>
										</spring:bind>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="12th_per" class="col-sm-3 control-label">12th
								Percentage</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<div class="input-group">
										<spring:bind path="result.xii">
											<input type="text" class="form-control" id="12th_per"
												name="${status.expression}" value="${status.value}"
												placeholder="12th Percentage" required
												data-validation-required-message="Please Enter 12th Percentage"
												data-validation-regex-regex="\d+(\.\d{1,2})?"
												data-validation-regex-message="Only Numbers allowed" />
											<span class="input-group-addon">%</span>
										</spring:bind>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Course</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="course.subCourseId">
										<select id="course" class="form-control"
											name="${status.expression}">
											<option selected="selected" disabled="disabled">Select...</option>
											<c:forEach items="${courses}" var="course">
												<option value="${course.subCourseId}">${course.subCourseName}</option>
											</c:forEach>
										</select>
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">College</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="college.collegeId">
										<select id="college" class="form-control"
											name="${status.expression}">
											<option selected="selected" disabled="disabled">Select...</option>
											<c:forEach items="${colleges}" var="college">
												<option value="${college.collegeId}">${college.collegeName}</option>
											</c:forEach>
										</select>
									</spring:bind>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="control-group">
							<div class="controls col-sm-offset-3 col-sm-6">
								<div class="checkbox">
									<label> <input type="checkbox" required
										data-validation-required-message="You must agree to the terms and conditions" />
										Accept <a href="#">Terms &amp; Conditions</a>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="box-footer row">
						<div class="col-md-3">
							<button type="reset" class="btn pull-left btn-danger">Reset</button>
						</div>
						<div class="col-md-3 pull-right">
							<button type="submit" class="btn btn-primary pull-right">Continue</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>