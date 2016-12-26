<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/dist/css/simple-line-icons.css'/>">
<div class="register-logo">
	<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>" height="80"
		width="80"> <b>Applicant form</b><br /> <span
		class="pull-right"> <a href="checkStatus">
			<button class="btn btn-xs btn-primary">Check Status</button>
	</a>

	</span>
</div>
<br />
<div class="progress">
	<div class="progress-bar progress-bar-striped active"
		role="progressbar" aria-valuenow="0" aria-valuemin="0"
		aria-valuemax="100" style="width: 0%">
		<span class="text-black">Form&nbsp;:&nbsp;0%&nbsp;Complete</span>
	</div>
</div>
<section>
	${imageError}
	<form:form modelAttribute="user" class="form-horizontal"
		id="basicRegister" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<!-- Personal Detail -->
					<div class="box-header with-border">
						<h3 class="box-title">Personal Details</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Full Name</form:label>
							<div class="control-group">
								<div class="controls col-sm-2">
									<form:input path="firstName" cssClass="form-control"
										placeholder="First Name" required="true"
										data-validation-required-message="Please Enter First Name"
										data-validation-regex-regex="^[a-zA-Z]+$"
										data-validation-regex-message="Only Alphabets allowed" />
								</div>
							</div>
							<div class="control-group">
								<div class="controls col-sm-2">
									<form:input path="middleName" cssClass="form-control"
										placeholder="Middle Name" required="true"
										data-validation-required-message="Please Enter First Name"
										data-validation-regex-regex="^[a-zA-Z]+$"
										data-validation-regex-message="Only Alphabets allowed" />
								</div>
							</div>
							<div class="control-group">
								<div class="controls col-sm-2">
									<form:input path="lastName" cssClass="form-control"
										placeholder="Last Name" required="true"
										data-validation-required-message="Please Enter Last Name"
										data-validation-regex-regex="^[a-zA-Z]+$"
										data-validation-regex-message="Only Alphabets allowed" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Email</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="email" type="email" class="form-control"
										placeholder="Email" required="true"
										data-validation-required-message="Please Enter Email" />
									<span style="color: red"> <form:errors path="email" /></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Mobile No.</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="mobileNumber" type="number"
										class="form-control" placeholder="Mobile Number"
										required="true"
										data-validation-required-message="Please Enter Mobile Number"
										data-validation-regex-regex="^[789]\d{9}$"
										data-validation-regex-message="Enter Valid Indian Mobile Number" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Birth date</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="birthDate" class="form-control"
										id="datepicker" placeholder="YYYY/MM/DD" required="true"
										data-validation-regex-regex="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"
										data-validation-regex-message="Enter Valid Birth Date" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Gender</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">

									<form:radiobutton path="gender" name="gender" value="MALE"
										required="required" />
									Male
									<form:radiobutton path="gender" name="gender" value="FEMALE" />
									Female
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Blood Group</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:select path="bloodGroup" cssClass="form-control"
										id="bloodGroup" required="true">
										<form:option value="" disabled="true" selected="selected">Select...</form:option>
										<form:option value="A+ve">A+ve</form:option>
										<form:option value="A-ve">A-ve</form:option>
										<form:option value="B+ve">B+ve</form:option>
										<form:option value="B-ve">B-ve</form:option>
										<form:option value="AB+ve">AB+ve</form:option>
										<form:option value="AB-ve">AB-ve</form:option>
										<form:option value="O+ve">O+ve</form:option>
										<form:option value="O-ve">O-ve</form:option>
									</form:select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Address Line 1</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="address1" cssClass="form-control"
										placeholder="Address Line 1" required="true"
										data-validation-required-message="Please Enter Address Line 1" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Address Line 2</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="address2" cssClass="form-control"
										placeholder="Address Line 2" required="true"
										data-validation-required-message="Please Enter Address Line 2" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">District</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:select path="city" class="form-control" id="city"
										required="required">
										<form:option value="">Select...</form:option>
										<form:option value="Amreli">Amreli</form:option>
										<form:option value="Bhavanagar">Bhavanagar</form:option>
										<form:option value="Jamanagar">Jamanagar</form:option>
										<form:option value="Junagadh">Junagadh</form:option>
										<form:option value="Surat">Surat</form:option>
										<form:option value="Surendranagar">Surendranagar</form:option>
									</form:select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">PIN Code</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="zipCode" cssClass="form-control"
										placeholder="PIN Code" required="true"
										data-validation-required-message="Please Enter PIN Code"
										data-validation-regex-regex="^([3])([0-9]){5}$"
										data-validation-regex-message="Enter Valid Pincode" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Native Village</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="nativeVillage" cssClass="form-control"
										placeholder="Native Village" required="true"
										data-validation-required-message="Please Enter Native Village"
										data-validation-regex-regex="^[a-zA-Z ]*$"
										data-validation-regex-message="Only Alphabets allowed" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Native Taluka</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="nativeTaluka" cssClass="form-control"
										placeholder="Native Taluka" required="true"
										data-validation-required-message="Please Enter Native Taluka"
										data-validation-regex-regex="^[a-zA-Z ]*$"
										data-validation-regex-message="Only Alphabets allowed" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Native District</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:select path="nativeDistrict" class="form-control"
										id="nativeDistrict" required="required">
										<form:option value="">Select...</form:option>
										<form:option value="Amreli">Amreli</form:option>
										<form:option value="Bhavanagar">Bhavanagar</form:option>
										<form:option value="Jamanagar">Jamanagar</form:option>
										<form:option value="Junagadh">Junagadh</form:option>
										<form:option value="Surat">Surat</form:option>
										<form:option value="Surendranagar">Surendranagar</form:option>
									</form:select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="" cssClass="col-sm-3 control-label">Native PIN Code</form:label>
							<div class="control-group">
								<div class="controls col-sm-6">
									<form:input path="nativeZipCode" cssClass="form-control"
										placeholder="Native PIN Code" required="true"
										data-validation-regex-regex="^([3])([0-9]){5}$"
										data-validation-regex-message="Enter Valid Pincode" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Passport Size Image</label>
							<div class="control-group">
								<div class="controls col-sm-6">
									(Must be JPEG or PNG file with size less than 500KB)<br /> <input
										type="file" name="self" required="required"
										data-validation-required-message="select JPEG or PNG file with size less than 500KB" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"></label> <span
								class="center-block bg-danger text-danger"
								style="padding-left: 20px; padding-right: 20px"><form:errors
									path="userId" /></span>
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
	</form:form>
</section>