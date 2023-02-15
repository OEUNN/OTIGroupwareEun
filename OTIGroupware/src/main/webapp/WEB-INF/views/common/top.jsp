<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-dark" style="margin-left: 100px;">
	<div class="d-flex align-items-center">
		<img src="${pageContext.request.contextPath}/resources/images/person.png" width="100" class="bg-secondary">
		<div class="ml-2">
			<span class="h4">홍길동</span>
			<span>사원</span>
			<div>
				<span>공공사업1DIV</span>
				<span>개발팀</span>
			</div>
		</div>
	</div>
	<div id="header_box">
		<a class="text-white" href="${pageContext.request.contextPath}/member/logout">
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/person_white.png" 
					 width="40" height="40" class="d-inline-block align-top">
			</div>
			 <div>마이페이지</div>
		</a>
		<a class="text-white" href="${pageContext.request.contextPath}/member/logout">
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/unlock.png" 
					 width="40" height="40" class="d-inline-block align-top">
			</div>
			 <div>로그아웃</div>
		</a>
	</div>
</nav>
<hr id="header_line">
	
