
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/dist/css/slider/owl.carousel.css'/>"
	rel="stylesheet">
<link href="<c:url value='/dist/css/slider/owl.theme.css'/>"
	rel="stylesheet">
<script src="<c:url value='/dist/js/slider/owl.carousel.min.js'/>"></script>
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
<div id="preloader">
	<div id="status">
		<div class="wow tada infinite" data-wow-duration="3s"></div>
		<img src="<c:url value='/dist/img/logo1.jpg'/>" />
		<h4>Be Patient Content Is Loading</h4>
		<img src="<c:url value='/dist/img/loaderorange.gif'/>" /><br />
		<br /> <span class="queicon btnicon icon-question"></span>
		<div class="why">
			<h6>Site will open when the whole content is loaded so user can
				get better experience</h6>
		</div>
	</div>
</div>
<div id="hero">
	<div class="container herocontent">
		<h2 style="margin-top: 12px; margin-bottom: 0px;"
			class="wow fadeInUp bold" data-wow-duration="2s">Saurastra Patel
			Kelavani Mandal</h2>
		<h4 style="margin-top: 3px; margin-bottom: 5px;"
			class="wow fadeInDown bold" data-wow-duration="3s">
			<b>Hostelling Facilities In Ahmedabad</b>
		</h4>
	</div>
	<div id="demo">
		<div class="row">
			<div class="span12">
				<div id="owl-demo" class="owl-carousel">
					<div class="item">
						<img src="<c:url value='/dist/img/Homepage/1.jpg'/>" alt="SP">
					</div>
					<div class="item">
						<img src="<c:url value='/dist/img/Homepage/2.jpg'/>" alt="SP">
					</div>
					<div class="item">
						<img src="<c:url value='/dist/img/Homepage/3.jpg'/>" alt="SP">
					</div>
					<div class="item">
						<img src="<c:url value='/dist/img/Homepage/4.jpg'/>" alt="SP">
					</div>
					<div class="item">
						<img src="<c:url value='/dist/img/Homepage/5.jpg'/>" alt="SP">
					</div>
					<div class="item">
						<img src="<c:url value='/dist/img/Homepage/6.jpg'/>" alt="SP">
					</div>
					<div class="item">
						<img src="<c:url value='/dist/img/Homepage/7.jpg'/>" alt="SP">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>