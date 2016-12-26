
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tilesx:useAttribute name="current" />
<tilesx:useAttribute name="tree" />
<link rel="stylesheet" href="<c:url value='/dist/css/style1.css'/>" />
<script type="text/javascript"
	src="<c:url value='/dist/js/jssor.slider.mini.js'/>"></script>
<div id="main">
	<div id="content">
		<div class="container">
			<h2 class="sectionhead">Services</h2>
			<ul class="nav nav-tabs">
				<li class="${current == 'facilities' ? 'active ' : ''}"><a
					href="<c:url value='facilities'/>">Rooms</a></li>
				<li class="${current == 'diningHall' ? 'active ' : ''}"><a
					href="<c:url value='diningHall'/>">Dining Hall</a></li>
				<li class="${current == 'gym' ? 'active ' : ''}"><a
					href="<c:url value='gym'/>">Gym</a></li>
				<li class="${current == 'tuition' ? 'active ' : ''}"><a
					href="<c:url value='tuition'/>">Tuition</a></li>
				<li class="${current == 'library' ? 'active ' : ''}"><a
					href="<c:url value='library'/>">Library</a></li>
				<li class="${current == 'otherFacility' ? 'active ' : ''}"><a
					href="<c:url value='otherFacility'/>">Other Facility</a></li>
			</ul>
		</div>
	</div>
</div>
<script src="<c:url value='/dist/js/jquery.nicescroll.min.js'/>"></script>