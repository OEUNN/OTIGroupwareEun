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
		<style type="text/css">
		.collapse, .collapsing {
			box-shadow: 0px 0px 0px white !important;
		}
		</style>
		<script>
        function address(){
            var url = "addresspopup";
            var name = "employee address";
            var option = "width = 500, height = 700, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
            window.open(url, name, option);
        }
		</script>
		
	</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- To_do_List/Chat -->
			<%@ include file="/WEB-INF/views/common/_settings-panel.jsp"%>
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- Start write from -->
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<form class="card-body">
									<!-- main title and submit button -->
									<p class="card-title d-flex justify-content-between align-items-start">
										<span>메일 쓰기</span> 
										<span>
											<button class="btn btn-md btn-primary mx-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
												<span class="mdi mdi-calendar-clock align-middle"></span> 
												<span>임시저장</span>
											</button>
											<button class="btn btn-md btn-primary mx-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
												<span class="mdi mdi-telegram align-middle"></span> 
												<span>보내기</span>
											</button>
										</span>
									</p><!-- end main title and submit button -->
									<!-- mail data -->
									<div class="forms-sample">
										<!-- send mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex align-items-center m-1">
															<span class=" font-weight-bold">발신인</span>
															<i class="h3 my-auto mdi mdi-arrow-right"></i> 
														</div>
													</div>
													<div class="col-sm-5" style="border-bottom:1px solid #ced4da;">
														<input class="h3 from-control" style="font-weight:bold; border:none;">
													</div>
												</div>
											</div>
										</div>
										<!-- receive mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex align-items-center m-1">
															<i class="h3 my-auto mdi mdi-arrow-left"></i> 
															<span class="font-weight-bold">수신인</span>
														</div>
													</div>
													<div class="col-sm-6" style="border-bottom:1px solid #ced4da;">
														<input class="h3 from-control" style="font-weight:bold; border:none;">
													</div>
													<div class="col-sm-2" >
														<button class="btn btn-md btn-inverse-primary mx-2" onclick="address()"  style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
															<span class="mdi mdi-account-plus align-middle"></span> 
															<span>주소록</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										<!-- title -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex align-items-center m-1">
															<span class="font-weight-bold">제목</span>
															
														</div>
													</div>
													<div class="col-sm-9" style="border-bottom:1px solid #ced4da;">
														<i class="h3 mdi mdi-star text-primary"></i>
														<input class="h3 from-control" style="font-weight:bold; border:none;">
													</div>
												</div>
											</div>
										</div>
										<!-- file upload -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<div class="col-sm-2 text-primary">
														<div class="row d-flex align-items-center m-1">
															<i class="h3 my-auto mdi mdi-cloud-upload"></i> 
															<span class="ml-2 font-weight-bold">파일 업로드</span>
														</div>
														<div class="row mt-3 ml-1" >
															<button class="btn btn-md btn-inverse-primary mx-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
																<span>업로드</span>
															</button>
														</div>
													</div>
													<div class="col-sm-8 p-0"> 
														<input class="h3 form-control" style="font-weight:bold; height:120px;">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<textarea class="form-control" id="write"></textarea>
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
