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
		.wrap{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .box{
            text-align: center;
        }
	</style>
	<script>
	function result(){
		// 부모창에서 id가 parent_val인 요소(태그)의 값 가져오기
		var parent_val = opener.$("#employee").val(); 
		console.log("ppp");
		console.log(parent_val);
		// 자식창(팝업창)에서 id가 child_val인 요소(태그)의 값에 부모창에서 가져온 값 넣기
		$('#failCnt').val(parent_val);
		$('#failCnt').html(parent_val);
	}
	</script>
	<!-- End plugin css,js for this page -->
	</head>

	<!-- 로그인 실패시 뜨는 팝업창 -->
	<body onload="result()">
		<div class="main-panel-popup">
			<div class="content-wrapper">
				<!-- Start information -->
				<div class="row">
					<div class="col-12 stretch-card">
						<div class="card">
							<div class="card-body row m-0">
								<div class="container-fluid wrap">
									<div class="card-title box" >로그인 오류 "<span id="failCnt"></span>"회 입니다.</div>
									<div class="card-title box">오류 5회시 자동 잠금됩니다.</div>
									<div class="row box">
										<button class="btn btn-primary btn-md" onclick="window.close()">닫기</button>
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