<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
	</head>

	<body>
		<div class="container-scroller">
			<div class="container-fluid page-body-wrapper full-page-wrapper">
				<div class="content-wrapper d-flex align-items-center auth px-0">
					<div class="row w-100 mx-0">
						<div class="col-lg-4 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5">
								<div class="brand-logo">
									<img src="${pageContext.request.contextPath}/resources/images/oti.png" alt="logo" style="width: 80px; height: 60px;" />
								</div>
								<h4>Hello! let's get started</h4>
								<h6 class="font-weight-light">Sign in to continue.</h6>
								<form class="pt-3" action="<c:url value='/home'/>" >
									<div class="form-group">
										<input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
									</div>
									<div class="mt-3">
										<a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="<c:url value='/home'/>">
											SIGN IN
										</a>
									</div>
									<div
										class="my-2 d-flex justify-content-between align-items-center">
										<div class="form-check">
											<label class="form-check-label text-muted">
											</label>
										</div>
										<a href="<c:url value='/errorLogin'/>" class="auth-link text-black">Forgot password?</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
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
	</body>

</html>
