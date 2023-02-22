<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tinymce/tinymceinit.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/file-upload.js"></script>
	<script>
	function popup(){
	    let url = "organization";
	    let name = "organization";
	    let option = "width=500, height=700, top=500px, left=500px, menubars=no, status=no, titlebars=no"
	    window.open(url, name, option);
	    
	    console.log($('.main-panel'));
	}
	</script>

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
            					<div class="row ml-1">
	            					<div class="col-3 card-body mb-3">
										<div class="card grid-margin" style="border-radius:8px; border: 2px solid #4747A1;">
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
													<h3 class="mdi mdi-plus" onclick="popup()"></h3>
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
													<p class="card-title"><label for="upload">첨부파일</label></p>
													<h3 class="mdi mdi-plus"></h3>
												</div>
												 <div class="form-group">
													<input type="file" id="upload" class="file-upload-default" multiple>
													<div class="input-group col-xs-12">
														<input type="text" class="form-control file-upload-info" disabled placeholder="Upload">
														<span class="input-group-append">
															<button class="file-upload-browse btn btn-primary" type="button">Upload</button>
														</span>
													</div>
												</div>
											</div>
										</div>
	            					</div>
	            					<div class="col-9 card grid-margin mb-3 d-flex justify-content-center flex-column" style="background-color: transparent; box-shadow: 0px 0px 0px white;">
		        						<div class="card-body">
		        							<div class="card-title">
		        								<div class="row">
		        									<div class="col-6"><span style="vertical-align: text-top;">내용</span></div> 
		        									<div class="col-6 d-flex justify-content-end">
		        										<div class="btn btn-primary">상신하기</div>
		        										<div class="ml-1 btn btn-warning">임시저장</div>
		        									</div>
		        								</div>
		        							</div>
		        							<textarea id="document" style="width: inherit;"></textarea>
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