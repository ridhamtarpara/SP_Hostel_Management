<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section class="content">

	<form class="form-horizontal">
		<div class="box box-primary">
			<!-- Personal Detail -->
			<div class="box-header with-border">
				<h3 class="box-title">Confirm Admission</h3>
			</div>

			<div class="box-body">

				<div class="form-group">
					<label class="col-sm-3 control-label">Enter Student ID</label>
					<div class="col-sm-6">
						<input  class="form-control"
							placeholder="Student ID" />
						<span style="color: red"></span>
					</div>
				</div>
				<div class="box-footer">
					<button type="reset" class="btn btn-default">Reset</button>
					<button type="submit" class="btn btn-primary pull-right">Continue</button>
				</div>

			</div>

		</div>

	</form>
</section>