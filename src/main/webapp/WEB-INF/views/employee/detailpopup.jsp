<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<!-- inject css, js common file -->
		<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<!-- endinject css, js common file -->
	
	<!-- Plugin css,js for this page -->
	<style>
		.container-fluid{
			padding:0px;
			margin:0px;
		}
		.main-panel-popup {
		  transition: width 0.25s ease, margin 0.25s ease;
		  width: 100%;
		  min-height: 100vh;
		  display: -webkit-flex;
		  display: flex;
		  -webkit-flex-direction: column;
		  flex-direction: column;
		}
	</style>
	<!-- End plugin css,js for this page -->
	</head>

	<body>
		<div class="main-panel-popup">
			<div class="content-wrapper">
					<!-- Start information -->
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body row m-0">
									<!-- image card -->
									<div class="col-5 d-flex justify-content-center" >
										<img src="${pageContext.request.contextPath}/resources/images/faces/face10.jpg" style="width:180px; height:270px;border-radius:20px;"/>
									</div> <!-- End image card -->
									<!-- start information -->
									<div class="col-7">
										<form class="form-sample">
											<!-- name -->
											<div class="row">
												<div class="col-12">
													<div class="form-group row align-items-center">
														<div class="col-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<span class="ml-2 font-weight-bold">이름</span>
															</div>
														</div>
														<div class="col-8 align-items-start">
															<div>장영은 23022201</div>
														</div>
													</div>
												</div>
											</div>
											<!-- 사번 -->
											<div class="row">
												<div class="col-12">
													<div class="form-group row align-items-center">
														<div class="col-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<span class="ml-2 font-weight-bold">메일</span>
															</div>
														</div>
														<div class="col-8 align-items-start">
															<div>qweqwe</div>
														</div>
													</div>
												</div>
											</div>
											<!-- 부서 -->
											<div class="row">
												<div class="col-12">
													<div class="form-group row align-items-center">
														<div class="col-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<span class="ml-2 font-weight-bold">부서</span>
															</div>
														</div>
														<div class="col-8 align-items-start">
															<div>경영지원부</div>
														</div>
													</div>
												</div>
											</div>
											<!-- 사내 전화번호 -->
											<div class="row">
												<div class="col-12">
													<div class="form-group row align-items-center">
														<div class="col-4 text-primary">
															<div class="d-flex m-1">
																<span class="ml-2 font-weight-bold"">사내 TEL</span>
															</div>
														</div>
														<div class="col-8 align-items-start">
															<div>02-000-0000</div>
														</div>
													</div>
												</div>
											</div>
											<!-- 개인전화번호 -->
											<div class="row">
												<div class="col-12">
													<div class="form-group row align-items-center">
														<div class="col-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<span class="ml-2 font-weight-bold">TEL</span>
															</div>
														</div>
														<div class="col-8 align-items-start">
															<div>010-0000-0000</div>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div><!-- End information box -->
								</div>
							</div>
						</div>
					</div>
				<div class="row mb-3 d-flex align-items-center">
					<div class="col"></div>
					<button class="col-3 btn btn-primary btn-sm mt-1" onclick="window.close()">확인</button>
					<div class="col"></div>
				</div>
			</div>
		</div>
		<!-- container-scroller -->
	</body>
	
</html>