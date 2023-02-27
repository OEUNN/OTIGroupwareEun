<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
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
					<div class="row">
						<!-- 받은 메일 col -->
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<form class="card-body">
									<!-- main title and submit button -->
									<div class="d-flex justify-content-between align-items-center mb-4">
										<div class="card-title mb-0">메일 상세 조회</div>
										<div class="d-flex">
											<button class="btn btn-md btn-warning mx-2">
												<span class="mdi mdi-telegram align-middle"></span> 
												<span>답장</span>
											</button>
											<button class="btn btn-md btn-warning mx-2">
												<span class="mdi mdi-call-made align-middle"></span> 
												<span>전달</span>
											</button>
											<button class="btn btn-md btn-primary mx-2">
												<span class="mdi mdi-archive align-middle"></span> 
												<span>휴지통</span>
											</button>
										</div>
									</div><!-- end main title and submit button -->
									<!-- mail data -->
									<div class="forms-sample my-5">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-2 text-primary">
														<div class="d-flex align-items-center m-1">
															<span class=" font-weight-bold">제목</span>
														</div>
													</div>
													<div class="col-sm-9" style="border-bottom:1px solid #ced4da;">
														<div class="from-control" style="font-weight:bold; border:none;">장영은</div>
													</div>
												</div>
											</div>
										</div>
										<!-- send mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-2 text-primary">
														<div class="d-flex align-items-center m-1">
															<span class=" font-weight-bold">발신인</span>
															<i class="h3 my-auto mdi mdi-arrow-right"></i> 
														</div>
													</div>
													<div class="col-sm-5" style="border-bottom:1px solid #ced4da;">
														<div class="from-control" style="font-weight:bold; border:none;">장영은</div>
													</div>
												</div>
											</div>
										</div>
										<!-- receive mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-2 text-primary">
														<div class="d-flex align-items-center m-1">
															<span class="font-weight-bold">수신인</span>
															<i class="h3 my-auto mdi mdi-arrow-left"></i> 
														</div>
													</div>
													<div class="col-sm-6" style="border-bottom:1px solid #ced4da;">
														<div class="from-control" style="font-weight:bold; border:none;">신문영</div>
													</div>
												</div>
											</div>
										</div>
										<!-- title -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-2 text-primary">
														<div class="d-flex align-items-center m-1">
															<i class="h3 my-auto mdi mdi-calendar "></i> 
															<span class="font-weight-bold">날짜</span>
														</div>
													</div>
													<div class="col-sm-9" style="border-bottom:1px solid #ced4da;">
														<div class="from-control" style="font-weight:bold; border:none;">2023년 2월24일</div>
													</div>
												</div>
											</div>
										</div>
										<!-- file upload -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<div class="col-sm-3 text-primary">
														<div class="row d-flex align-items-center m-1">
															<i class="h3 my-auto mdi mdi-cloud-download"></i> 
															<span class="ml-2 font-weight-bold">파일 다운로드</span>
														</div>
													</div>
													<div class="col-sm-8 p-0"> 
														<div class="form-control" style="font-weight:bold; height:120px;"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<textarea class="form-control" readonly>
													</textarea>
												</div>
											</div>
										</div>
									</div>
								</form>
								
								
							</div>
						</div><!-- end 받은 메일 -->
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>

</html>
