<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>Edit Trustee</h1>
</section>
<section class="content" style="width: 90%">
	<div class="box box-info">
		<form class="form-horizontal" method="post">
			<div class="box-body">
				<div class="form-group">
					<input type="hidden" name="trusteeId" value="${trustee.trusteeId}" />
					<label class="col-sm-3 control-label">Designation</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<select class="form-control" id="designation" name="designation">
								<option value="" selected="selected" disabled="disabled">Select...</option>
								<option value="President">President</option>
								<option value="Vice President">Vice President</option>
								<option value="Co-Secretary">Co-Secretary</option>
								<option value="Treasurer">Treasurer</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<button type="reset" class="btn btn-default">Reset</button>
				<button type="submit" class="btn btn-primary pull-right">Update
				</button>
			</div>
		</form>
	</div>
</section>