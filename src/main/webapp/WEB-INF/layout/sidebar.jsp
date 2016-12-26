<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<tilesx:useAttribute name="current" />
<tilesx:useAttribute name="tree" />

<script type="text/javascript">
	$(document).ready(function() {

		$(".search").autocomplete({
			source : function(request, response) {
				var name = $('.search').val();
				$.ajax({
					type : "POST",
					url : "/sspkm/user",
					data : "name=" + name,
					success : function(data) {
						console.log(data)
						var h = $.parseJSON(data);
						console.log(h)
						response($.map(h, function(v, i) {
							return {
								label : v.name,
								value : v.userId
							};

						}));
					},

				});
			},
			select : function(event, ui) {
				event.preventDefault();
				$(".searchById").val(ui.item.value);
				$(".search").val(ui.item.label);
				$(".searchform").submit();

			},
			focus : function(event, ui) {
				event.preventDefault();
				$(".searchById").val(ui.item.value);
				$(".search").val(ui.item.label);
			},
		});

	});
</script>

<security:authorize access="hasRole('ROLE_ADMIN')">
	<aside class="main-sidebar">
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<a href="<c:url value='/admin/profile'/>">
				<div class="user-panel text-success">
					<div class="pull-left image">
						<img
							src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${user.firstName}&nbsp;${user.lastName}</p>
						Administrator
					</div>
				</div>
			</a>
			<!-- search form -->
			<form action="<c:url value='/admin/searchuser/profile'/>"
				method="post" class="sidebar-form searchform">
				<div class="input-group">
					<input type="hidden" value=""> <input type="hidden"
						name="id" class="searchById" /> <input type="text"
						name="username" class="form-control search" id="search-box"
						placeholder="Search..." required> <span
						class="input-group-btn">
						<button type="submit" name="search" id="search-btn"
							class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<!-- /.search form -->
			<ul class="sidebar-menu">

				<li class="header">MAIN NAVIGATION</li>

				<li class="${current == 'index' ? 'active ' : ''}treeview"><a
					href="<c:url value='/admin/index'/>"> <i
						class="fa fa-dashboard"></i> <span>Home</span>
				</a></li>

				<li class="${current == 'profile' ? 'active ' : ''}treeview"><a
					href="<c:url value='/admin/profile'/>"> <i class="fa fa-user"></i>
						<span>Profile</span>

				</a></li>

				<li class="${tree == 'admission' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-plus-square"></i> <span>Admission</span>
						<i class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'setAdmissionDetail' ? 'active ' : ''}"><a
							href="<c:url value='/admin/setAdmissionDetail'/>"><i
								class="fa fa-circle-o"></i> Set Admission Detail</a></li>
						<li class="${current == 'viewSeatMatrix' ? 'active ' : ''}"><a
							href="<c:url value='/admin/viewSeatMatrix'/>"><i
								class="fa fa-circle-o"></i> View Seat Matrix</a></li>
						<li class="${current == 'newApplicant' ? 'active ' : ''}"><a
							href="<c:url value='/admin/viewNewApplications'/>"><i
								class="fa fa-circle-o"></i> View New Application</a></li>
						<li class="${current == 'confirmAdmission' ? 'active ' : ''}"><a
							href="<c:url value='/admin/confirmAdmission'/>"><i
								class="fa fa-circle-o"></i> Confirm New Admission</a></li>
						<li class="${current == 'oldApplicant' ? 'active ' : ''}"><a
							href="<c:url value='/admin/viewStudentApplications'/>"><i
								class="fa fa-circle-o"></i> View Student Applicants</a></li>
						<li class="${current == 'cancelAdmission' ? 'active ' : ''}"><a
							href="<c:url value='/admin/cancelAdmission'/>"><i
								class="fa fa-circle-o"></i> Cancel Student Admission</a></li>
						<li
							class="${current == 'cancelAdmissionApplications' ? 'active ' : ''}"><a
							href="<c:url value='/admin/cancelAdmissionApplications'/>"><i
								class="fa fa-circle-o"></i> Cancel Admission Requests</a></li>
					</ul></li>

				<li class="${tree == 'student' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-users"></i> <span>Student</span> <i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'viewStudents' ? 'active ' : ''}"><a
							href="<c:url value='/admin/viewStudents'/>"><i
								class="fa fa-circle-o"></i> View All Students</a></li>
					</ul></li>

				<li class="${tree == 'rector' ? 'active ' : ''} treeview"><a
					href="#"> <i class="fa fa-user-secret"></i> <span>Rector</span>
						<i class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'addRectors' ? 'active ' : ''}"><a
							href="<c:url value='/admin/addRector'/>"><i
								class="fa fa-circle-o"></i> Add Rector</a></li>
						<li class="${current == 'viewRectors' ? 'active ' : ''}"><a
							href="<c:url value='/admin/viewRectors'/>"><i
								class="fa fa-circle-o"></i> View Rectors</a></li>
					</ul></li>
				<li class="${tree == 'report' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-edit"></i> <span>Report</span> <i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'addReport' ? 'active ' : ''}"><a
							href="<c:url value='/admin/addReport'/>"><i
								class="fa fa-circle-o"></i> Add Report</a></li>
						<li class="${current == 'viewReports' ? 'active ' : ''}"><a
							href="<c:url value='/admin/viewReports'/>"><i
								class="fa fa-circle-o"></i> View Reports</a></li>
					</ul></li>

				<li class="${tree == 'receipt' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-file-text-o"></i> <span>Receipt</span><i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'studentReceipt' ? 'active ' : ''}"><a
							href="<c:url value='/admin/studentReceipt'/>"><i
								class="fa fa-circle-o"></i> Student Receipt</a></li>
						<li class="${current == 'viewAllReceipt' ? 'active ' : ''}"><a
							href="<c:url value='/admin/viewAllReceipt'/>"><i
								class="fa fa-circle-o"></i> View All Receipt</a></li>
					</ul></li>

				<li class="${current == 'feedback' ? 'active ' : ''}treeview"><a
					href="<c:url value='/admin/feedback'/>"> <i
						class="fa fa-commenting-o"></i> <span>FeedBacks</span>
				</a></li>
			</ul>
		</section>

		<!-- /.sidebar -->
	</aside>
