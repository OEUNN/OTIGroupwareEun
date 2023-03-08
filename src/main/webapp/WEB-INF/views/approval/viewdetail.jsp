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
	function popup(){
	    let url = "../opinion";
	    let name = "opinion";
	    let option = "width=800, height=400, top=100px, left=100px, menubars=no, status=no, titlebars=no"
	    window.open(url, name, option);
	}
	
	$(document).ready(function(){
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
	
	$(document).ready(function(){
		$(window).on("message", (event) => {
			//팝업창에서 전송한 데이터 얻기(팝업창에서 postMessage() 사용해야 함)
			let receivedData = event.originalEvent.data;
			
			//의견란 추가하기
			$("#opinion").append(receivedData.content);
			
			//form 양식에 추가하기
			$("#opinionForm").append('<input class="removeOpinion" type="hidden" name="employeeId" value="' + receivedData.empId + '">');
			$("#opinionForm").append('<input class="removeOpinion" type="hidden" name="aprvLineOpinion" value="' + receivedData.empName + '">');
			$("#opinionForm").append('<input class="removeOpinion" type="hidden" name="depName" value="' + receivedData.depName + '">');
			
			//x에다가 클릭 시 삭제 이벤트 등록하기
			var remover = '#' + receivedData.removeClass;
			var removee = '.' + receivedData.removeClass;
			$(remover).on('click', (event) => {
				$(removee).remove();
			});
		});
	});
	</script>
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
		<form id="decisionForm" action="<c:url value='/approval/decision'/>" method="post">
		<input id="docId" type="hidden" name="docId" value="${document.docId}"/>
		<input id="docTitle" type="hidden" name="docTitle" value="${document.docTitle}"/>
		<input id="docState" type="hidden" name="docState" value="${document.docState}"/>
		<input id="docReadYn" type="hidden" name="docReadYn" value="${document.docReadYn}"/>
		<input id="docAprvStep" type="hidden" name="docAprvStep" value="${document.docAprvStep}"/>
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
		        						<c:if test="${reader.aprvLineRole == '결재' && (reader.aprvLineState != '승인' || reader.aprvLineState != '반려')}">
										<button type="submit" form="decisionForm" id="popup-btn" class="btn btn-md btn-success mx-2">
											<span class="mdi mdi-calendar-clock align-middle"></span>
											<span>승인</span>
										</button>
										<button type="submit" form="decisionForm" id="popup-btn" class="btn btn-md btn-warning mx-2">
											<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
											<span>반려</span>
										</button>
		        						</c:if>
										<c:if test="${reader.aprvLineRole == '기안' && document.docReadYn == 'N'}">
										<button type="submit" form="decisionForm" id="popup-btn" class="btn btn-md btn-secondary mx-2">
											<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
											<span>회수</span>
										</button>
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
								
								<c:forEach items="${approvalLines}" var="approvalLine">
								<div class="row m-1">
									<c:choose>
									<c:when test="${approvalLine.aprvLineState == '승인'}">
		       						<div class="card bg-success grid-margin shadow-2 mb-0 w-100">
									</c:when>
									<c:when test="${approvalLine.aprvLineState == '반려'}">
		       						<div class="card bg-danger grid-margin shadow-2 mb-0 w-100">
									</c:when>
									<c:when test="${approvalLine.aprvLineState == '열람'}">
		       						<div class="card card-tale grid-margin shadow-2 mb-0 w-100">
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
							                    <div class="col-2">
							                    	<i class="mdi mdi-close"></i>
							                    </div>
						                    </div>
						                    <div class="row">
						                    	<c:if test="${session.empId != approvalLine.empId}">
						                    	<div class="col-12">
						                    		<h3 style="text-align: center; font-weight:bold; color: white; margin-bottom: -3px;">${approvalLine.aprvLineState}</h3>
						                    	</div>
						                    	</c:if>
						                    	<c:if test="${session.empId == approvalLine.empId}">
					            	        	<div class="col-6">
						                    		<button class="btn btn-success w-100" style="text-align: center; font-weight:bold; margin-bottom: -3px;">승인</button>
						                    	</div>
						                    	<div class="col-6 d-flex justify-content-center">
						                    		<button class="btn btn-danger w-100" style="text-align: center; font-weight:bold; margin-bottom: -3px;">반려</button>
						                    	</div>
						                    	</c:if>
						                    </div>
					                    </div>
									</div>
								</div>
								<div class="row m-1">
		       						<div class="d-flex align-items-stretch justify-content-center mb-0 w-100">
		          						<h1 class="mdi mdi-menu-down mt-1 mb-0 align-self-center"></h1>
		      						</div>
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<p class="card-title"><a onclick="popup()">의견란</a></p>
									<ul class="icon-data-list">
									<li>
										<div class="d-flex">
											<img src="images/faces/face2.jpg" alt="user">
											<div id="opinion">
											</div>
										</div>
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