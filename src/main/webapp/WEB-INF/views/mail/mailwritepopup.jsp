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
        	opener.location.href = "javascript:fromStart();";
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
			.wrap{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .box{
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
									<div class="card-title box">메일을 보내시겠습니까?</div>
									<div class="row box">
										<button class="btn btn-primary btn-md mx-2" onclick="result()">확인</button>
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

