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
			<h2 class="sectionhead">Activities</h2>
			<ul class="nav nav-tabs">
				<li class="${current == 'activities' ? 'active ' : ''}"><a
					href="<c:url value='activities'/>">Sports</a></li>
				<li class="${current == 'navratri' ? 'active ' : ''}"><a
					href="<c:url value='navratri'/>">Navratri</a></li>
				<li class="${current == 'independenceDay' ? 'active ' : ''}"><a
					href="<c:url value='independenceDay'/>">Independence Day</a></li>
				<li class="${current == 'republicDay' ? 'active ' : ''}"><a
					href="<c:url value='republicDay'/>">Republic Day</a></li>
				<li class="${current == 'satraPrarambh' ? 'active ' : ''}"><a
					href="<c:url value='satraPrarambh'/>">Satra Prarambh</a></li>
			</ul>
			<div class="tab-content"></div>
		</div>
	</div>
</div>