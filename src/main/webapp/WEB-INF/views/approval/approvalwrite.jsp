<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<script src="<c:url value="/resources/vendors/tinymce/tinymce.min.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/tinymce/tinymceinit.js"></c:url>"></script>
	<script src="<c:url value="/resources/vendors/tinymce/themes/silver/theme.min.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/file-upload.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/custom/dropdown.js"></c:url>"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
	function getContextPath() {
	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	}
	

	$(() => {
		const fileInput = $("#fileUploader");
		const MAX_FILE_SIZE = 1024 * 1024 * 50; // 50MB in bytes

		let lastUploadedFiles = []; //가장 마지막으로 올린 파일

		fileInput.on("change", (event) => {
		
			//input태그의 파일목록
			const files = event.target.files;
			let discardFiles = [];
			
			for (let i = 0; i < files.length; i++) {
				const file = files[i];
				const fileSize = file.size;
				
				//파일 크기가 제한보다 크면 제거하고 아니면 유지
				if (fileSize > MAX_FILE_SIZE) {
					alert("파일 사이즈는 50MB 보다 작아야 합니다.");
					discardFiles.push(file);
				} else {
					lastUploadedFiles.push(file);
				  
					const listItem = $('<div class="d-flex justify-content-between font-weight-bold text-primary my-3"></div>');
					const deleteButton = $('<i class="mdi mdi-minus"></i>').on("click", () => {
						const index = lastUploadedFiles.indexOf(file);
						if (index > -1) {
							//원본배열을 제거하고 잘려진 배열을 반환 (index 위치에서 1개 제거)
							lastUploadedFiles.splice(index, 1);
						}
						listItem.remove();
					});
					
					listItem.append(document.createTextNode(file.name));
					listItem.append(deleteButton);
					$("#fileList").append(listItem);
				}
			}
			
			if (discardFiles.length > 0) {
				//discarfiles에 들어있는 file과 겹치는 file을 필터링
				const remainingFiles = Array.from(fileInput.files).filter((file) => !discardFiles.includes(file));
				fileInput.files = new DataTransfer().files.add(...remainingFiles);
			}
			
		});
	});

	
	function popup(){
	    let url = getContextPath() + "/approval/organization";
	    let name = "organization";
	    let option = "width=500, height=700, top=500px, left=500px, menubars=no, status=no, titlebars=no"
	    window.open(url, name, option);
	}
	
	function isTitleExist(docTempYn) {
		if ($("iframe").contents().find("body").find("#A4") === null) {
			Swal.fire({
				title: "내용이 없습니다.",
				width: 400
			});
		}
		else if ($("iframe").contents().find("body").find(".documentTitle").text() === null || $("iframe").contents().find("body").find(".documentTitle").text() === '') {
			Swal.fire({
				title: "제목은 필수입니다.",
				width: 400
			});
		}
		else {
			$("#approvalForm").append('<input type="hidden" name="docTempYn" value="' + docTempYn + '"></input>');
			$("#approvalForm").submit();
		}
	}
	
	function callTempDocument() {
		if ($("#documentId").val() !== '' && $("#documentId").val() !== null) {
			$(".remove-flag").remove();
			let docId = $("#documentId").val();
			$.ajax({
				url: getContextPath() + '/approval/viewdetail/' + docId + '/documentdetail',
				success: function(data) {
					tinymce.get("document").setContent(data.docContent);
					initForm();
					editor.getBody().setAttribute('contenteditable',false);
				} 
			});
		}
	}
	
	$(() => {
		$(".mdi-close").each((index, element) => {
			var id = $(element).attr("id");
			var remover = '#' + id;
			var removee = '.' + id;
			
			$(remover).on('click', (event) => {
				$(removee).remove();
				//iframe은 일반적인 $()로 접근할 수 없다
				$("iframe").contents().find("body").find(positionId).text("공란");
				$("iframe").contents().find("body").find(nameId).text("공란");
			});
		});
	});

	$(() => {
		$(window).on("message", (event) => {
			//팝업창에서 전송한 데이터 얻기(팝업창에서 postMessage() 사용해야 함)
			let receivedData = event.originalEvent.data;
			let receivedIndex = receivedData.index;
			
			let positionList = $("iframe").contents().find(".positionText");
			let stateList = $("iframe").contents().find(".stateText");
			let nameList = $("iframe").contents().find(".nameText");
			let dateList = $("iframe").contents().find(".dateText");
			
			let remover = '#' + receivedData.removeClass;
			let removee = '.' + receivedData.removeClass;
			
			//맨처음으로 들어오는 메시지 이벤트가 이전에 있던 결재선과 폼 안에 존재하는 결재선을 초기화
			if (receivedIndex === 0) {
				$(".remove-flag").remove();
				positionList.each((index, item) => {
					if (index > 0) {
						$(item).text("공란");
					}
				});
				stateList.each((index, item) => {
					if (index > 0) {
						$(item).text("공란");
					}
				});
				nameList.each((index, item) => {
					if (index > 0) {
						$(item).text("공란");
					}
				});
				dateList.each((index, item) => {
					if (index > 0) {
						$(item).text("공란");
					}
				});
			}
			
			//하나 이상의 데이터가 왔을 경우 
			if (receivedData.lastIndex >= 0) {
				
				//결재선에 추가
				$("#approvalLine").append(receivedData.content);

				//문서 내부 결재선에 데이터 설정
				$(positionList[receivedIndex + 1]).text(receivedData.posName);
				$(stateList[receivedIndex + 1]).text("공란");
				$(nameList[receivedIndex + 1]).text(receivedData.empName);
				$(dateList[receivedIndex + 1]).text("공란");
				
				$(positionList[receivedIndex + 1]).addClass(receivedData.removeClass);
				$(stateList[receivedIndex + 1]).addClass(receivedData.removeClass);
				$(nameList[receivedIndex + 1]).addClass(receivedData.removeClass);
				$(dateList[receivedIndex + 1]).addClass(receivedData.removeClass);

				//form 양식에 추가하기
				$("#approvalForm").append('<input class="' + receivedData.removeClass + ' remove-flag" type="hidden" name="approvalId" value="' + receivedData.empId + '">');
				$("#approvalForm").append('<input class="' + receivedData.removeClass + ' remove-flag" type="hidden" name="approvalName" value="' + receivedData.empName + '">');
				$("#approvalForm").append('<input class="' + receivedData.removeClass + ' remove-flag" type="hidden" name="depName" value="' + receivedData.depName + '">');
				$("#approvalForm").append('<input class="' + receivedData.removeClass + ' remove-flag" type="hidden" name="posName" value="' + receivedData.posName + '">');
				$("#approvalForm").append('<input class="' + receivedData.removeClass + ' remove-flag" type="hidden" name="approvalOrder" value="' + receivedData.approvalOrder + '">');
				$("#approvalForm").append('<input class="' + receivedData.removeClass + ' remove-flag" type="hidden" name="approvalState" value="공란">');
				$("#approvalForm").append('<input class="' + receivedData.removeClass + ' remove-flag" type="hidden" name="approvalDate" value="공란">');

				//x 아이콘에 클릭 시 삭제 이벤트 등록하기
				$(remover).on('click', (event) => {
					$(removee).remove();
					
					//결재선에서 삭제
					$($("iframe").contents().find(removee).text("공란"));
					
					//결재선에서 삭제 후 앞으로 당기기
					for (i = 1; i < 5; i++) {
						if ($(positionList[i - 1]).text() === "공란") {
							$(positionList[i - 1]).text($(positionList[i]).text());
							$(stateList[i - 1]).text($(stateList[i]).text());
							$(nameList[i - 1]).text($(nameList[i]).text());
							$(dateList[i - 1]).text($(dateList[i]).text());
							
							$(positionList[i]).text("공란");
							$(stateList[i]).text("공란");
							$(nameList[i]).text("공란");
							$(dateList[i]).text("공란");
						}
					}
				});
			}
		});
	});
	</script>

	<style type="text/css">
	.collapse, .collapsing {
		box-shadow: 0px 0px 0px white !important;
	}
	
	.tox-editor-area {
		contenteditable: false;
	}
	</style>
