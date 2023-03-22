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
	<script src="<c:url value="/resources/js/custom/fileupload.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/custom/approvalwritescript.js"></c:url>"></script>
	<script type="text/javascript">
	let popupWindow;
	const popUpTop = window.screen.height / 2;
	const popUpLeft = window.screen.width / 2;
	const popUpWidth = 500;
	const popUpHeight = 750;
	const popupAlign = () => {
		const viewportWidth = window.innerWidth || document.documentElement.clientWidth;
		const viewportHeight = window.innerHeight || document.documentElement.clientHeight;
		const popupWidth = popupWindow.innerWidth;
		const popupHeight = popupWindow.innerHeight;
		const leftPosition = (viewportWidth - popupWidth) / 2;
		const topPosition = (viewportHeight - popupHeight) / 2;
		popupWindow.moveTo(leftPosition, topPosition);
	}
	
	function popup(){
		if ($("iframe").contents().find(".positionText").length === 0) {
			swal({
				title: "문서가 없습니다",
				text: "양식을 먼저 불러와 주세요.",
				icon: "warning",
				button: "닫기"
			});
		}
		else {
		    let url = getContextPath() + "/approval/organization";
		    let name = "organization";
		    let option = "width=" + popUpWidth + ", height=" + popUpHeight + ", top=" + ((popUpTop - popUpHeight)/2) + ", left=" +((popUpLeft - popUpWidth)/2) + ", menubars=no, status=no, titlebars=no"
		    popupWindow = window.open(url, name, option);
			popupWindow.addEventListener("DOMContentLoaded", popupAlign());
		}
		
	}
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
												<div id="status" class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">
												<c:if test="${document.docType != null}">${document.docType}</c:if>
												</div>
											</div>
		        							<div id="filter_by_status" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '휴일근무품의서'}">
														<input id="extrawork" form="approvalForm" type="radio" class="form-check-input" name="docType" value="휴일근무품의서" checked>휴일근무품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '휴일근무품의서'}">
														<input id="extrawork" form="approvalForm" type="radio" class="form-check-input" name="docType" value="휴일근무품의서">휴일근무품의서
														</c:when>
													</c:choose>
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '출장품의서'}">
														<input id="businesstrip" form="approvalForm" type="radio" class="form-check-input" name="docType" value="출장품의서" checked>출장품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '출장품의서'}">
														<input id="businesstrip" form="approvalForm" type="radio" class="form-check-input" name="docType" value="출장품의서">출장품의서
														</c:when>
													</c:choose>
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '경조사품의서'}">
														<input id="familyevent" form="approvalForm" type="radio" class="form-check-input" name="docType" value="경조사품의서" checked>경조사품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '경조사품의서'}">
														<input id="familyevent" form="approvalForm" type="radio" class="form-check-input" name="docType" value="경조사품의서">경조사품의서
														</c:when>
													</c:choose>
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '예비군공가품의서'}">
														<input id="militaryservice" form="approvalForm" type="radio" class="form-check-input" name="docType" value="예비군공가품의서" checked>예비군공가품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '예비군공가품의서'}">
														<input id="militaryservice" form="approvalForm" type="radio" class="form-check-input" name="docType" value="예비군공가품의서">예비군공가품의서
														</c:when>
													</c:choose>
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
			            						<c:forEach items="${approvalLines}" var="approvalLine">
			            						<c:if test="${approvalLine.aprvLineRole != '기안'}">
			            						<div class="r${approvalLine.empId} d-flex align-items-stretch justify-content-center mb-0 remove-flag">
			            							<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>
			            						</div>
		            							<div class="r${approvalLine.empId} card card-dark-blue grid-margin shadow-2 mb-0 remove-flag approvalLineItems ">
			            							<div class="card-body">
				            							<div class="row">
					            							<div id="${approvalLine.empId}" class="empId col-10 init-flag">
						            							<p class="text-white font-weight-bold">${approvalLine.employee.empName}</p>
						            							<p>${approvalLine.department.depName} ${approvalLine.position.posName}</p>
					            							</div>
					            							<div class="col-2"><i id="r${approvalLine.empId}" class="mdi mdi-close"></i></div>
				            							</div>
			            							</div>
		            							</div>
		        								</c:if>
			            						</c:forEach>
											</div>
										</div>
										
										<div class="card-body" style="background-color: #e7e7ff;">
											<div class="d-flex justify-content-between">												
												<p class="card-title"><label for="upload">첨부파일</label></p>
											</div>
											<div id="fileList">
											<c:if test="${document.documentFiles != null}">
											<c:forEach items="${document.documentFiles}" var="documentFiles">
											<div class="d-flex justify-content-between font-weight-bold text-primary my-3"></div>${documentFiles.docFileName}.${documentFiles.docFileType}<i class="mdi mdi-minus"></i>
											</c:forEach>
											</c:if>
											</div>
										 	<div class="form-group bg-white">
												<input form="approvalForm" type="file" id="fileUploader" class="file-upload-default" name="files" multiple>
												<div class="input-group col-xs-12">
													<span class="input-group-append w-100">
														<button class="file-upload-browse btn btn-primary" style="border-radius: 0; width: inherit;" type="button">파일 첨부</button>
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
													<button onclick="isContentExist('Y')" type="button" id="popup-btn" class="btn btn-md btn-warning mx-2">
														<span class="mdi mdi-calendar-clock align-middle"></span>
														<span>임시저장</span>
													</button>
													<button onclick="isContentExist('N')" type="button" name="docTempYn" value="N" id="popup-btn" class="btn btn-md btn-primary mx-2">
														<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
														<span>상신하기</span>
													</button>
												</div>
											</div>
											
	        								<textarea form="approvalForm" id="document" name="docContent" style="width: inherit;"></textarea>
	        								
	        								<c:if test="${document.docId != null}">
	        								<input id="isDocumentExist" form="approvalForm" type="hidden" name="docId" value="${document.docId}">
	        								</c:if>
	        								<input form="approvalForm" type="hidden" name="docTitle" value="">
	        								<input form="approvalForm" type="hidden" name="docState" value="">
	        								<input form="approvalForm" type="hidden" name="docTempYn" value="">
	        								
	        								<!-- 기안자 -->
	        								<input type="hidden" id="drafterId" value="${sessionScope.employee.empId}">
	        								<input type="hidden" id="drafterName" value="${sessionScope.employee.empName}">
	        								<input type="hidden" id="drafterDepName" value="${sessionScope.employee.depName}">
	        								<input type="hidden" id="drafterPosName" value="${sessionScope.employee.posName}">
											<input form="approvalForm" class="r${sessionScope.employee.empId}" type="hidden" name="empId" value="${sessionScope.employee.empId}">
	        								<input form="approvalForm" class="r${sessionScope.employee.empId}" type="hidden" name="aprvLineRole" value="기안">
											<input form="approvalForm" class="r${sessionScope.employee.empId}" type="hidden" name="aprvLineOrder" value="0">
											<input form="approvalForm" class="r${sessionScope.employee.empId}" type="hidden" name="aprvLineApprovalDate" value="${approvalLine.aprvLineApprovalDate}">
											<input form="approvalForm" class="r${sessionScope.employee.empId}" type="hidden" name="aprvLineState" value="승인">
											
											<!-- 결재자  -->
	        								<c:forEach items="${approvalLines}" var="approvalLine">
	        								<c:if test="${approvalLine.aprvLineRole != '기안'}">
											<input form="approvalForm" class="r${approvalLine.empId} remove-flag" type="hidden" name="empId" value="${approvalLine.empId}">
	        								<input form="approvalForm" class="r${approvalLine.empId} remove-flag" type="hidden" name="aprvLineRole" value="${approvalLine.aprvLineRole}">
											<input form="approvalForm" class="r${approvalLine.empId} remove-flag" type="hidden" name="aprvLineOrder" value="${approvalLine.aprvLineOrder}">
											
											<c:if test='${approvalLine.aprvLineApprovalDate != null}'>
											<input form="approvalForm" class="r${approvalLine.empId} remove-flag" type="hidden" name="aprvLineApprovalDate" value="${approvalLine.aprvLineApprovalDate}">
											</c:if>
											<c:if test='${approvalLine.aprvLineState != null}'>
											<input form="approvalForm" class="r${approvalLine.empId} remove-flag" type="hidden" name="aprvLineState" value="${approvalLine.aprvLineState}">
											</c:if>
	        								</c:if>
	        								</c:forEach>
											<form id="approvalForm" method="post" enctype="multipart/form-data"></form>
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