</security:authorize>


<security:authorize access="hasRole('ROLE_RECTOR')">
	<aside class="main-sidebar">
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<a href="<c:url value='/rector/profile'/>">
				<div class="user-panel text-success">
					<div class="pull-left image">
						<img
							src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${user.firstName}&nbsp;${user.lastName}</p>
						Rector
					</div>
				</div>
			</a>
			<!-- search form -->
			<form action="<c:url value='/rector/searchuser/profile'/>"
				method="post" class="sidebar-form searchform">
				<div class="input-group">
					<input type="hidden" name="id" class="searchById" /> <input
						type="text" name="username" class="form-control search"
						id="search-box" placeholder="Search..." required> <span
						class="input-group-btn">
						<button type="submit" name="search" id="search-btn"
							class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<!-- /.search form -->
			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu">

				<li class="header">MAIN NAVIGATION</li>

				<li class="${current == 'index' ? 'active ' : ''}treeview"><a
					href="<c:url value='/rector/index'/>"> <i
						class="fa fa-dashboard"></i> <span>Home</span>
				</a></li>

				<li class="${current == 'profile' ? 'active ' : ''}treeview"><a
					href="<c:url value='/rector/profile'/>"> <i class="fa fa-user"></i>
						<span>Profile</span>
				</a></li>

				<li class="${current == 'viewStudent' ? 'active ' : ''}treeview"><a
					href="<c:url value='/rector/viewStudents'/>"> <i
						class="fa fa-users"></i> <span>View Student</span>
				</a></li>

				<li class="${current == 'viewRequest' ? 'active ' : ''}treeview">
					<a href="<c:url value='/rector/viewRequest'/>"> <i
						class="fa fa-files-o"></i> <span>View Requests</span>
				</a>
				</li>

				<li class="${tree == 'activities' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-star-half-o"></i> <span>Activities</span>
						<i class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'addActivities' ? 'active ' : ''}"><a
							href="<c:url value='/rector/addActivities'/>"><i
								class="fa fa-circle-o"></i>Add Activities</a></li>
						<li class="${current == 'viewActivities' ? 'active ' : ''}"><a
							href="<c:url value='/rector/viewActivities'/>"><i
								class="fa fa-circle-o"></i> View Activities</a></li>

					</ul></li>


			</ul>

		</section>

	</aside>
</security:authorize>

