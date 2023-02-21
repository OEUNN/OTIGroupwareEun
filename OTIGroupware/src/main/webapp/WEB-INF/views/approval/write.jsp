<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/resources/js/dropify.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymceinit.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
	<style type="text/css">
	.collapse, .collapsing {
		box-shadow: 0px 0px 0px white !important;
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
		<%@ include file="/WEB-INF/views/common/_settings-panel.jsp" %>
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
            					<div class="row">
									<p class="col-12 card-title mb-3">기안 작성하기</p>
            					</div>
            					<div class="row mx-3">
	            					<div class="col-4 card-body mb-3">
										<div class="card mb-5" style="border-radius:8px; border: 2px solid #4747A1;">
											<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
												<a class="font-weight-bold text-decoration-none" data-target="#filter_by_status" data-toggle="collapse" style="color: #4747A1;">문서종류</a>
												<div class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">결재품의서</div>
											</div>
		        							<div id="filter_by_status" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
			        							<div class="form-check font-weight-bold text-info">
													<label class="form-check-label">
														<input type="checkbox" class="form-check-input" name="optradio" checked>결재품의서
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label text-muted">
														<input type="checkbox" class="form-check-input" name="optradio">휴일근무품의서
													</label>
												</div>
												<div class="form-check disabled">
													<label class="form-check-label text-muted">
														<input type="checkbox" class="form-check-input" name="optradio">출장품의서
													</label>
												</div>
												<div class="form-check disabled">
													<label class="form-check-label text-muted">
														<input type="checkbox" class="form-check-input" name="optradio">경조사품의서
													</label>
												</div>
												<div class="form-check disabled">
													<label class="form-check-label text-muted">
														<input type="checkbox" class="form-check-input" name="optradio">예비군공가품의서
													</label>
												</div>
		        							</div>
		        						</div>
		        						
		        						<div class="card grid-margin">
											<div class="card-body">
												<div class="d-flex justify-content-between">												
													<p class="card-title">결재선</p>
													<h3 class="mdi mdi-plus"></h3>
												</div>
			            						<div class="card card-dark-blue grid-margin shadow-2 mb-0">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="card-title text-white fs-3">오상식</p>
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
										                    	<p class="card-title text-white fs-3">김부련</p>
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
			            						<div class="card card-dark-blue grid-margin shadow-2">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="card-title text-white fs-3">최전무</p>
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
										
		        						<div class="card grid-margin">
											<div class="card-body">
												<div class="d-flex justify-content-between">												
													<p class="card-title">첨부파일</p>
													<h3 class="mdi mdi-plus"></h3>
												</div>
												<div class="dropify-wrapper">
													<div class="dropify-message">
														<p>파일 올리기</p>
													</div>
													<input type="file" class="dropify"/>
												</div>
											</div>
										</div>

	            					</div>
	            					<div class="col-8 card-body mb-3" style="box-shadow: 0px 0px 0px white;">
	            						<textarea id='tinyMceExample'></textarea>
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