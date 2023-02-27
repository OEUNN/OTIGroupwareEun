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
	<script>
        function result(){
        	window.opener.top.location.href="<c:url value='/board'/>";
            window.close();
        }
	</script>
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
								<div class="container-fluid">
									<div class="card-title mt-1 row d-flex justify-content-center">해당 게시글을</div>
									 <div class="card-title mt-1 row d-flex justify-content-center">삭제 하시겠습니까?</div>
									<div class="row mb-1" >
										<div class="col"></div>
										<button class="col-3 btn btn-primary btn-md mt-1 mx-3" onclick="retry()">확인</button>
										<button class="col-3 btn btn-outline-primary btn-md mt-1 mx-3" onclick="window.close()">취소</button>
										<div class="col"></div>
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

