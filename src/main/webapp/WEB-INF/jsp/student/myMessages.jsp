<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<h1>My Messages</h1>
</section>
<section class="content">
	<div class="row">
		<c:choose>
			<c:when test="${empty pagetype}">
				<c:choose>
					<c:when test="${not empty messages}">
						<div class="col-md-8">
							<div class="box box-primary direct-chat direct-chat-primary">
								<div class="box-header with-border">
									<h3 class="box-title">
										<c:choose>
											<c:when
												test="${messages[0].messageMaster.messageFrom.userId == user.userId}">
												<a
													href="<c:url value='/student/searchuser/profile?userid=${messages[0].messageMaster.messageTo.userId}'/>">${messages[0].messageMaster.messageTo.firstName}
													${messages[0].messageMaster.messageTo.lastName}</a>
											</c:when>
											<c:otherwise>
												<a
													href="<c:url value='/student/searchuser/profile?userid=${messages[0].messageMaster.messageFrom.userId}'/>">${messages[0].messageMaster.messageFrom.firstName}
													${messages[0].messageMaster.messageFrom.lastName}</a>
											</c:otherwise>
										</c:choose>
									</h3>
									<div class="box-tools pull-right">
										<button class="btn btn-box-tool" onclick="location.reload();">
											<i class="fa fa-refresh"></i>
										</button>
										<button class="btn btn-box-tool" data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button class="btn btn-box-tool" data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<div class="box-footer">
									<form method="post">
										<div class="input-group">
											<input type="hidden" value="${userId}" name="userId">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-btn">
												<button type="submit" class="btn btn-primary btn-flat">Send</button>
											</span>
										</div>
									</form>
								</div>
								<div class="box-body">
									<div class="direct-chat-messages">
										<c:forEach var="message" items="${messages}">
											<c:choose>
												<c:when test="${message.sender.userId==user.userId}">
													<div class="direct-chat-msg">
														<div class="direct-chat-info clearfix">
															<span class="direct-chat-name pull-left">${message.sender.firstName}
																${message.sender.lastName} </span> <span
																class="direct-chat-timestamp"> (${message.time})</span>
														</div>
														<img class="direct-chat-img"
															src="<c:url value='/dist/img/user/${message.sender.userId}/self${message.sender.appliedOn.getTime()}.jpg'/>"
															alt="message user image">
														<div class="direct-chat-text pull-left">${message.message}</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="direct-chat-msg right">
														<div class="direct-chat-info clearfix">
															<span class="direct-chat-name pull-right">${message.sender.firstName}
																${message.sender.lastName}<span
																class="direct-chat-timestamp pull-right">(${message.time})</span>
															</span>
														</div>
														<img class="direct-chat-img"
															src="<c:url value='/dist/img/user/${message.sender.userId}/self${message.sender.appliedOn.getTime()}.jpg'/>"
															alt="message user image">
														<div class="direct-chat-text pull-right">${message.message}</div>
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-md-8">
							<div class="box box-primary direct-chat direct-chat-primary">
								<div class="box-header with-border">
									<h3 class="box-title">No Messages</h3>
									<div class="box-tools pull-right">
										<button class="btn btn-box-tool" data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button class="btn btn-box-tool" data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<div class="box-footer">
									<form method="post">
										<div class="input-group">
											<input type="hidden" value="${userId}" name="userId">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-btn">
												<button type="submit" class="btn btn-primary btn-flat">Send</button>
											</span>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<div class="col-md-8">
					<div class="box box-primary direct-chat direct-chat-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Choose chat from sidebar to send or
								view messages</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button class="btn btn-box-tool" data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="col-md-4">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Recent Messages</h3>
				</div>
				<div class="box-body">
					<c:forEach var="chat" items="${allChats}">
						<c:choose>
							<c:when test="${chat.messageFrom.userId!=user.userId}">
								<c:if test="${not empty chat.messages}">
									<div class='user-block'>
										<img class='img-circle'
											src="<c:url value='/dist/img/user/${chat.messageFrom.userId}/self${chat.messageFrom.appliedOn.getTime()}.jpg'/>"
											alt='user image'> <span class='username'><a
											href="<c:url value='/student/myMessages?userId=${chat.messageFrom.userId}'/>">${chat.messageFrom.firstName}
												${chat.messageFrom.lastName}</a></span> <span class='description'>${chat.messages[0].time}</span>
									</div>
									<p class="text-muted recent-message">${chat.messages[0].message}</p>
									<hr>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${not empty chat.messages}">
									<c:if test="${chat.messageTo.userId!=user.userId}">
										<div class='user-block'>
											<img class='img-circle'
												src="<c:url value='/dist/img/user/${chat.messageTo.userId}/self${chat.messageTo.appliedOn.getTime()}.jpg'/>"
												alt='user image'> <span class='username'><a
												href="<c:url value='/student/myMessages?userId=${chat.messageTo.userId}'/>">${chat.messageTo.firstName}
													${chat.messageTo.lastName}</a></span> <span class='description'>${chat.messages[0].time}</span>
										</div>
										<p class="text-muted recent-message">${chat.messages[0].message}</p>
										<hr>
									</c:if>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>