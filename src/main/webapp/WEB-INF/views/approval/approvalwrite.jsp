<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<script src="<c:url value="/resources/vendors/tinymce/tinymce.min.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/tinymce/tinymceinit.js"></c:url>"></script>
	<script src="<c:url value="/resources/vendors/tinymce/themes/silver/theme.min.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/file-upload.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/custom/dropdown.js"></c:url>"></script>
	<script type="text/javascript">
	function popup(){
	    let url = "organization";
	    let name = "organization";
	    let option = "width=500, height=700, top=500px, left=500px, menubars=no, status=no, titlebars=no"
	    window.open(url, name, option);
	}
	
	$(() => {
		$(window).on("message", (event) => {
			//팝업창에서 전송한 데이터 얻기(팝업창에서 postMessage() 사용해야 함)
			let receivedData = event.originalEvent.data;
			
			//결재선에 추가하기
			$("#approvalLine").append(receivedData.content);
			
			//x에다가 클릭 시 삭제 이벤트 등록하기
			var remover = '#' + receivedData.removeClass;
			var removee = '.' + receivedData.removeClass;
			$(remover).on('click', (event) => {
				$(removee).remove();
				//iframe은 일반적인 $()로 접근할 수 없다
				$("iframe").contents().find("body").find(removee).remove();
			});

			//form 양식에 추가하기
			$("#approvalForm").append('<input class="' + receivedData.removeClass + '" type="hidden" name="approvalId" value="' + receivedData.empId + '">');
			$("#approvalForm").append('<input class="' + receivedData.removeClass + '" type="hidden" name="approvalName" value="' + receivedData.empName + '">');
			$("#approvalForm").append('<input class="' + receivedData.removeClass + '" type="hidden" name="depName" value="' + receivedData.depName + '">');
			$("#approvalForm").append('<input class="' + receivedData.removeClass + '" type="hidden" name="posName" value="' + receivedData.posName + '">');
			$("#approvalForm").append('<input class="' + receivedData.removeClass + '" type="hidden" name="approvalOrder" value="' + receivedData.approvalOrder + '">');
			$("#approvalForm").append('<input class="' + receivedData.removeClass + '" type="hidden" name="approvalState" value="미결">');
			$("#approvalForm").append('<input class="' + receivedData.removeClass + '" type="hidden" name="approvalDate" value="미정">');
			
			//iframe 내부 초기화
			$("iframe").contents().find("body").find("#formApprovalPosition").append('<td class="' + receivedData.removeClass + ' content-align-center text-content">' + receivedData.posName + '</td>');
			$("iframe").contents().find("body").find("#formApprovalState").append('<td class="' + receivedData.removeClass + ' approvalLineState content-align-center text-content">미결</td>');
			$("iframe").contents().find("body").find("#formApprovalName").append('<td class="' + receivedData.removeClass + ' content-align-center text-content">' + receivedData.empName + '</td>');
			$("iframe").contents().find("body").find("#formApprovalDate").append('<td class="' + receivedData.removeClass + ' approvalDate content-align-center text-content">날짜 미정</td>');
		});
	});
	</script>

	<style type="text/css">
	.collapse, .collapsing {
		box-shadow: 0px 0px 0px white !important;
	}
	
	.tox-editor-area {
		contenteditable: false;
	}
	</style>
</head>
<body>
<div class="container-scroller">
	<input type="hidden" id="drafterName" value="${sessionScope.employee.empName}">
	<input type="hidden" id="drafterDepName" value="${sessionScope.employee.depName}">
	<input type="hidden" id="drafterPosName" value="${sessionScope.employee.posName}">
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
		<div class="main-panel">
	        <div class="content-wrapper">
	        
	        	<div class="row">
            		<div class="col-md-12 grid-margin">
            			<div class="card grid-margin shadow-2">
            				<div class="card-body">
            					<p class="card-title mb-3">기안 작성</p>
            					<div class="row ml-1">
	            					<div class="col-3 card-body mb-3" style="height: fit-content;">
										<div class="card grid-margin" style="border-radius:8px; border: 2px solid #4747A1;">
											<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
												<a class="font-weight-bold text-decoration-none" data-target="#filter_by_status" data-toggle="collapse" style="color: #4747A1;">문서종류</a>
												<div id="status" class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;"></div>
											</div>
		        							<div id="filter_by_status" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType" value="extrawork">휴일근무품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType" value="businesstrip">출장품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType" value="familyevent">경조사품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType" value="militaryservice">예비군공가품의서
													</label>
												</div>
		        							</div>
		        						</div>
		        						
		        						<div class="card grid-margin" style="background-color: #e7e7ff;">
											<div id="approvalLine" class="card-body">
												<div class="d-flex justify-content-between">												
													<p class="card-title">결재선</p>
													<h3 class="mdi mdi-plus" onclick="popup()"></h3>
												</div>
			            						<div class="card card-tale grid-margin shadow-2 mb-0">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="text-white font-weight-bold">${sessionScope.employee.empName}(기안)</p>
										                    	<p>${sessionScope.employee.depName} ${sessionScope.employee.posName}</p>
										                    </div>
									                    </div>
								                    </div>
			            						</div>
											</div>
										</div>
										
										<div class="card-body" style="background-color: #e7e7ff;">
											<div class="d-flex justify-content-between">												
												<p class="card-title"><label for="upload">첨부파일</label></p>
											</div>
											 <div class="form-group bg-white">
												<input type="file" id="upload" class="file-upload-default" multiple>
												<div class="input-group col-xs-12">
													<input type="text" class="form-control file-upload-info" style="border-radius: 0;" disabled placeholder="업로드 할 파일">
													<span class="input-group-append">
														<button class="file-upload-browse btn btn-primary" style="border-radius: 0;" type="button">파일 첨부</button>
													</span>
												</div>
											</div>
										</div>
	            					</div>
	            					<div class="col-9 card grid-margin mb-3 d-flex justify-content-center flex-column" style="background-color: transparent; box-shadow: 0px 0px 0px white;">
		        						<div class="card-body grid-margin">
											<div class="d-flex justify-content-between align-items-center mb-4">
												<div class="card-title mb-0">문서 내용</div>
												<div class="d-flex">
													<button type="submit" form="approvalForm" id="popup-btn" class="btn btn-md btn-warning mx-2">
														<span class="mdi mdi-calendar-clock align-middle"></span>
														<span>임시저장</span>
													</button>
													<button type="submit" form="approvalForm" id="popup-btn" class="btn btn-md btn-primary mx-2">
														<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
														<span>상신하기</span>
													</button>
												</div>
											</div>
											<form id="approvalForm" action="<c:url value='/approval/approvalwrite'/>" method="post">
		        								<textarea id="document" name="document" style="width: inherit;"></textarea>
		        								<input type="hidden" name="drafterId" value="${sessionScope.employee.empId}">
											</form>
		        						</div>
	            					</div>
            					</div>
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