<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tinymce/tinymceinit.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
	<script type="text/javascript">
	//팝업창 중앙정렬에 필요한 변수와 함수
	let popupWindow;
	const viewportWidth = window.innerWidth || document.documentElement.clientWidth;
	const viewportHeight = window.innerHeight || document.documentElement.clientHeight;
	const popUpTop = window.screen.height / 2;
	const popUpLeft = window.screen.width / 2;
	const popUpWidth = 800;
	const popUpHeight = 400;
	const rPopUpWidth = 450;
	const rPopUpHeight = 250;

	function approvePopup(){
		popupWindow = window.open("../opinion/approve", "opinion", "width=" + popUpWidth + ", height=" + popUpHeight + ", top=" + ((popUpTop - popUpHeight)/2) + ", left=" +((popUpLeft - popUpWidth)/2) + ", menubars=no, status=no, titlebars=no");
		const popupWidth = popupWindow.innerWidth;
		const popupHeight = popupWindow.innerHeight;
		const leftPosition = (viewportWidth - popupWidth) / 2;
		const topPosition = (viewportHeight - popupHeight) / 2;
		popupWindow.moveTo(leftPosition, topPosition);
	}
	
	function returnPopup(){
		popupWindow = window.open("../opinion/return", "opinion", "width=" + popUpWidth + ", height=" + popUpHeight + ", top=" + ((popUpTop - popUpHeight)/2) + ", left=" +((popUpLeft - popUpWidth)/2) + ", menubars=no, status=no, titlebars=no");
		const popupWidth = popupWindow.innerWidth;
		const popupHeight = popupWindow.innerHeight;
		const leftPosition = (viewportWidth - popupWidth) / 2;
		const topPosition = (viewportHeight - popupHeight) / 2;
		popupWindow.moveTo(leftPosition, topPosition);
	}
	
	function retrievePopup(){
		popupWindow = window.open("../opinion/retrieve", "opinion", "width=" + rPopUpWidth + ", height=" + rPopUpHeight + ", top=" + ((popUpTop - rPopUpHeight)/2) + ", left=" +((popUpLeft - rPopUpWidth)/2) + ", menubars=no, status=no, titlebars=no");
		const popupWidth = popupWindow.innerWidth;
		const popupHeight = popupWindow.innerHeight;
		const leftPosition = (viewportWidth - popupWidth) / 2;
		const topPosition = (viewportHeight - popupHeight) / 2;
		popupWindow.moveTo(leftPosition, topPosition);
	}
	
	//결재문서 요청
	$(() => {
		tinymce.activeEditor.mode.set("readonly");
		docId = $("#docId").val();
		contextPath = $("#contextPath").val();
		$.ajax({
			url: contextPath + '/approval/viewdetail/' + docId + '/documentdetail',
			success: function(data) {
				tinymce.get("document_detail").setContent(data.docContent);
			} 
		});
	});
	
	//열람으로 상태 업데이트
	$(() => {
		empId = $("#empId").val();
		docId = $("#docId").val();
		
		contextPath = $("#contextPath").val();
		$.ajax({
			url: contextPath + '/approval/viewdetail/' + docId + '/open',
			data: {
				empId: empId,
				docId: docId,
				state : "열람", 
			}
		});
	});
	
	$(() => {
		$(window).on("message", (event) => {
			console.log(event);
			//팝업창에서 전송한 데이터 얻기(팝업창에서 postMessage() 사용해야 함)
			let receivedData = event.originalEvent.data;
			
			//form 양식에 상태랑 의견 데이터 추가하기
			$("#decisionForm").append('<input type="hidden" name="aprvLineState" value="' + receivedData.approvalLineState + '">');
			$("#decisionForm").append('<input type="hidden" name="aprvLineOpinion" value="' + receivedData.opinion + '">');
			$("#decisionForm").append('<input type="hidden" name="attached" value="' + receivedData.attached + '">');
			
			$("#decisionForm").submit();
		});
	});
	</script>
	<style>
	a:hover {
		text-decoration: none;
	}
	</style>