</head>
<body>
<div class="container-scroller">
	<input type="hidden" id="drafterName" value="${sessionScope.employee.empName}">
	<input type="hidden" id="drafterDepName" value="${sessionScope.employee.depName}">
	<input type="hidden" id="drafterPosName" value="${sessionScope.employee.posName}">
	<input type="hidden" id="documentId" name="docId" value="${document.docId}">
	<!-- partial:../../partials/_navbar.jsp -->
	<%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
	
	<!-- partial -->
	<div class="container-fluid page-body-wrapper">
	
	  	<!-- partial:../../partials/_settings-panel.jsp -->
		<!-- partial -->
		
		<!-- partial:../../partials/_sidebar.jsp -->
		<%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
		<!-- partial -->
			
		<!-- ***** content-start ***** -->
		<div class="main-panel">
	        <div class="content-wrapper">
	        
	        	<div class="row">
            		<div class="col-md-12 grid-margin">
            			<div class="card grid-margin shadow-2">
            				<div class="card-body">
            					<p class="card-title mb-3">기안 작성</p>
            					<div class="row ml-1">
	            					<div class="col-3 card-body mb-3" style="height: fit-content;">
										<div class="card grid-margin" style="border-radius:8px; border: 2px solid #4747A1;">
											<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
												<a class="font-weight-bold text-decoration-none" data-target="#filter_by_status" data-toggle="collapse" style="color: #4747A1;">문서종류</a>
												<div id="status" class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">
												<c:if test="${document.docType != null}">${document.docType}</c:if>
												</div>
											</div>
		        							<div id="filter_by_status" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '휴일근무품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="extrawork" checked>휴일근무품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '휴일근무품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="extrawork">휴일근무품의서
														</c:when>
													</c:choose>
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '출장품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="businesstrip" checked>출장품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '출장품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="businesstrip">출장품의서
														</c:when>
													</c:choose>
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '경조사품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="familyevent" checked>경조사품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '경조사품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="familyevent">경조사품의서
														</c:when>
													</c:choose>
													</label>
												</div>
												<div class="form-check">
													<label class="form-check-label">
													<c:choose>
														<c:when test="${document.docType != null and document.docType == '예비군공가품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="militaryservice" checked>예비군공가품의서
														</c:when>
														<c:when test="${document.docType == null || document.docType != '예비군공가품의서'}">
														<input type="radio" class="form-check-input" name="docType" value="militaryservice">예비군공가품의서
														</c:when>
													</c:choose>
													</label>
												</div>
		        							</div>
		        						</div>
		        						
		        						<div class="card grid-margin" style="background-color: #e7e7ff;">
											<div id="approvalLine" class="card-body">
												<div class="d-flex justify-content-between">												
													<p class="card-title">결재선</p>
													<h3 class="mdi mdi-plus" onclick="popup()"></h3>
												</div>
			            						<div class="card card-tale grid-margin shadow-2 mb-0">
								                    <div class="card-body">
									                    <div class="row">
										                    <div class="col-10">
										                    	<p class="text-white font-weight-bold">${sessionScope.employee.empName}(기안)</p>
										                    	<p>${sessionScope.employee.depName} ${sessionScope.employee.posName}</p>
										                    </div>
									                    </div>
								                    </div>
			            						</div>
			            						<c:forEach items="${approvalLines}" var="approvalLine">
			            						<c:if test="${approvalLine.aprvLineRole != '기안'}">
			            						<div class="r${approvalLine.empId} d-flex align-items-stretch justify-content-center mb-0 remove-flag">
			            							<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>
			            						</div>
		            							<div class="r${approvalLine.empId} card card-dark-blue grid-margin shadow-2 mb-0 remove-flag">
			            							<div class="card-body">
				            							<div class="row">
					            							<div id="${approvalLine.empId}" class="empId col-10 init-flag">
						            							<p class="text-white font-weight-bold">${approvalLine.employee.empName}</p>
						            							<p>${approvalLine.department.depName} ${approvalLine.position.posName}</p>
					            							</div>
					            							<div class="col-2"><i id="r${approvalLine.empId}" class="mdi mdi-close"></i></div>
				            							</div>
			            							</div>
		            							</div>
		        								</c:if>
			            						</c:forEach>
											</div>
										</div>
										
										<div class="card-body" style="background-color: #e7e7ff;">
											<div class="d-flex justify-content-between">												
												<p class="card-title"><label for="upload">첨부파일</label></p>
											</div>
											<div id="fileList">
											<c:if test="${document.documentFiles != null}">
											<c:forEach items="${document.documentFiles}" var="documentFiles">
											<div class="d-flex justify-content-between font-weight-bold text-primary my-3"></div>${documentFiles.docFileName}.${documentFiles.docFileType}<i class="mdi mdi-minus"></i>
											</c:forEach>
											</c:if>
											</div>
										 	<div class="form-group bg-white">
												<input type="file" id="fileUploader" class="file-upload-default" form="approvalForm" name="files" multiple>
												<div class="input-group col-xs-12">
													<span class="input-group-append w-100">
														<button class="file-upload-browse btn btn-primary" style="border-radius: 0; width: inherit;" type="button">파일 첨부</button>
													</span>
												</div>
											</div>
										</div>
	            					</div>
	            					<div class="col-9 card grid-margin mb-3 d-flex justify-content-center flex-column" style="background-color: transparent; box-shadow: 0px 0px 0px white;">
		        						<div class="card-body grid-margin">
											<form id="approvalForm" action="<c:url value='/approval/approvalwrite'/>" method="post" enctype="multipart/form-data">
											<div class="d-flex justify-content-between align-items-center mb-4">
												<div class="card-title mb-0">문서 내용</div>
												<div class="d-flex">
													<button onclick="isTitleExist('Y')" type="button" id="popup-btn" class="btn btn-md btn-warning mx-2">
														<span class="mdi mdi-calendar-clock align-middle"></span>
														<span>임시저장</span>
													</button>
													<button onclick="isTitleExist('N')" type="button" name="docTempYn" value="N" id="popup-btn" class="btn btn-md btn-primary mx-2">
														<span class="mdi mdi-apple-keyboard-caps align-middle"></span>
														<span>상신하기</span>
													</button>
												</div>
											</div>
		        								<textarea id="document" name="document" style="width: inherit;"></textarea>
		        								<input type="hidden" name="drafterId" value="${sessionScope.employee.empId}">
		        								<c:forEach items="${approvalLines}" var="approvalLine">
		        								<c:if test="${approvalLine.aprvLineRole != '기안'}">
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="approvalId" value="${approvalLine.empId}">
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="approvalName" value="${approvalLine.employee.empName}">
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="depName" value="${approvalLine.department.depName}">
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="posName" value="${approvalLine.position.posName}">
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="approvalOrder" value="${approvalLine.aprvLineOrder}">
													<c:choose>
													<c:when test='${approvalLine.aprvLineApprovalDate == null || approvalLine.aprvLineApprovalDate == "공란"}'>
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="approvalState" value="공란">
													</c:when>
													<c:otherwise>
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="approvalState" value="${approvalLine.aprvLineApprovalDate}">
													</c:otherwise>
													</c:choose>
													<c:choose>
													<c:when test='${approvalLine.aprvLineState == null || approvalLine.aprvLineState == "공란"}'>
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="approvalDate" value="공란">
													</c:when>
													<c:otherwise>
													<input class="r${approvalLine.empId} remove-flag" type="hidden" name="approvalDate" value="${approvalLine.aprvLineState}">
													</c:otherwise>
													</c:choose>
		        								</c:if>
		        								</c:forEach>
											</form>
		        						</div>
	            					</div>
            					</div>
            				</div>
            			</div>
					</div>
				</div>
			</div>
			<!-- ***** content-end ***** -->
			
			<!-- partial:../../partials/_footer.jsp -->
			<%@ include file="/WEB-INF/views/common/_footer.jsp" %>
			<!-- partial -->
		
		</div>
		<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
</body>

</html>