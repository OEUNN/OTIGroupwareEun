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
			.container-fluid {
				padding: 0px;
				margin: 0px;
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
		<script type="text/javascript">
			var parent = opener.document.getElementById("pw").value;
			console.log(parent);
			$('#password').val(parent);
		</script>
		<!-- End plugin css,js for this page -->
	</head>
<!-- 로그인 실패시 뜨는 팝업창 -->
<body>
	<div class="main-panel-popup">
		<div class="content-wrapper">
			<!-- Start information -->
			<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body row m-0">
							<form class="container-fluid" method="post">
								<div class="card-title row mx-1 my-3">비밀번호</div>
								<div class="row form-group bg-white mx-2 my-3 d-flex justify-content-center">
									<div class="input-group col-xs-12" id="password" style="text-align: center;"></div>
								</div>
								<div class="row d-flex justify-content-center">
									<button class="row btn btn-primary btn-md " onclick="window.close()">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- container-scroller -->
</body>

</html>