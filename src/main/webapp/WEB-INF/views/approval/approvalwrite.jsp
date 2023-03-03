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
	
	function selectDocumentType() {
		
	}
	
	function addApprovalLineItem() {
		
	}
	
	function deleteApprovalLineItem() {
		
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
												<div id="status" class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">결재품의서</div>
											</div>
		        							<div id="filter_by_status" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
			        							<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType">결재품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType">휴일근무품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType">출장품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType">경조사품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
														<input type="radio" class="form-check-input" name="docType">예비군공가품의서
													</label>
												</div>
		        							</div>
		        						</div>
		        						
		        						<div class="card grid-margin" style="background-color: #e7e7ff;">
											<div class="card-body">
												<div class="d-flex justify-content-between">												
													<p class="card-title">결재선</p>
													<h3 class="mdi mdi-plus" onclick="popup()"></h3>
												</div>
			            						<div class="card card-tale grid-margin shadow-2 mb-0">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="text-white font-weight-bold">장그래(기안)</p>
										                    	<p>공공사업1DIV 사원</p>
										                    </div>
									                    </div>
								                    </div>
			            						</div>
			            						<div class="d-flex align-items-stretch justify-content-center mb-0">
				            						<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>
			            						</div>
			            						<div class="card card-dark-blue grid-margin shadow-2 mb-0">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="text-white font-weight-bold">오상식</p>
										                    	<p>공공사업1DIV 차장</p>
										                    </div>
										                    <div class="col-2">
										                    	<i class="mdi mdi-close"></i>
										                    </div>
									                    </div>
								                    </div>
			            						</div>
			            						<div class="d-flex align-items-stretch justify-content-center mb-0">
				            						<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>
			            						</div>
			            						<div class="card card-dark-blue grid-margin shadow-2 mb-0">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="text-white font-weight-bold">김부련</p>
										                    	<p>공공사업1DIV 부장</p>
										                    </div>
										                    <div class="col-2">
										                    	<i class="mdi mdi-close"></i>
										                    </div>
									                    </div>
								                    </div>
			            						</div>
			            						<div class="d-flex align-items-stretch justify-content-center mb-0">
				            						<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>
			            						</div>
			            						<div class="card card-dark-blue shadow-2">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="text-white font-weight-bold">최전무</p>
										                    	<p>공공사업1DIV 대표이사</p>
										                    </div>
										                    <div class="col-2">
										                    	<i class="mdi mdi-close"></i>
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
		        								<input type="hidden" name="empId" value="202302271">
		        								<input type="hidden" name="docReportDate" value="2023/03/02">
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