<security:authorize access="hasRole('ROLE_TRUSTEE')">
	<aside class="main-sidebar">
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<a href="<c:url value='/trustee/profile'/>">
				<div class="user-panel text-success">
					<div class="pull-left image">
						<img
							src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${user.firstName}&nbsp;${user.lastName}</p>
						Trustee
					</div>
				</div>
			</a>
			<!-- search form -->
			<form action="<c:url value='/trustee/searchuser/profile'/>"
				method="post" class="sidebar-form searchform">
				<div class="input-group">
					<input type="hidden" name="id" class="searchById" /> <input
						type="text" name="username" class="form-control search"
						id="search-box" placeholder="Search..." required> <span
						class="input-group-btn">
						<button type="submit" name="search" id="search-btn"
							class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<!-- /.search form -->
			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu">

				<li class="header">MAIN NAVIGATION</li>

				<li class="${current == 'index' ? 'active ' : ''}treeview"><a
					href="<c:url value='/trustee/index'/>"> <i
						class="fa fa-dashboard"></i> <span>Home</span>
				</a></li>

				<li class="${current == 'profile' ? 'active ' : ''}treeview"><a
					href="<c:url value='/trustee/profile'/>"> <i class="fa fa-user"></i>
						<span>Profile</span>
				</a></li>

				<li class="${tree == 'student' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-users"></i> <span>Student</span> <i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'viewBoyStudents' ? 'active ' : ''}"><a
							href="<c:url value='/trustee/viewBoyStudents'/>"><i
								class="fa fa-circle-o"></i> View Boy Students</a></li>
					</ul>
					<ul class="treeview-menu">
						<li class="${current == 'viewGirlStudents' ? 'active ' : ''}"><a
							href="<c:url value='/trustee/viewGirlStudents'/>"><i
								class="fa fa-circle-o"></i> View Girl Students</a></li>
					</ul></li>

				<li class="${current == 'viewRectors' ? 'active ' : ''}treeview"><a
					href="<c:url value='/trustee/viewRectors'/>"> <i
						class="fa fa-user-secret"></i> <span>View Rector</span>
				</a></li>

				<li class="${tree == 'trustees' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-user-secret"></i> <span>Trustees</span>
						<i class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'addTrustee' ? 'active ' : ''}"><a
							href="<c:url value='/trustee/addTrustee'/>"><i
								class="fa fa-circle-o"></i> Add Trustee</a></li>
						<li class="${current == 'viewTrustees' ? 'active ' : ''}"><a
							href="<c:url value='/trustee/viewTrustees'/>"><i
								class="fa fa-circle-o"></i> View Trustees</a></li>
					</ul></li>

				<li class="${tree == 'admins' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-user-secret"></i> <span>Admins</span>
						<i class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'addAdmin' ? 'active ' : ''}"><a
							href="<c:url value='/trustee/addAdmin'/>"><i
								class="fa fa-circle-o"></i> Add Admin</a></li>
						<li class="${current == 'viewAdmins' ? 'active ' : ''}"><a
							href="<c:url value='/trustee/viewAdmins'/>"><i
								class="fa fa-circle-o"></i> View Admins</a></li>
					</ul></li>




			</ul>

		</section>

	</aside>
</security:authorize>



<security:authorize access="authenticated and principal.evaluator">
	<aside class="main-sidebar">
		<section class="sidebar">

			<!-- Sidebar user panel -->
			<a href="<c:url value='/student/profile'/>">
				<div class="user-panel text-success">
					<div class="pull-left image">
						<img
							src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${user.firstName}&nbsp;${user.lastName}</p>
						${user.student.course.subCourseName}
					</div>
				</div>
			</a>
			<!-- search form -->
			<form action="<c:url value='/student/searchuser/profile'/>"
				method="post" class="sidebar-form searchform">
				<div class="input-group">
					<input type="hidden" name="id" class="searchById" /> <input
						type="text" name="username" class="form-control search"
						id="search-box" placeholder="Search..." required> <span
						class="input-group-btn">
						<button type="submit" name="search" id="search-btn"
							class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<!-- /.search form -->
			<ul class="sidebar-menu">
				<li class="header">MAIN NAVIGATION</li>

				<li class="${current == 'index' ? 'active ' : ''}treeview"><a
					href="<c:url value='/student'/>"> <i class="fa fa-dashboard"></i>
						<span>Dashboard</span>
				</a></li>

				<li class="${current == 'profile' ? 'active ' : ''}treeview"><a
					href="<c:url value='/student/profile'/>"> <i class="fa fa-user"></i>
						<span>Profile</span>
				</a></li>

				<li class="${tree == 'request' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-question-circle"></i> <span>Request</span><i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'addRequest' ? 'active ' : ''}"><a
							href="<c:url value='/student/addRequest'/>"><i
								class="fa fa-circle-o"></i> Add Request</a></li>
						<li class="${current == 'viewRequest' ? 'active ' : ''}"><a
							href="<c:url value='/student/viewRequest'/>"><i
								class="fa fa-circle-o"></i> View Request</a></li>
					</ul></li>

				<li class="${tree == 'forum' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-list"></i> <span>Forum</span><i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'forum' ? 'active ' : ''}"><a
							href="<c:url value='/student/forum'/>"><i
								class="fa fa-circle-o"></i>Browse Forum</a></li>
						<li class="${current == 'postQuestion' ? 'active ' : ''}"><a
							href="<c:url value='/student/forum/postQuestion'/>"><i
								class="fa fa-circle-o"></i>Post Question</a></li>
						<li class="${current == 'myQuestion' ? 'active ' : ''}"><a
							href="<c:url value='/student/forum/myQuestions'/>"><i
								class="fa fa-circle-o"></i> My Questions</a></li>
					</ul></li>

				<li class="${tree == 'bookPortal' ? 'active ' : ''}treeview"><a
					href="#"> <i class="fa fa-book"></i> <span>Book Portal</span><i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li class="${current == 'bookPortal1' ? 'active ' : ''}"><a
							href="<c:url value='/student/bookPortal'/>"><i
								class="fa fa-circle-o"></i>View Book Portal</a></li>
						<li class="${current == 'addBook' ? 'active ' : ''}"><a
							href="<c:url value='/student/addBook'/>"><i
								class="fa fa-circle-o"></i> Add Books</a></li>
						<li class="${current == 'myBooks' ? 'active ' : ''}"><a
							href="<c:url value='/student/myBooks'/>"><i
								class="fa fa-circle-o"></i> My Books</a></li>
					</ul></li>



			</ul>
		</section>
	</aside>
</security:authorize>
