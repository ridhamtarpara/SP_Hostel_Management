<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Content Header (Page header) -->
<script type="text/javascript">
	$(function() {
		$('#datepicker').datepicker({
			format : 'yyyy-mm-dd'
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("input,textarea").not("[type=submit]").jqBootstrapValidation();
	});
</script>
<section class="content-header">
	<h1>Add Trustee</h1>
</section>
<section class="content">
	<c:if test="${not empty error}">
		<div class="alert alert-danger" role="alert">
			${error}
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<c:remove var="error" />
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Trustee Detail</h3>
		</div>
		<form action="" class="form-horizontal" method="post"
			enctype="multipart/form-data">
			<div class="box-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">Name</label>
					<div class="control-group">
						<div class="controls col-sm-2">
							<spring:bind path="users.firstName">
								<input id="rectorFname" class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="First Name" required="required"
									data-validation-required-message="Please Enter First Name"
									data-validation-regex-regex="^[a-zA-Z]+$"
									data-validation-regex-message="Only Alphabets allowed" />
							</spring:bind>
						</div>
					</div>
					<div class="control-group">
						<div class="controls col-sm-2">
							<spring:bind path="users.middleName">
								<input id="rectorMname" class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Middle Name" required="required"
									data-validation-required-message="Please Enter Middle Name"
									data-validation-regex-regex="^[a-zA-Z]+$"
									data-validation-regex-message="Only Alphabets allowed" />
							</spring:bind>
						</div>
					</div>
					<div class="control-group">
						<div class="controls col-sm-2">
							<spring:bind path="users.lastName">
								<input id="rectorLname" class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Last Name" required="required"
									data-validation-required-message="Please Enter Last Name"
									data-validation-regex-regex="^[a-zA-Z]+$"
									data-validation-regex-message="Only Alphabets allowed" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Email</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.email">
								<input id="email" type="email" class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Email" required="required"
									data-validation-required-message="Please Enter Email" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Mobile No.</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.mobileNumber">
								<input id="mobileNumber" type="number" class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Mobile Number" required="required"
									data-validation-required-message="Please Enter Mobile Number"
									data-validation-regex-regex="^[789]\d{9}$"
									data-validation-regex-message="Enter Valid Indian Mobile Number" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Designation</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="trustee.designation">
								<select path="designation" class="form-control" id="designation"
									name="${status.expression}" value="${status.value}">
									<option value="">Select...</option>
									<option value="President">President</option>
									<option value="Vice President">Vice President</option>
									<option value="Co-Secretary">Co-Secretary</option>
									<option value="Treasurer">Treasurer</option>
									<option value="Treasurer">Trustee</option>
								</select>
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Birth date</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.birthDate">
								<input class="form-control" id="datepicker"
									name="${status.expression}" value="${status.value}"
									placeholder="YYYY/MM/DD" required="required"
									data-validation-regex-regex="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"
									data-validation-regex-message="Enter Valid Birth Date" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Gender</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.gender">
								<select class="form-control" id="gender"
									name="${status.expression}" value="${status.value}">
									<option value="">Select...</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Blood Group</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.bloodGroup">
								<select class="form-control" id="bloodGroup"
									name="${status.expression}" value="${status.value}"
									required="true">
									<option value="" disabled="true" selected="selected">Select...</option>
									<option value="A+ve">A+ve</option>
									<option value="A-ve">A-ve</option>
									<option value="B+ve">B+ve</option>
									<option value="B-ve">B-ve</option>
									<option value="AB+ve">AB+ve</option>
									<option value="AB-ve">AB-ve</option>
									<option value="O+ve">O+ve</option>
									<option value="O-ve">O-ve</option>
								</select>
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Address Line 1</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.address1">
								<input id="address1" Class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Address Line 1" required="required"
									data-validation-required-message="Please Enter Address Line 1" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Address Line 2</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.address2">
								<input id="address2" Class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Address Line 2" required="required"
									data-validation-required-message="Please Enter Address Line 2" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">District</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.city">
								<select path="city" class="form-control" id="city"
									name="${status.expression}" value="${status.value}">
									<option value="">Select...</option>
									<option value="Amreli">Amreli</option>
									<option value="Bhavanagar">Bhavanagar</option>
									<option value="Jamanar">Jamanagar</option>
									<option value="Junagadh">Junagadh</option>
									<option value="Surat">Surat</option>
									<option value="Surendranagar">Surendranagar</option>
								</select>
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">PIN Code</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.zipCode">
								<input id="zipCode" Class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="PIN Code" required="required"
									data-validation-required-message="Please Enter PIN Code"
									data-validation-regex-regex="^([3])([0-9]){5}$"
									data-validation-regex-message="Enter Valid Pincode" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Native Village</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.nativeVillage">
								<input id="nativeVillage" Class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Native Village" required="required"
									data-validation-required-message="Please Enter Native Village"
									data-validation-regex-regex="^[a-zA-Z ]*$"
									data-validation-regex-message="Only Alphabets allowed" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Native Taluka</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.nativeTaluka">
								<input id="nativeTaluka" Class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Native Taluka" required="required"
									data-validation-required-message="Please Enter Native Taluka"
									data-validation-regex-regex="^[a-zA-Z ]*$"
									data-validation-regex-message="Only Alphabets allowed" />
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Native District</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.nativeDistrict">
								<select id="nativeDistrict" class="form-control"
									name="${status.expression}" value="${status.value}">
									<option value="">Select...</option>
									<option value="Amreli">Amreli</option>
									<option value="Bhavanagar">Bhavanagar</option>
									<option value="Jamanar">Jamanagar</option>
									<option value="Junagadh">Junagadh</option>
									<option value="Surat">Surat</option>
									<option value="Surendranagar">Surendranagar</option>
								</select>
							</spring:bind>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label Class="col-sm-3 control-label">Native PIN Code</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<spring:bind path="users.nativeZipCode">
								<input path="nativeZipCode" Class="form-control"
									name="${status.expression}" value="${status.value}"
									placeholder="Native PIN Code" required="required"
									data-validation-regex-regex="^([3])([0-9]){5}$"
									data-validation-regex-message="Enter Valid Pincode" />
							</spring:bind>
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
			</div>
			<div class="box-footer">
				<button type="reset" class="btn btn-default">Reset</button>
				<button type="submit" class="btn btn-primary pull-right">Add
					Trustee</button>
			</div>
		</form>
	</div>
</section>