<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub_menu_title" class="row mb-3">
	게시판
</div>
<div id="sub_menu_list" class="row flex-column">
	<div>
		<a href="<c:url value='board'/>">사내 공지</a>
	</div>
	<div>
		<a href="<c:url value='/hrboard'/>">인사 발령</a>
	</div>
	<div>
		<a href="<c:url value='familyeventboard'/>">경조사</a>
	</div>
</div>
