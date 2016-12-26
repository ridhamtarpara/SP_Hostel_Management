<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>My Questions</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary col-md-12">
				<div class="box-header" style="border-bottom: 2px solid #3c8dbc">
					<h3 class="box-title">Questions</h3>
				</div>
				<div class="questionlist box-body">
					<c:forEach var="question" items="${questions}">
						<div class="box box-widget post">
							<div class='box-header with-border'>
								<div class='user-block'>
									<span class='username'><a
										href='<c:url value="questionPage?questionId=${question.questionId}"/>'>${question.question}</a></span>
									<span class='description'>By <c:choose>
											<c:when test="${question.student.user.gender eq user.gender}">${question.student.user.firstName}&nbsp;${question.student.user.lastName}</c:when>
											<c:otherwise>XXXXXXXX XXXXXXXX</c:otherwise>
										</c:choose> at ${question.date}
									</span>
								</div>
								<div class='box-tools'>
									<button class='btn btn-box-tool' data-widget='collapse'>
										<i class='fa fa-minus'></i>
									</button>
									<button class='btn btn-box-tool' data-widget='remove'>
										<i class='fa fa-times'></i>
									</button>
								</div>
							</div>
							<div class='box-body no-margin forumdescription'>
								<p>${question.description}</p>
							</div>
							<div class='col-sm-3 pull-right questionfooter'>
								<a
									href='<c:url value="questionPage?questionId=${question.questionId}"/>'><button
										class='btn btn-primary btn-block btn-sm'>View
										More/Reply</button></a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>