</head>

<body >
<div class="container-scroller">

	<!-- partial:../../partials/_navbar.jsp -->
	<%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
	
	<!-- partial -->
	<div class="container-fluid page-body-wrapper">
	
	  	<!-- partial:../../partials/_settings-panel.jsp -->
		<!-- partial -->
		
		<!-- partial:../../partials/_sidebar.jsp -->
		<%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
		<!-- partial -->
			
		<!-- ***** content-start ***** -->
		<input id="contextPath" type="hidden" value="${pageContext.request.contextPath}"/>
		<input id="docId" type="hidden" name="docId" value="${document.docId}">
		<form id="decisionForm" action="<c:url value='/approval/viewdetail/${document.docId}'/>" method="post">
		<input name="docType" type="hidden" value="${document.docType}">
		</form>
		<div class="main-panel">
	        <div class="content-wrapper">
	        	<div class="row">
	        		<div class="col-md-9 grid-margin">
	        			<div class="card gird-margin shadow-2">
		        			<div class="card-body">
		        				<div class="d-flex justify-content-between align-items-center mb-4">
		        					<div class="card-title mb-0">문서 상세 보기</div>
		        					<div class="d-flex">
		        						<c:if test="${reader.aprvLineRole == '결재' && reader.aprvLineState != '승인' && reader.aprvLineState != '반려'}">
										<button type="submit" onclick="approvePopup()" id="popup-btn" class="btn btn-md btn-success mx-2">
											<span class="mdi mdi-calendar-clock align-middle"></span>
											<span>승인</span>
										</button>
										<button type="submit" onclick="returnPopup()" id="popup-btn" class="btn btn-md btn-danger mx-2">
											<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
											<span>반려</span>
										</button>
		        						</c:if>
										<c:if test="${reader.aprvLineRole == '기안' && document.docTempYn == 'N' && document.docState != '회수' && document.docReadYn == 'N'}">
										<button type="submit" onclick="retrievePopup()" id="popup-btn" class="btn btn-md btn-secondary mx-2">
											<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
											<span>회수</span>
										</button>
										</c:if>
										<c:if test="${reader.aprvLineRole == '기안' && (document.docState == '반려' || document.docState == '회수' || document.docTempYn == 'Y')}">
										<form action="<c:url value="/approval/write/${document.docId}"></c:url>">
										<button type="submit" id="popup-btn" class="btn btn-md btn-primary mx-2">
											<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
											<span>재기안하기</span>
										</button>
										</form>
										</c:if>
		        					</div>
		        				</div>
		        				<div class="card-body mb-3" style="box-shadow: 0px 0px 0px white;">
									<textarea id="document_detail" style="width: inherit;"></textarea>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
	        		<div class="col-md-3 grid-margin">
						<div class="card grid-margin">
							<div class="card-body">
								<div class="d-flex justify-content-between">												
									<p class="card-title">결재선</p>
								</div>
								
								<c:forEach items="${approvalLines}" var="approvalLine" varStatus="i">
								<div class="row m-1">
									<c:choose>
									<c:when test="${approvalLine.aprvLineState == '승인'}">
		       						<div class="card bg-success grid-margin shadow-2 mb-0 w-100">
									</c:when>
									<c:when test="${approvalLine.aprvLineState == '반려'}">
		       						<div class="card bg-danger grid-margin shadow-2 mb-0 w-100">
									</c:when>
									<c:when test="${approvalLine.aprvLineState == '열람'}">
		       						<div class="card bg-warning grid-margin shadow-2 mb-0 w-100">
									</c:when>
									<c:when test="${approvalLine.aprvLineState == '미결'}">
		       						<div class="card bg-secondary grid-margin shadow-2 mb-0 w-100">
									</c:when>
									</c:choose>
					                    <div class="card-body">
						                    <div class="row mb-3">
							                    <div class="col-10">
							                    	<p class="card-title fs-3" style="font-weight:normal; color: white; background-color: transparent;">${approvalLine.employee.empName}</p>
							                    	<p>${approvalLine.department.depName} ${approvalLine.position.posName}</p>
							                    </div>
						                    </div>
						                    <div class="row">
						                    <c:choose>
						                    	<%-- 결재순서가 아님 --%>
						                    	<c:when test="${document.docAprvStep != approvalLine.aprvLineOrder}">
						                    	<div class="col-12">
						                    		<h3 style="text-align: center; font-weight:bold; color: white; margin-bottom: -3px;">${approvalLine.aprvLineState}</h3>
						                    	</div>
						                    	</c:when>
						                    	<%-- 현재 읽는 사용자 이외 사람이 결재 순서임 --%>
						                    	<c:when test="${reader.aprvLineOrder != approvalLine.aprvLineOrder && document.docAprvStep == approvalLine.aprvLineOrder && document.docAprvStep > 0}">
						                    	<div class="col-12">
						                    		<h3 style="text-align: center; font-weight:bold; color: white; margin-bottom: -3px;">${approvalLine.aprvLineState}</h3>
						                    	</div>
						                    	</c:when>
						                    	<%-- 현재 읽는 사용자가 문서상의 결재 순서임--%>
						                    	<c:when test="${reader.aprvLineOrder == approvalLine.aprvLineOrder && document.docAprvStep == approvalLine.aprvLineOrder && document.docAprvStep > 0}">
					            	        	<div class="col-6">
						                    		<button class="btn btn-success w-100" onclick="approvePopup()" style="text-align: center; font-weight:bold; margin-bottom: -3px;">승인</button>
						                    	</div>
						                    	<div class="col-6 d-flex justify-content-center">
						                    		<button class="btn btn-danger w-100" onclick="returnPopup()" style="text-align: center; font-weight:bold; margin-bottom: -3px;">반려</button>
						                    	</div>
						                    	</c:when>
						                    </c:choose>
						                    </div>
					                    </div>
									</div>
								</div>
								<c:if test="${i.last != true}">
									<div class="row m-1">
			       						<div class="d-flex align-items-stretch justify-content-center mb-0 w-100">
			          						<h1 class="mdi mdi-menu-down mt-1 mb-0 align-self-center"></h1>
			      						</div>
									</div>
								</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="card grid-margin">
							<div class="card-body">
								<p class="card-title"><a onclick="popup()">첨부파일</a></p>
									<ul class="icon-data-list">
									<li>
										<c:if test="${document.documentFiles != null}">
										<c:forEach items="${document.documentFiles}" var="documentFiles">
										<div class="d-flex justify-content-between my-3"><a class="font-weight-bold text-primary" href="<c:url value="/approval/filedownload/${documentFiles.docFileId}"></c:url>">${documentFiles.docFileName}</a></div>
										</c:forEach>
										</c:if>
									</li>
								</ul>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<p class="card-title"><a onclick="popup()">의견란</a></p>
									<ul class="icon-data-list">
									<li>
										<c:forEach items="${approvalLines}" var="approvalLine">
										<c:if test="${approvalLine.aprvLineOpinion != null && approvalLine.aprvLineOpinion != '' && approvalLine.aprvLineRole != '기안'}">
										<div class="d-flex">
											<img src="<c:url value='/employee/file/${approvalLine.empId}'/>" alt="profile"/>
											<div>
												<p class="h4 font-weight-bold text-primary mb-1">${approvalLine.employee.empName} ${approvalLine.position.posName}</p>
												<p class="mb-4">${approvalLine.aprvLineOpinion}</p>	
											</div>
										</div>
										</c:if>
										</c:forEach>
									</li>
								</ul>
							</div>
						</div>
	        		</div>
	        	</div>
			</div>
		<!-- ***** content-end ***** -->
			
		<!-- partial:../../partials/_footer.jsp -->
		<%@ include file="/WEB-INF/views/common/_footer.jsp" %>
		<!-- partial -->
		
		</div>
		<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
</body>

</html>