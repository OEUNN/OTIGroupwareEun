<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- CSS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css" />
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/write-template.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
	<style type="text/css">
	.collapse, .collapsing {
		box-shadow: 0px 0px 0px white !important;
	}
	
	.filebox {
		display: inline-block;
		margin-right: 10px;
	}
	
	.filebox label {
		display: inline-block;
		line-height: normal;
		vertical-align: middle;
		cursor: pointer;
	}
	
	.filebox input[type="file"] { /* 파일 필드 숨기기 */
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	.empBtn{
		border-radius:10px;
		border : none;
		color : white;
		background-color: #4B49AC;
		font-size:small;
		height:25px;
	}
</style>
	<script>
	function address() {
		var url = "addresspopup";
		var name = "employee address";
		var option = "width = 500, height = 780, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
		window.open(url, name, option);
	}
	
	function check(No) {
		var result = true;
		//empId
		let empId = ${sessionScope.employee.empId};
		$('#empId').val(empId);
		
		//id
		var id = document.getElementById("receivedId");
		if ($('#receive').val() == '') {
			id.setAttribute("style", "border-bottom:1px solid red;");
			result = false;
		} else {
			id.setAttribute("style", "border-bottom: 1px solid #ced4da;");
		}
		
		//sendMailTitle
		var title = document.getElementById("title");
		if ($('#sendMailTitle').val() == '') {
			title.setAttribute("style", "border-bottom:1px solid red;");
			result = false;
		} else {
			title.setAttribute("style", "border-bottom: 1px solid #ced4da;");
		}
		
		if(result){
			if(No == 1){
				var url = "mailwritepopup";
				var name = "write popup";
				var option = "width = 500, height = 200, top = 300, left = 500, location = no, resizable=no, scrollbars=no "
				window.open(url, name, option);
			}
		}
		if($('#resultString').val()==''){
			$('#resultString').val('temp');
		}
		return result;
	}
	$("input[name=fileList]").off().on("change", function(){
		if (this.files && this.files[0]) {
			var maxSize = 5 * 1024 * 1024;
			var fileSize = this.files[0].size;
			if(fileSize > maxSize){
				var url = "mailfilepopup";
				var name = "mailfile popup";
				var option = "width = 500, height = 200, top = 300, left = 500, location = no, resizable=no, scrollbars=no "
				window.open(url, name, option);
				$(this).val('');
				return false;
			}
		}
	});
	$(document).ready(function(){
		$(window).on("message", (event) => {
			//팝업창에서 전송한 데이터 얻기(팝업창에서 postMessage() 사용해야 함)
			let receivedData = event.originalEvent.data;
			$("#receivedId").append('<input type="hidden" id="receive" name="receive" value="' + receivedData.empId + '">');
			$("#receivedId").append('<input type="hidden" id="receiveMail" name="receiveMail" value="' + receivedData.empMail + '">');
			$("#receivedId").append('<input type="hidden" id="receiveName" name="receiveName" value="' + receivedData.empName + '">');
			$("#receivedId").append('<input type="hidden" id="receiveDepName" name="receiveDepName" value="' + receivedData.depName + '">');
			$("#receivedId").append('<input type="hidden" id="receivePosName" name="receivePosName" value="' + receivedData.posName + '">');
			
			$("#receivedId").val(receivedData.empId);
			$("#receivedId").append(receivedData.content);
			//form 양식에 추가하기
			});
		});
	
	function remove(){
		$("#receivedId").empty();
	}
	function fromStart(){
		$('#resultString').val('pop');
	    $("#empWrite").submit();
	}

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
					<!-- Start write from -->
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<form action="<c:url value='/mail/sendmail'/>" method="post" id="empWrite" onsubmit="return check()"class="card-body" enctype="multipart/form-data">
									<!-- main title and submit button -->
									<div class="d-flex justify-content-between align-items-center mb-4">
										<div class="card-title mb-0">메일 쓰기</div>
										<div class="d-flex">
											<input type="hidden" id="resultString" name="resultString"/>
											<button type="submit" form="empWrite" id="popup-btn" class="btn btn-md btn-warning mx-2">
												<span class="mdi mdi-calendar-clock align-middle"></span> 
												<span>임시저장</span>
											</button>
											<button type="button" onclick="check(1)" id="popup-btn" class="btn btn-md btn-primary mx-2">
												<span class="mdi mdi-telegram align-middle"></span> 
												<span>보내기</span>
											</button>
										</div>
									</div>
									<!-- end main title and submit button -->

									<!-- mail data -->
									<div class="forms-sample">
										<!-- send mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex align-items-center m-1">
															<span class=" font-weight-bold">발신인</span> 
															<i class="h3 my-auto mdi mdi-arrow-right"></i>
														</div>
													</div>
													<div class="col-sm-5" style="border-bottom: 1px solid #ced4da;">
														<div class="from-control" id="ID"> ${sessionScope.employee.empName}</div>
														<input type="hidden" id="empId" name="empId"/>
													</div>
												</div>
											</div>
										</div>
										<!-- receive mail -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex align-items-center m-1">
															<i class="h3 my-auto mdi mdi-arrow-left"></i> 
															<span class="font-weight-bold">수신인</span>
														</div>
													</div>
													<div class="col" style="border-bottom: 1px solid #ced4da;">
														<div id="receivedId" class="from-control from-inline" style="border: none; width: 100%;">
															<c:if test="${!empty sendMail.empList }">
															<c:forEach items="${sendMail.empList}" var="emp">
																<button class="empBtn mr-2">
																	<span>${emp.empName}(${emp.mailId}) </span>
																</button>
															</c:forEach>
														</c:if>
														</div>
													</div>
													<div class="col-sm-2">
														<button type="button" class="btn btn-md btn-inverse-primary mx-2" onclick="address()" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
															<span class="mdi mdi-account-plus align-middle"></span> 
															<span>주소록</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										<!-- title -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row align-items-center">
													<div class="col-sm-1 text-primary">
														<div class="d-flex align-items-center m-1">
															<span class="font-weight-bold">제목</span>
														</div>
													</div>
													<div class="col-sm-9" id="title" style="border-bottom: 1px solid #ced4da;">
														<c:if test="${!empty sendMail}">
															<input type="text" id="sendMailTitle" name="sendMailTitle" class="from-control" style="border: none;width:100%;" value="${sendMail.sendMailTitle}">
														</c:if>
														<c:if test="${empty sendMail}">
															<input type="text" id="sendMailTitle" name="sendMailTitle" class="from-control" style="border: none;width:100%;">
														</c:if>
													</div>
												</div>
											</div>
										</div>
										<!-- file upload -->
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row bg-white">
													<div class="col-sm-2 text-primary ">
														<div class="input-group-append col-xs-12">
															<button class="row d-flex align-items-center m-1 file-browse text-primary">
																<i class="h3 my-auto mdi mdi-cloud-upload"></i> 
																<span class="ml-2 font-weight-bold ">파일 업로드</span>
															</button>
														</div>
														<div class="filebox">
															<label for="fileList" class="btn-inverse-primary btn btn-sm" style="font-style: bold;">업로드</label> 
															<input type="file" class="file-upload" id="fileList" name="fileList" multiple>
														</div>
													</div>
													<div class="col-sm-8 p-0">
														<input type="text" id="fileInfo" class="form-control file-upload-info" disabled placeholder="Upload Image">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<c:if test="${!empty sendMail}">
														<textarea id="write" name="write">${sendMail.sendMailContent }</textarea>
													</c:if>
													<c:if test="${empty sendMail}">
														<textarea id="write" name="write"></textarea>
													</c:if>
													
												</div>
											</div>
										</div>
									</div>
								</form>
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
