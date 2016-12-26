<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<section class="content-header">
	<h1>Question Page</h1>
</section>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-widget">
				<div class='box-header with-border'>
					<div class='user-block'>
						<c:choose>
							<c:when test="${question.student.user.gender eq user.gender}">
								<img class='img-circle'
									src="<c:url value='/dist/img/user/${question.student.user.userId}/self${question.student.user.appliedOn.getTime()}.jpg'/>"
									alt='user image'>
								<span class='username'><a
									href="<c:url value='/student/searchuser/profile?userid=${question.student.user.userId}'/>">${question.student.user.firstName}&nbsp;${question.student.user.lastName}</a></span>
								<span class='description'>${question.date}</span>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${question.student.user.gender == 'FEMALE'}">
										<img class='img-circle'
											src="<c:url value='/dist/img/userf.png'/>" alt='user image'>
									</c:when>
									<c:otherwise>
										<img class='img-circle'
											src="<c:url value='/dist/img/userm.png'/>" alt='user image'>
									</c:otherwise>
								</c:choose>
								<span class='username'>XXXXXXX XXXXXXX</span>
								<span class='description'>${question.date}</span>
							</c:otherwise>
						</c:choose>
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
				<div class='box-body'>
					<p class=questiontitle>${question.question}</p>
					<p>${question.description}</p>
					<span class='pull-right text-muted'>127 likes - 3 comments</span>
				</div>
				<div class='box-footer box-comments'>
					<c:forEach var="answer" items="${question.answers}">
						<div class='box-comment'>
							<c:choose>
								<c:when test="${answer.student.user.gender eq user.gender}">
									<img class='img-circle img-sm'
										src="<c:url value='/dist/img/user/${answer.student.user.userId}/self${answer.student.user.appliedOn.getTime()}.jpg'/>">
									<div class='comment-text'>
										<span class="username">${answer.student.user.firstName}&nbsp;${answer.student.user.lastName}
											<span class='text-muted pull-right'>${answer.date}</span>
										</span>${answer.answer}
									</div>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${answer.student.user.gender == 'FEMALE'}">
											<img class='img-circle img-sm'
												src="<c:url value='/dist/img/userf.png'/>">
										</c:when>
										<c:otherwise>
											<img class='img-circle img-sm'
												src="<c:url value='/dist/img/userm.png'/>">
										</c:otherwise>
									</c:choose>
									<div class='comment-text'>
										<span class="username">XXXXXXX XXXXXXX <span
											class='text-muted pull-right'>${answer.date}</span>
										</span>${answer.answer}
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="box-footer">
				<form method="post">
					<img class="img-responsive img-circle img-sm"
						src="<c:url value='/dist/img/user/${user.userId}/self${user.appliedOn.getTime()}.jpg'/>"
						alt="alt text">
					<div class="img-push">
						<input type="hidden" value="${question.questionId}"
							name=questionId>
						<div class="col-md-10">
							<textarea class="form-control input-sm " name="answer"
								placeholder="Enter your reply to post on this question"></textarea>
						</div>
						<div class="proceedbtn visible-xs"></div>
						<div class="col-md-2">
							<input class="form-control input-sm btn btn-primary"
								type="submit" value="Reply">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>