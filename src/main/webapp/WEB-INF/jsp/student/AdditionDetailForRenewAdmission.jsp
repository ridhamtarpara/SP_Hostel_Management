<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<section class="content-header">
	<h1>Apply For Next Year</h1>
</section>
<section class="content">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">Add Latest Result</h3>
		</div>
		<div class="box-body">
			<div class="alert alert-info" role="alert">
				<strong>Wait!! </strong>&nbsp;If you haven't got your result still
				then please enter <strong class="text-black">0</strong> in
				particular result.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="alert alert-info" role="alert">
				<strong>Little More!!</strong><br /> <i class="fa fa-circle"></i>
				If your institution gives result in <strong class="text-black">percentage(%)</strong>
				then divide it by 10 and then enter the particular result.<br /> <i
					class="fa fa-circle"></i> If your institution gives result in <strong
					class="text-black">yearly</strong> then enter same result in both
				the semester for that year.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form modelAttribute="result" novalidate="novalidate">
				<div class="form-group">
					<c:choose>
						<c:when test="${user.student.currentYear==1}">
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 1</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem1" type="number" class="form-control"
											placeholder="Semester 1" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 2</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem2" type="number" class="form-control"
											placeholder="Semester 2" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${user.student.currentYear==2}">
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 2</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem2" type="number" class="form-control"
											value="${user.result.sem2}" placeholder="Semester 2"
											required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 3</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem3" type="number" class="form-control"
											placeholder="Semester 3" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 4</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem4" type="number" class="form-control"
											placeholder="Semester 4" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${user.student.currentYear==3}">
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 4</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem4" type="number" class="form-control"
											value="${user.result.sem4}" placeholder="Semester 4"
											required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 5</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem5" type="number" class="form-control"
											placeholder="Semester 5" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 6</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem6" type="number" class="form-control"
											placeholder="Semester 6" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${user.student.currentYear==4}">
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 6</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem6" type="number" class="form-control"
											value="${user.result.sem6}" placeholder="Semester 6"
											required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 7</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem7" type="number" class="form-control"
											placeholder="Semester 7" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label path=""
									cssClass="col-sm-2 control-label align-right">Semester 8</form:label>
								<div class="control-group">
									<div class="controls col-sm-10">
										<form:input path="sem7" type="number" class="form-control"
											placeholder="Semester 7" required="true"
											data-validation-required-message="Please Enter Result"
											max="10" min="0" />
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
					<div class="form-group">
						<form:label path="" cssClass="col-sm-2 control-label align-right">Want Same Room</form:label>
						<div class="control-group">
							<div class="controls col-sm-10">
								<input type="radio" name="sameRoomPreference" value="true"
									required="required"> Yes <input type="radio"
									name="sameRoomPreference" value="false"> No
							</div>
						</div>
					</div>
					<div class="box-footer">
						<div class="col-md-3">
							<button type="reset" class="btn pull-left btn-danger">Reset</button>
						</div>
						<div class="col-md-3 pull-right">
							<button type="submit" class="btn btn-primary pull-right">Apply</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(function() {
		$("input,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>