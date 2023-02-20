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
		<!-- partial:../../partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="index.html">
					<img src="${pageContext.request.contextPath}/resources/images/oti.png" alt="logo" style="width: 80px; height: 60px;" />
						<span class="h3 font-weight-bold mt-3">오티아이</span>
				</a>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
					<span class="icon-menu"></span>
				</button>
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor" id="navbar-search-icon">
								<span class="input-group-text" id="search"> 
									<i class="icon-search"></i>
								</span>
							</div>
							<input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item dropdown">
						<a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown"> 
							<i class="icon-bell mx-0"></i> 
							<span class="count"></span>
						</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-success">
										<i class="ti-info-alt mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">
										Application Error
									</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Just now
									</p>
								</div>
							</a> 
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-warning">
										<i class="ti-settings mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">Settings</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Private message
									</p>
								</div>
							</a> 
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-info">
										<i class="ti-user mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">
										New user registration
									</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										2 days ago
									</p>
								</div>
							</a>
						</div>
					</li>
					<li class="nav-item nav-profile dropdown">
						<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown"> 
							<img src="../../images/faces/face28.jpg" alt="profile" />
						</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item"> 
								<i class="ti-settings text-primary"></i>
								Settings
							</a> 
							<a class="dropdown-item"> 
								<i class="ti-power-off text-primary"></i> Logout
							</a>
						</div>
					</li>
				</ul>
				<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
					<span class="icon-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- 사이드바 -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item">
						<a class="nav-link" href="../../index.html"> 
						<i class="icon-grid menu-icon"></i> 
						<span class="menu-title">Dashboard</span>
						</a>
					</li>
					<li class="nav-item">
					<a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic"> 
						<i class="icon-layout menu-icon"></i>
						<span class="menu-title">UI Elements</span> 
						<i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../pages/ui-features/buttons.html">Buttons</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../../pages/ui-features/dropdowns.html">Dropdowns</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../../pages/ui-features/typography.html">Typography</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#form-elements" aria-expanded="false"
						aria-controls="form-elements"> <i
							class="icon-columns menu-icon"></i> <span class="menu-title">Form
								elements</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="form-elements">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../pages/forms/basic_elements.html">Basic Elements</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#charts" aria-expanded="false"
						aria-controls="charts"> <i class="icon-bar-graph menu-icon"></i>
							<span class="menu-title">Charts</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="charts">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../pages/charts/chartjs.html">ChartJs</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#tables" aria-expanded="false"
						aria-controls="tables"> <i class="icon-grid-2 menu-icon"></i>
							<span class="menu-title">Tables</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="tables">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../pages/tables/basic-table.html">Basic table</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#icons" aria-expanded="false"
						aria-controls="icons"> <i class="icon-contract menu-icon"></i>
							<span class="menu-title">Icons</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="icons">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../pages/icons/mdi.html">Mdi icons</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#auth" aria-expanded="false"
						aria-controls="auth"> <i class="icon-head menu-icon"></i> <span
							class="menu-title">User Pages</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="auth">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../pages/samples/login.html"> Login </a></li>
								<li class="nav-item"><a class="nav-link"
									href="../../pages/samples/register.html"> Register </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#error" aria-expanded="false"
						aria-controls="error"> <i class="icon-ban menu-icon"></i> <span
							class="menu-title">Error pages</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="error">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../../pages/samples/error-404.html"> 404 </a></li>
								<li class="nav-item"><a class="nav-link"
									href="../../pages/samples/error-500.html"> 500 </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="../../pages/documentation/documentation.html"> <i
							class="icon-paper menu-icon"></i> <span class="menu-title">Documentation</span>
					</a></li>
				</ul>
			</nav><!-- 사이드바 끝 -->
			
			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- Start write from -->
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">제목</h4>
									<form class="forms-sample">
										<div class="container-fluid row"><!-- 버튼 container -->
											<div class="col-lg-8"></div>
											<button class="col-3 col-lg-1 btn btn-warning mr-2 my-2">답장</button>
											<button class="col-3 col-lg-1 btn btn-warning mr-2 my-2">전달</button>
											<button type="submit" class="col-3 col-lg-1 btn btn-success mr-2 my-2">휴지통</button>
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="sendMail">
												발신인
											</label> 
											<input type="text" class="form-control col-5" id="sendMail" readonly style="border:none;border-bottom:1px solid #ced4da;">
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="recivedMail">수신인
											</label>
											<input type="text" class="form-control col" id="recivedMail" readonly style="border:none;border-bottom:1px solid #ced4da;">
											<label class="col-2 pt-3" for="recivedMail">
											</label>
										</div>
										<div class="form-group row" >
											<label class="col-1 pt-3" for="title"> 날짜
											</label>
											<input type="text" class="form-control col-9" id="title" readonly style="border:none;border-bottom:1px solid #ced4da;">
										</div>
										<div class="form-group" >
											<label>File upload
											</label> 
											<input type="file" name="img[]" class="file-upload-default">
											<div class="input-group col-xs-12">
												<input type="text" class="form-control file-upload-info" disabled style="height:100px;"> 
											</div>
										</div>
										<div class="form-group" >
											<label for="exampleTextarea1">Textarea</label>
											<textarea class="form-control" id="exampleTextarea1" readonly rows="4"></textarea>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div><!-- End writeForm -->
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
							Â© 2021. Premium <a href="https://www.bootstrapdash.com/"
							target="_blank">Bootstrap admin template</a> from BootstrapDash.
							All rights reserved.
						</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
							& made with <i class="ti-heart text-danger ml-1"></i>
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="../../vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="../../js/off-canvas.js"></script>
	<script src="../../js/hoverable-collapse.js"></script>
	<script src="../../js/template.js"></script>
	<script src="../../js/settings.js"></script>
	<script src="../../js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<!-- End custom js for this page-->
</body>

</html>
