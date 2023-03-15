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
		.wrap {
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		
		.box {
			text-align: center;
		}
</style>
	<!-- End plugin css,js for this page -->
	</head>
	<body>
		<div class="main-panel-popup">
			<div class="content-wrapper">
				<!-- Start information -->
				<div class="row">
					<div class="col-12 stretch-card">
						<div class="card">
							<div class="card-body row m-0">
								<div class="container-fluid wrap">
									<div class="card-title box">요청하신 파일의 크기가</div>
									<div class="card-title box">5MB보다 파일이 큽니다.</div>
									<div class="row box">
										<button class="btn btn-inverse-primary btn-md" onclick="window.close()">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<!-- container-scroller -->
	</body>
	
</html>

