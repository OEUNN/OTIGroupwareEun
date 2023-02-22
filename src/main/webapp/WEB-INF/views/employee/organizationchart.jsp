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
<!-- End plugin css,js for this page -->
	<style>
		.btn-color{
			padding:0px;
			border:none;
			background-color:transparent;
		}
		.btn-color:hover{
			padding:0px;
			border:none;
			background-color:transparent;
			color:#ced4da;
			text-decoration: none;
		}
	</style>
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
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="row  d-flex justify-content-between align-items-start">
								<h3 class="font-weight-bold">조직도</h3>
							</div>
						</div>
					</div>
					<!-- top human -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-3 grid-margin stretch-card ">
							<div class="card">
								<div class="card-body">
									<div class="text-primary d-flex justify-content-center">
										<div class="d-flex align-items-center m-1">
											<i class="h3 my-auto mdi mdi-account"></i> 
											<span class="ml-2 font-weight-bold">이름</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!-- End detail information -->
					<!-- Start detail information -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-3 grid-margin stretch-card ">
							<div class="card">
								<div class="card-body">
									<div class="text-primary d-flex justify-content-center">
										<div class="d-flex align-items-center m-1">
											<i class="h3 my-auto mdi mdi-account"></i> 
											<span class="ml-2 font-weight-bold">이름</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!-- end top human -->
					<!-- 1팀 -->
					<div class="form-inlie d-flex align-items-start">
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV1">
										<div class="d-flex align-items-center m-1">
											<i class="h3 my-auto mdi mdi-account-multiple"></i> 
											<span class="ml-2 font-weight-bold">공공사업1DIV</span>
										</div>
									</div>
									<div id="DIV1" class="row m-1 collapse text-primary ">
										<div class=" flex-column">
											<a class="row my-1 ml-3 text-primary btn-color">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">김부련 부장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">오상식 차장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">장그래 사원</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 2팀 -->
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV2">
										<div class="d-flex align-items-center m-1">
											<i class="h3 my-auto mdi mdi-account-multiple"></i> 
											<span class="ml-2 font-weight-bold">공공사업2DIV</span>
										</div>
									</div>
									<div id="DIV2" class="row m-1 collapse text-primary ">
										<div class="flex-column">
											<a class="row my-1 ml-3 text-primary btn-color">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">김부련 부장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">오상식 차장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">장그래 사원</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 3팀 -->
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse"  data-target="#DIV3">
										<div class="d-flex align-items-center m-1">
											<i class="h3 my-auto mdi mdi-account-multiple"></i> 
											<span class="ml-2 font-weight-bold">공공사업3DIV</span>
										</div>
									</div>
									<div id="DIV3" class="row m-1 collapse text-primary ">
										<div class="flex-column">
											<a class="row my-1 ml-3 text-primary btn-color">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">김부련 부장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">오상식 차장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">장그래 사원</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 4팀 -->
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV4">
										<div class="d-flex align-items-center m-1">
											<i class="h3 my-auto mdi mdi-account-multiple"></i> 
											<span class="ml-2 font-weight-bold">경영지원</span>
										</div>
									</div>
									<div id="DIV4" class="row m-1 collapse text-primary ">
										<div class="flex-column">
											<a class="row my-1 ml-3 text-primary btn-color">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">김부련 부장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">오상식 차장</span>
											</a>
											<a class="row my-1 ml-3 text-primary btn-color"">
												<i class="h3 my-auto  mdi mdi-account-check"></i> 
												<span class="ml-2 font-weight-bold">장그래 사원</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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