<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var sec = 4;
	$(window).load(function() {
		var myVar = setInterval(myTimer, 1000);

		function myTimer() {
			document.getElementById("timer").innerHTML = sec;
			sec--;
			if (sec === 0) {
				window.location.href = "<c:url value="/index.html"/>";
			}
		}
	});
</script>
<section>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title error">Sorry For inconvience</h3>
				</div>
				<div class="login-logo">
					<img alt="Logo" src="<c:url value='/dist/img/logo.png'/>">
				</div>
				<div class="box-body">
					<ul id="title">
						<li class="error">Something Went Wrong</li>
					</ul>
					<div class="col-md-12">
						<p>
							We are taking back you to the home page in <b id="timer"
								class="error">5</b> seconds
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>