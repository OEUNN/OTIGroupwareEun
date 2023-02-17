<%@ page contentType="text/html; charset=UTF-8"%>

<div id="main_menu_list">
	<ul class="nav flex-column">
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<img src="${pageContext.request.contextPath}/resources/images/home.png">
				<div class="font-weight-bold">HOME</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<img src="${pageContext.request.contextPath}/resources/images/email.png">
				<div class="font-weight-bold">메일</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<img src="${pageContext.request.contextPath}/resources/images/list.png">
				<div class="font-weight-bold">게시판</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/approval/main">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/file.png">
				</div>
				<div class="font-weight-bold">전자결재</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<img src="${pageContext.request.contextPath}/resources/images/hr.png">
				<div class="font-weight-bold">HR</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<img src="${pageContext.request.contextPath}/resources/images/people.png">
				<div class="font-weight-bold">조직도</div>
			</a>
		</li>	
	</ul>
</div>