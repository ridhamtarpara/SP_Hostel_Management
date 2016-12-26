<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/simple-line-icons.css'/>">
<div class="register-logo">
	<b>Applicant form</b>
</div>
<div class="progress">
	<div class="progress-bar progress-bar-striped active"
		role="progressbar" aria-valuenow="33" aria-valuemin="0"
		aria-valuemax="100" style="width: 33%">Form&nbsp;:&nbsp;33%&nbsp;Complete</div>
</div>
<section>
	<form action="" class="form-horizontal" method="post" novalidate
		enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Parental Details</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Father Name</label>
							<div class="control-group">
								<div class="controls col-sm-2">
									<spring:bind path="parent.parent_firstName">
										<input id="fatherFname" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="First Name" required
											data-validation-required-message="Please Enter First Name"
											data-validation-regex-regex="^[a-zA-Z]+$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
							<div class="control-group">
								<div class="controls col-sm-2">
									<spring:bind path="parent.parent_middleName">
										<input id="fatherMname" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Middle Name" required
											data-validation-required-message="Please Enter Middle Name"
											data-validation-regex-regex="^[a-zA-Z]+$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
							<div class="control-group">
								<div class="controls col-sm-2">
									<spring:bind path="parent.parent_lastName">
										<input id="fatherLname" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Last Name" required
											data-validation-required-message="Please Enter Last Name"
											data-validation-regex-regex="^[a-zA-Z]+$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Father's Mobile
								Number</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="parent.parent_mobileNumber">
										<input id="fatherMobileNumber" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Mobile Number" required
											data-validation-required-message="Please Enter Mobile Number"
											data-validation-regex-regex="^[789]\d{9}$"
											data-validation-regex-message="Enter Valid Indian Mobile Number" />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">No of Family Member</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="parent.parent_totalMembers">
										<input id="totalMembers" type="number" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="" required />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Father's Business</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="parent.parent_business">
										<input id="fatherBusiness" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Name of Business" required
											data-validation-required-message="Please Enter Business Name"
											data-validation-regex-regex="^[a-zA-Z ]*$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Parent's Income</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<div class="input-group">
										<span class="input-group-addon">Rs.</span>
										<spring:bind path="parent.parent_income">
											<input id="fatherIncome" class="form-control"
												name="${status.expression}" value="${status.value}" required
												data-validation-required-message="Please Enter Income"
												data-validation-regex-regex="^[0-9]+$"
												data-validation-regex-message="Only Numbers allowed" />
										</spring:bind>
										<span class="input-group-addon">.00</span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Parent's Passport
								Size Image</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									(Must be JPEG or PNG file with size less than 500KB)<br /> <input
										type="file" name="parentImage" required="required"
										data-validation-required-message="select JPEG or PNG file with size less than 500KB" />
								</div>
							</div>
						</div>
					</div>
					<br />
					<div class="box-header with-border">
						<h3 class="box-title">Relative Details</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Relative Name</label>
							<div class="control-group">
								<div class="controls col-sm-2">
									<spring:bind path="relative.relative_firstName">
										<input id="relativeFname" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="First Name" required
											data-validation-required-message="Please Enter First Name"
											data-validation-regex-regex="^[a-zA-Z]+$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
							<div class="control-group">
								<div class="controls col-sm-2">
									<spring:bind path="relative.relative_middleName">
										<input id="relativeMname" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Middle Name" required
											data-validation-required-message="Please Enter Middle Name"
											data-validation-regex-regex="^[a-zA-Z]+$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
							<div class="control-group">
								<div class="controls col-sm-2">
									<spring:bind path="relative.relative_lastName">
										<input id="relativeLname" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Last Name" required
											data-validation-required-message="Please Enter Last Name"
											data-validation-regex-regex="^[a-zA-Z]+$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Relative's Mobile
								Number</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="relative.relative_mobileNumber">
										<input id="relativeMobileNumber" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Mobile Number" required
											data-validation-required-message="Please Enter Mobile Number"
											data-validation-regex-regex="^[789]\d{9}$"
											data-validation-regex-message="Enter Valid Indian Mobile Number" />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Relation</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="relative.relative_relation">
										<input id="relation" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Your Relation with Relative" required
											data-validation-required-message="Please Enter Relation"
											data-validation-regex-regex="^[a-zA-Z]+$"
											data-validation-regex-message="Only Alphabets allowed" />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Relative's Address</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<spring:bind path="relative.relative_address">
										<input id="relativeAddress" class="form-control"
											name="${status.expression}" value="${status.value}"
											placeholder="Relative Address" required
											data-validation-required-message="Please Enter Address" />
									</spring:bind>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Relative's Passport
								Size Image</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									(Must be JPEG or PNG file with size less than 500KB)<br /> <input
										type="file" name="relativeImage" required="required"
										data-validation-required-message="select JPEG or PNG file with size less than 500KB" />
								</div>
							</div>
						</div>
					</div>
					<br />
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