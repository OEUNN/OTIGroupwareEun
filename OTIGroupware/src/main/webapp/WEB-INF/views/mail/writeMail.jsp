<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		<script>
        function address(){
            var url = "addresspopup";
            var name = "employee address";
            var option = "width = 500, height = 700, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
            window.open(url, name, option);
        }
		</script>
		
	</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- To_do_List/Chat -->
			<%@ include file="/WEB-INF/views/common/_settings-panel.jsp"%>
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- Start write from -->
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">메일 쓰기</h4>
									<form class="forms-sample">
										<div class="container-fluid row">
											<!-- 버튼 container -->
											<div class="col-lg-9"></div>
											<button class="col-5 col-lg-1 btn btn-inverse-primary mr-2">임시
												저장</button>
											<button onclick="" class="btn btn-md btn-primary btn-icon-text d-flex align-items-center ">
												<i class="mdi mdi-send"></i> 
												<span class="ml-2 font-weight-bold">보내기</span>
											</button>
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="sendMail"> 발신인 </label> <input
												type="text" class="form-control col-5" id="sendMail"
												style="border: none; border-bottom: 1px solid #ced4da;">
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="recivedMail">수신인 </label> <input
												type="text" class="form-control col" id="recivedMail"
												style="border: none; border-bottom: 1px solid #ced4da;">
											<label class="col-2 pt-3" for="recivedMail">
												<button class="ml-2 btn btn-sm btn-inverse-primary"
													onclick="address()">주소록</button>
											</label>
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="title"> 제목 
												<i class="h3 mdi mdi-star text-primary "></i>
											</label> <input type="text" class="form-control col-9" id="title"
												style="border: none; border-bottom: 1px solid #ced4da;">
										</div>
										<div class="form-group">
											<label>File upload
												<button
													class="file-upload-browse btn btn-inverse-primary btn-sm ml-2"
													type="button">Upload</button>
											</label> <input type="file" name="img[]" class="file-upload-default">
											<div class="input-group col-xs-12">
												<input type="text" class="form-control file-upload-info"
													disabled style="height: 100px;">
											</div>
										</div>
										<div class="form-group">
											<label for="exampleTextarea1">Textarea</label>
											<textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- End writeForm -->
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
				<%@ include file="/WEB-INF/views/common/_footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>

</html>
