<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub_menu_title" class="row mb-3">
	게시판
</div>
<div id="sub_menu_list" class="row flex-column">
	<div>
		<a href="${pageContext.request.contextPath}/approval/totalDocumentBox">전체문서함</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/approval/write">기안작성</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/approval/draftDocumentBox">기안함</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/approval/tempDocumentBox">임시저장함</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/approval/returnedDocumentBox">반려/회수함</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/approval/pendedDocumentBox">결재함</a>
	</div>
</div>
