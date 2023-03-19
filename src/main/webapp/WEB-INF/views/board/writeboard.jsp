<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		<!-- Custom js for this page-->
		<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymce.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/write-template.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/custom/fileupload.js"></script>
		<script src="<c:url value="/resources/js/file-upload.js"></c:url>"></script>
		<style type="text/css">
		.collapse, .collapsing {
			box-shadow: 0px 0px 0px white !important;
		}
		</style>
	</head>

	<body>
		<div class="container-scroller">
			<!-- Navbar -->
			<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
			<div class="container-fluid page-body-wrapper">
				<!-- Sidebar -->
				<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- Start write from -->
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<form class="card-body" id="boardForm" action="<c:url value='/board/write'></c:url>" method="post" enctype="multipart/form-data">
									<div class="d-flex justify-content-between align-items-center mb-4">
										<div class="card-title mb-0">게시글 쓰기</div>
										<div class="d-flex">
											<button type="submit" form="boardForm"  id="popup-btn" class="btn btn-md btn-primary mx-2">
												<span class="mdi mdi-telegram align-middle"></span> 
												<span>작성</span>
											</button>
										</div>
									</div>
									<div class="forms-sample">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-2 text-primary">
														<div class="d-flex align-items-center m-1">
															<i class="h3 my-auto mdi mdi-border-color"></i> 
															<span class="ml-2 font-weight-bold">제목</span>
														</div>
													</div>
													<div class="col-sm-5" style="border-bottom:1px solid #ced4da;">
														<input form="boardForm" class="h3 from-control" name="boardTitle" style="font-weight:bold; border:none;">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center ">
													<div class="col-sm-2 text-primary">
														<div class="d-flex align-items-center m-1">
															<i class="h3 my-auto mdi mdi-dns"></i> 
															<span class="ml-2 font-weight-bold">카테고리</span>
														</div>
													</div>
													<div class="col-sm-2 p-0"> 
														<select class="form-control" id="category" style="font-weight:bold;">
															<option>사내 공지</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<div class="col-sm-12 text-primary">
														<div class="input-group-append col-xs-12">
															<div class="form-group bg-white">
																<input form="boardForm" type="file" id="fileUploader" class="file-upload-default" name="files" multiple>
																<div class="input-group col-xs-12">
																	<span class="input-group-append w-100">
																		<button class="file-upload-browse btn btn-primary w-100" style="border-radius: 0; width: inherit;" type="button">파일 첨부</button>
																	</span>
																</div>
															</div>
															<div id="fileList">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<textarea form="boardForm" class="form-control" id="write" name="boardContent"></textarea>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- End writeForm -->
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
				<%@ include file="/WEB-INF/views/common/_footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	</body>

</html>
