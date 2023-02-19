<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<script>
        function popup(){
            var url = "loginReTry";
            var name = "login retry";
            var option = "width = 500, height =200, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
            window.open(url, name, option);
        }
		</script>
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
								<div class="pt-3" >
									<div class="form-group">
										로그인에 실패 하셨습니다.</br>
										로그인 초기화 요청 후 다시 시도 하십쇼.
									</div>
									<div class="mt-3">
										<button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="popup()">
											RETRY SIGN IN
										</button>
									</div>
									<div
										class="my-2 d-flex justify-content-between align-items-center">
										<div class="form-check">
											<label class="form-check-label text-muted">
											</label>
										</div>
									</div>
								</div>
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
