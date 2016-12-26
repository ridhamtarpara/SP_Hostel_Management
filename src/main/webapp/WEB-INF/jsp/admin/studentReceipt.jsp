<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function() {
		$("input").not("[type=submit]").jqBootstrapValidation();
	});
	
	$(function() {
		$('#date').daterangepicker({
			 locale: {
			      format: 'YYYY-MM-DD'
			    }
		});
	});
</script>

<section class="content-header">
	<h1>Receipt</h1>
</section>

<section class="content">
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<!-- Personal Detail -->
			<div class="box-header with-border">
				<h3 class="box-title">Get Receipt</h3>
			</div>
			<div class="box-body">
			<form class="form-horizontal" action="<c:url value="/admin/studentReceipt"/>" method="post">
				<div class="form-group">
					<label class="col-sm-3 control-label">Email ID</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" name="email"
										placeholder="Email" required="required"
										data-validation-required-message="Please Enter Email" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label">Date Range</label>
					<div class="control-group">
						<div class="controls col-sm-6">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control"
									id="date" name="date" placeholder="YYYY-MM-DD - YYYY-MM-DD" required="required"
									data-validation-required-message="Please Enter Date" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="box-footer">
					<button type="reset" class="btn btn-default">Reset</button>
					<button type="submit" class="btn btn-primary pull-right">Continue</button>
				</div>
				</form>
			</div>
		</div>
		</div>
	</div>
</section>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>