<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		
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
									<h4 class="card-title">제목</h4>
									<form class="forms-sample">
										<div class="container-fluid row">
											<!-- 버튼 container -->
											<div class="col-lg-8"></div>
											<button class="col-3 col-lg-1 btn btn-warning mr-2 my-2">답장</button>
											<button class="col-3 col-lg-1 btn btn-warning mr-2 my-2">전달</button>
											<button type="submit"
												class="col-3 col-lg-1 btn btn-success mr-2 my-2">휴지통</button>
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="sendMail"> 발신인 </label> <input
												type="text" class="form-control col-5" id="sendMail"
												readonly
												style="border: none; border-bottom: 1px solid #ced4da;">
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="recivedMail">수신인 </label> <input
												type="text" class="form-control col" id="recivedMail"
												readonly
												style="border: none; border-bottom: 1px solid #ced4da;">
											<label class="col-2 pt-3" for="recivedMail"> </label>
										</div>
										<div class="form-group row">
											<label class="col-1 pt-3" for="title"> 날짜 </label> <input
												type="text" class="form-control col-9" id="title" readonly
												style="border: none; border-bottom: 1px solid #ced4da;">
										</div>
										<div class="form-group">
											<label>File upload </label> <input type="file" name="img[]"
												class="file-upload-default">
											<div class="input-group col-xs-12">
												<input type="text" class="form-control file-upload-info"
													disabled style="height: 100px;">
											</div>
										</div>
										<div class="form-group">
											<label for="exampleTextarea1">Textarea</label>
											<textarea class="form-control" id="exampleTextarea1" readonly
												rows="4"></textarea>
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
