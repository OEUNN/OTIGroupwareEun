<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<style>
	#overflow {
		overflow:auto;
	}
	
	.highlight:hover {
		font-weight: bold;
		color: #4747A1;
	}
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
	<script>
		var order = 1;
		
		function appendToList(elementId) {
			delId = 'del' + elementId;
			if ($("#approvalLine").has("div[id=" + delId + "]").length === 0) {
				
				originalId = elementId;
				elementId = '#' + elementId;
				
				clonedElement = $(elementId).clone();
				clonedElement.removeClass('mdi-account-star');
				clonedElement.addClass('mdi-minus');
				let jQueryElement = clonedElement.html();
				
				jQueryElement = '<div id="' + delId + '" class="'+order+' highlight row m-1 ' + $(elementId).attr('class').split(' ')[3] + '" onclick="removeFromList('+originalId+')">' + jQueryElement + '</div>'
				$("#approvalLine").append(jQueryElement);
				
				order += 1;
			}
			else {
				alert("같은 사람을 두번 이상 지정할 수 없습니다.");
			}
		}
		
		//In Javascript, 숫자로만 이루어진 문자열이 0으로 시작하면 8진수로 인식한다.
		//따라서 8진수를 10진수로 다시 바꾼 수를 넘겨주게 된다.
		function removeFromList(Id) {
			var delId = '#del' + Id;
			
			if ($(delId).length === 0) {
				delId = '#del' + '0' + Id.toString(8);
			}
			
			$(delId).remove();
			
			if (order > 0) {
				order -= 1;
			}
		}
		
		function sendApprovalLine(tagId) {
			opener.location.href = "javascript:remove();";
			$(tagId).each((index, element) => {
				var empId = $(element).attr('id').substr(3);
				var depName = $(element).attr('class').split(' ')[4];
				
				var empData = $(element).text().split(' ');
				
				var empName = empData[0];
				var posName = empData[1];
				var empMail = empData[2];
				
				var sendData = {
					content :
						'<button id="'+empId+'" class="empBtn mb-1 mx-2">'+
							'<span>'+empName+' '+empMail+'</span>'+
						'</button>',
					empId : empId,
					empName : empName,
					depName : depName,
					empMail : empMail,
					posName : posName
				}
				opener.postMessage(sendData);
				window.close();
			//$(tagId).forEach
			});
		//function sendApprovalLine
		}
		
		function cancel() {
			window.close();
		}
		
// 		$(document).ready(function(){
// 			var receiveId = opener.$("#receive").val(); 
// 			$.each(receiveId, function( index, value){
// 				if(receivedId != null){
// 					$('#approvalLine').empty();
// 					var receiveMail = opener.$("#receiveMail").val();
// 					var receiveName = opener.$("#receiveName").val();
// 					var receiveDepName = opener.$("#receiveDepName").val();
// 					var receivePosName = opener.$("#receivePosName").val();
// 					var sql = ""
// 					sql += '<div id="del'+receiveId+'" class="highlihgt row m-1 '+receiveDepName+'" onclick="removeFromList('+receiveId+')">'
// 					sql += '<span class="h3 mdi mdi-account-star d-flex align-self-center mx-1"></span>'+receiveName+''
// 					sql += '<span class="ml-2" >' + receiveMail+'</span>'
// 					$("#approvalLine").append(sql);
// 				}
// 			});
			
// 		}
	</script>
</head>

<body>
	<div class="main-panel-popup">
			<div class="content-wrapper">
				<!-- Start information -->
				<div class="row">
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<form class="card-body row m-0">
								<div class="container-fluid">
									<div class="card-title row mx-1 my-3">
										주소록
									</div>
									<!-- 드롭다운을 이용해서 부에 따라 사람 불러오기 -->
									<div class="row m-1 mt-3 form-group d-flex flex-column" style="height: 300px; border: 1px solid #ced4da;">
										<div id="overflow">
											<div class="highlight row m-1 text-primary"><span class="mdi mdi-account-star d-flex align-self-center mx-1">
												</span>
												최전무 대표이사
											</div>
											<div class="highlight row m-1 text-primary"  onclick="department(1)" data-toggle="collapse" data-target="#DIV1">
												<span class="mdi mdi-folder-account d-flex align-self-center mx-1 "></span>
												공공사업1DIV
											</div>
											<div id="DIV1" class="row m-1 collapse text-primary">
												<div id="dep-1" class="d-flex flex-column">
													<c:forEach items="${emp}" var="org">
														<c:if test="${org.depId==1}">
															<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendToList("${org.empId}")'>
															<span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>
															${org.empName} ${org.posName} 
															<span class="ml-2">[${org.empMail}]</span>
														</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
											<div class="highlight row m-1 text-primary" onclick="department(2)" data-toggle="collapse" data-target="#DIV2">
												<span class="mdi mdi-folder-account d-flex align-self-center mx-1"></span>
												공공사업2DIV
											</div>
											<div id="DIV2" class="row m-1 collapse text-primary">
												<div id="dep-2" class="d-flex flex-column p-0">
													<c:forEach items="${emp}" var="org">
														<c:if test="${org.depId==2}">
														<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendToList("${org.empId}")'>
															<span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>
															${org.empName} ${org.posName} 
															<span class="ml-2">[${org.empMail}]</span>
														</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
											<div class="highlight row m-1 text-primary" onclick="department(3)" data-toggle="collapse" data-target="#DIV3">
												<span class="mdi mdi-folder-account d-flex align-self-center mx-1"></span>
												공공사업3DIV
											</div>
											<div id="DIV3" class="row m-1 collapse text-primary">
												<div id="dep-3" class="d-flex flex-column p-0">
												<c:forEach items="${emp}" var="org">
														<c:if test="${org.depId==3}">
														<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendToList("${org.empId}")'>
															<span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>
															${org.empName} ${org.posName} 
															<span class="ml-2">[${org.empMail}]</span>
														</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
											<div class="highlight row m-1 text-primary" onclick="department(4)" data-toggle="collapse" data-target="#DIV4">
											<span class="mdi mdi-folder-lock d-flex align-self-center mx-1"></span>
												경영지원
											</div>
											<div id="DIV4" class="row m-1 collapse text-primary">
												<div id="dep-4" class="d-flex flex-column p-0">
												<c:forEach items="${emp}" var="org">
														<c:if test="${org.depId==4}">
														<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendToList("${org.empId}")'>
															<span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>
															${org.empName} ${org.posName} 
															<span class="ml-2">[${org.empMail}]</span>
														</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									<div class="row m-1 mt-3 mb-5 form-group d-flex flex-column" style="height: 150px; border:1px solid #ced4da;">
										<div id="approvalLine" class="overflow">
										</div>
									</div>
									<div class="row mb-3" >
										<div class="col"></div>
										<button class="col btn btn-primary btn-md mt-1 mx-3" onclick="sendApprovalLine('#approvalLine div')">확인</button>
										<button class="col btn btn-outline-primary btn-md mt-1 mx-3" onclick="window.close()">취소</button>
										<div class="col"></div>
									</div>
															
								</div>
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
</body>

</html>