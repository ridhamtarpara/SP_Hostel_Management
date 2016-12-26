
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
			<h2 class="sectionhead">Trust</h2>
			<ul class="nav nav-tabs">
				<li class="${current == 'trust' ? 'active ' : ''}"><a
					href="<c:url value='trust'/>">Trustee List</a></li>
				<li class="${current == 'reports' ? 'active ' : ''}"><a
					href="<c:url value='reports'/>">Reports</a></li>
				<li class="${current == 'components' ? 'active ' : ''}"><a
					href="<c:url value='components'/>">Components</a></li>
			</ul>
			<div class="tab-content"></div>
		</div>
	</div>
</div>
