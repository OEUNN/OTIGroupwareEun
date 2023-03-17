<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymce.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/write-template.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
		<style>
		.empBtn{
			border-radius: 10px;
			background-color: #4b49ac;
			color:white;
			padding-right :10px;
			padding-left:10px;
			padding-top:2px;
			padding-bottom:2px;
			display: inline-block;
  			width: max-content
		}
		</style>
		<script>
		//tiny
		$(document).ready(function(){
			tinymce.init({
				language: 'ko_KR',
				selector: '#read_write',
				width: '100%',
				height: '200mm',
				theme: 'silver',
				toolbar1: 'fullscreen print',
				content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
				plugins: [
					'noneditable'
				],
				menubar : '',
				readonly: 1
			});
		});
		</script>
	</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<!-- 받은 메일 col -->
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<form class="card-body">
									<!-- main title and submit button -->
									<div class="d-flex justify-content-between align-items-center mb-4">
										<div class="card-title mb-0">${sendMail.sendMailTitle}</div>
										<div class="d-flex">
											<button class="btn btn-md btn-warning mx-2">
												<span class="mdi mdi-telegram align-middle"></span> 
												<span>답장</span>
											</button>
<!-- 											<button class="btn btn-md btn-warning mx-2"> -->
<!-- 												<span class="mdi mdi-call-made align-middle"></span>  -->
<!-- 												<span>전달</span> -->
<!-- 											</button> -->
											<button class="btn btn-md btn-primary mx-2">
												<span class="mdi mdi-archive align-middle"></span> 
												<span>휴지통</span>
											</button>
										</div>
									</div><!-- end main title and submit button -->
									<!-- mail data -->
									<div class="forms-sample my-5">
										<!-- send mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex justify-content-end m-1">
															
															<span class=" font-weight-bold">발신인</span>
														</div>
													</div>
													<div class="col-sm-5 form-inline">
														<i class="h3 my-auto mdi mdi-arrow-right-bold text-success"></i> 
														<div class="from-control" style="border:none;">
														<div class="empBtn mr-2">
															<span>(${sendMail.depName}) ${sendMail.empName} ${sendMail.posName }</span>
														</div>
														
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- receive mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex justify-content-end m-1">
															<span class="font-weight-bold">수신인</span>
														</div>
													</div>
													<div class="col-sm">
														<i class="h3 my-auto mdi mdi-arrow-left-bold text-danger"></i> 
														<c:if test="${!empty sendMail.empList }">
															<c:forEach items="${sendMail.empList}" var="emp">
																<div class="empBtn mr-2">
																	<span style="width:auto;">(${emp.depName}) ${emp.empName}${emp.posName}</span>
																</div>
															</c:forEach>
														</c:if>
													</div>
												</div>
											</div>
										</div>
										<!-- title -->
										<div class="row">
											<div class="col-md-12">
												<div class="py-2 px-5">
													<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${sendMail.sendMailDate}"/>
												</div>
											</div>
										</div>
										<!-- file upload -->
										<div class="row">
											<div class="px-5 pt-2 pb-1 text-primary">
												<div class="row d-flex align-items-center m-1">
													<i class="h3 my-auto mdi mdi-cloud-download"></i> 
													<span class="ml-2 font-weight-bold">파일 다운로드</span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6 px-5 pb-3"> 
												<div class="form-control" style="font-weight:bold; height:120px;">
													<c:if test="${!empty mailFile}">
														<c:forEach items="${mailFile}" var="mfile">
															<button class="row" onclick="location.href='<c:url value="/mail/filedownload/${mfile.mailFileId}"/>'">
																<i class="h2 mdi mdi-file-check text-primary"></i>
																<span class="my-auto" style="font-size: 15px;">${mfile.mailFileName}</span>
															</button>
														</c:forEach>
													</c:if>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row px-5 py-2">
													<textarea id="read_write" name="write">
														${sendMail.sendMailContent}
													</textarea>
												</div>
											</div>
										</div>
									</div>
								</form>
								
								
							</div>
						</div><!-- end 받은 메일 -->
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>

</html>
