<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item">
		<a class="nav-link" href="${pageContext.request.contextPath}/home"> 
			<i class="mdi mdi-home menu-icon"></i> 
			<span class="menu-title" style="font-family: Nunito, sans-serif;">HOME</span>
		</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
			<i class="mdi mdi-email menu-icon"></i> 
			<span class="menu-title">메일</span>
			<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
					<a class="nav-link" href="<c:url value='/mail/mailwrite'/>">메일쓰기</a>
						</li>
					<li class="nav-item">
					<a class="nav-link" href="<c:url value='/mail/receivedmail'/>">받은 메일</a>
						</li>
					<li class="nav-item">
					<a class="nav-link" href="<c:url value='/mail/sendmail'/>">보낸 메일</a>
						</li>
					<li class="nav-item">
					<a class="nav-link" href="<c:url value='/mail/importmail'/>">중요 메일</a>
						</li>
					<li class="nav-item">
					<a class="nav-link" href="<c:url value='/mail/tempmail'/>">임시 보관함</a>
						</li>
					<li class="nav-item">
					<a class="nav-link" href="<c:url value='/mail/trashmail'/>">휴지통</a>
						</li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
		<a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements"> 
			<i class="mdi mdi-view-list menu-icon"></i> 
			<span class="menu-title">게시판</span>
			<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item">
						<a class="nav-link" href="<c:url value='/board/board'/>">사내 공지</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<c:url value='/board/hrboard'/>">인사 발령</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<c:url value='/board/familyeventboard'/>">경조사</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts"> 
				<i class="mdi mdi-file-multiple menu-icon"></i> 
				<span class="menu-title">전자결재</span> 
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="charts">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="<c:url value='/approval/totaldocument'/>">전체문서함</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/approval/approvalwrite'/>">기안 작성</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/approval/draftdocument'/>">기안함</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/approval/completeddocument'/>">완결문서함</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/approval/tempdocument'/>">임시저장함</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/approval/returneddocument'/>">반려/회수함</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/approval/pendeddocument'/>">결재대기함</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables"> 
				<i class="mdi mdi-account-card-details menu-icon"></i> 
				<span class="menu-title" style="font-family: Nunito, sans-serif;">HR</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="tables">
				<ul class="nav flex-column sub-menu">
					<!-- 공통 -->
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hr/myattendance">나의 근무</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hr/myatdapplication">나의 근무신청</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hr/myleave">나의 휴가</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hr/empleave">부서휴가현황</a></li>
					<!-- 부서장 -->
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hr/hrapplication"">HR 신청내역</a></li>
				</ul>
			</div></li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='/organizationchart'/>" aria-expanded="false" aria-controls="icons"> 
				<i class="mdi mdi-sitemap menu-icon"></i>
				<span class="menu-title">조직도</span>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#employee" aria-expanded="false" aria-controls="employee">
				<i class="mdi mdi-account-card-details menu-icon"></i> 
				<span class="menu-title" style="font-family: Nunito, sans-serif;">인사 관리</span> 
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="employee">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="<c:url value='/employee/selectemployee'/>">임직원 조회</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/employee/insertemployee'/>">임직원 등록</a></li>
				</ul>
			</div>
		</li>
	</ul>
</nav>