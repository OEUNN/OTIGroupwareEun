<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub_menu_title" class="row mb-3">
	메일
</div>
<div id="sub_menu_list" class="row flex-column">
	<div>
		<a href="<c:url value='/writemail'/>">메일 쓰기</a>
	</div>
	<div>
		<a href="<c:url value='/mail'/>">받은 메일</a>
	</div>
	<div>
		<a href="<c:url value='/recivedmail'/>">보낸 메일</a>
	</div>
	<div>
		<a href="<c:url value='/importmail'/>">중요 메일</a>
	</div>
	<div>
		<a href="<c:url value='/tempmail'/>">임시 보관함</a>
	</div>
	<div>
		<a href="<c:url value='/trashmail'/>">휴지통</a>
	</div>
</div>
