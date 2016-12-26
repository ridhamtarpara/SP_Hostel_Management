<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Add New Book</h1>
</section>
<section class="content">
	<form:form modelAttribute="book" class="form-horizontal"
		novalidate="novalidate" enctype="multipart/form-data">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Add Detail</h3>
			</div>
			<div class="box-body">
				<div class="form-group control-group">
					<form:label path="name" class="col-sm-3 control-label">Book Name</form:label>
					<div class="controls col-sm-6">
						<form:input id="bookName" path="name" class="form-control"
							placeholder="Name" required="required"
							data-validation-required-message="Please Enter Book Name" />
						<span style="color: red"> <form:errors path="name" /></span>
					</div>
				</div>
				<div class="form-group control-group">
					<form:label path="author" class="col-sm-3 control-label">Book Author</form:label>
					<div class="controls col-sm-6">
						<form:input id="bookauthor" path="author" class="form-control"
							placeholder="Author" required="required"
							data-validation-required-message="Please Enter Book Author Name" />
						<span style="color: red"> <form:errors path="author" /></span>
					</div>
				</div>
				<div class="form-group control-group">
					<form:label path="publication" class="col-sm-3 control-label">Book Publication</form:label>
					<div class="controls col-sm-6">
						<form:input id="bookpublication" path="publication"
							class="form-control" placeholder="Publication"
							required="required"
							data-validation-required-message="Please Enter Book Publication" />
						<span style="color: red"> <form:errors path="publication" /></span>
					</div>
				</div>
				<div class="form-group control-group">
					<form:label path="description" class="col-sm-3 control-label">Book Description</form:label>
					<div class="controls col-sm-6">
						<form:input id="bookName" path="description" class="form-control"
							placeholder="Description" required="required"
							data-validation-required-message="Please Enter Book Description"
							minlength="6"
							data-validation-minlength-message="Min 6 characters"
							maxlength="254"
							data-validation-maxlength-message="Max 20 characters" />
						<span style="color: red"> <form:errors path="description" /></span>
					</div>
				</div>
				<div class="form-group control-group">
					<form:label path="semester" class="col-sm-3 control-label">Semester</form:label>
					<div class="controls col-sm-6">
						<form:input id="semester" path="semester" class="form-control"
							type="number" placeholder="Semester" required="required"
							data-validation-required-message="Please Enter Semester"
							data-validation-regex-regex="^[0-9]+$"
							data-validation-regex-message="Only Numbers allowed" />
						<span style="color: red"> <form:errors path="semester" /></span>
					</div>
				</div>
				<div class="form-group control-group">
					<form:label path="price" class="col-sm-3 control-label">Price</form:label>
					<div class="controls col-sm-6">
						<form:input id="bookName" path="price" class="form-control"
							type="number" placeholder="Price" required="required"
							data-validation-required-message="Please Enter Price"
							data-validation-regex-regex="^[0-9]+$"
							data-validation-regex-message="Only Numbers allowed" />
						<span style="color: red"> <form:errors path="price" /></span>
					</div>
				</div>
				<label class="col-sm-3 control-label">Profile Image<span
					class="text-danger">*</span></label>
				<div class="form-group control-group">
					<div class="controls col-sm-6">
						<input type="file" name="bookimage" required="required"
							data-validation-required-message="select JPEG or PNG file with size less than 500KB" />
						<span style="color: red"> <form:errors path="price" /></span>
					</div>
				</div>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary pull-right">Continue</button>
				</div>
			</div>
		</div>
	</form:form>
</section>