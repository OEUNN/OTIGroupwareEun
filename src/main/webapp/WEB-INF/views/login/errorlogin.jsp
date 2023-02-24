<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
	<head>
		<!-- CSS/JS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		
		<style>
			.form-group input:focus {
				caret-color: #4B49AC;
			}
		</style>
		
		<script>
			function popup(){
	            var url = "errorloginpopup";
	            var name = "login retry";
	            var option = "width = 500, height =200, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
	            window.open(url, name, option);
	        }
        	
	        /* input박스를 클릭하였을 때, 아이콘 색상 변경 */
	        $(document).ready(function(){
		        const $icon1 = $(".mdi-account");
			   	$("#id-input input").focus(function() {
			      $icon1.removeClass("text-secondary").addClass("text-primary");
			    });
			   	$("#id-input input").blur(function() {
			        $icon1.addClass("text-secondary").removeClass("text-primary");

			    const $icon2 = $(".mdi-lock");
			   	$("#pw-input input").focus(function() {
			      $icon2.removeClass("text-secondary").addClass("text-primary");
			    });
	        	});
			   	$("#pw-input input").blur(function() {
			        $icon2.addClass("text-secondary").removeClass("text-primary");
	        	});
		    });
		</script>
	</head>
	<body>
		<div class="container-scroller">
			<div class="container-fluid page-body-wrapper full-page-wrapper">
				<div class="content-wrapper d-flex align-items-center auth px-0">
					<div class="row w-100 mx-0">
						<div class="col-lg-4 mx-auto">
							<div class="grid-margin stretch-card">
		           				<div class="card">
		           					<div class="card-body p-5">
										<!-- 로고 -->
										<div class="brand-logo d-flex justify-content-between align-items-end">
											<div>
												<img src="${pageContext.request.contextPath}/resources/images/oti-logo.png" alt="logo" style="width:110px; height:40px;"/>
			       								<img src="${pageContext.request.contextPath}/resources/images/exa.png" alt="logo" style="width:80px; height:40px;"/>
											</div>
											<h3 class="text-primary font-weight-bold mb-0">GROUPWARE</h3>
										</div>
										<!-- 로그인폼 -->
										<div >
											<div id="id-input" class="form-group mb-0">
												로그인에 실패 하셨습니다.</br>
												로그인 초기화 요청 후 다시 시도 하십쇼.
											</div>
											<div class="mt-5">
												<button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="popup()">
													<span class="ml-1 h4 font-weight-bold">로그인 재시도</span>
												</button>
											</div>
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
		
	</body>

</html>

