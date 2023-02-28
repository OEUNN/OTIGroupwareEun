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
									<div class="container-fluid">
										<div class="card-title mt-1 row d-flex justify-content-center">경영지원부만이 접근 가능한 페이지입니다.</div>
										<div class="card-title mt-1 row d-flex justify-content-center">다른페이지 이용 부탁드립니다.</div>
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
