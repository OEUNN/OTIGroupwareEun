<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<style>
	.overflow {
		overflow: auto;
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
		function appendList(elementId) {
			elementId = '#' + elementId;
			let jQueryElement = $(elementId);
			jQueryElement.wrap('<div class="highlight row m-1"></div>');
			jQueryElement.addClass($(elementId).attr('class')[3]);
			jQueryElement.addEventListener('click', function(event) {
				$(event.target).remove();
			})
			let html = $(jQueryElement).html();
			$("#approvalLine").append(html);
		}
		
		$(document).ready(function(){
			function sendApprovalLine(tagId) {
				$(tagId).forEach((employee) => {
					var empId = employee.attr('id');
					var depName = employee.attr('class')[3];
					
					var empData = employee.text().split(' ');
					
					var empName = empData[0];
					var posName = empData[1];
					//var empMail = empData[2];
					
					var removeClass = 'r' + empId;
					
					var sendData = {
						content :	
						'<div class="' + removeClass + ' d-flex align-items-stretch justify-content-center mb-0">' +
							'<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>' +
						'</div>' +
						'<div class="' + removeClass + ' card card-dark-blue grid-margin shadow-2 mb-0">' +
							'<div class="card-body">' +
								'<div class="row">' +
									'<div id=' + empId + ' class="empId col-10">' +
										'<p class="text-white font-weight-bold">' +
											empName +
										'</p>' +
										'<p>' +
											depName + posName +
										'</p>' +
									'</div>' +
									'<div class="col-2">' +
										'<i id=' + removeClass + ' class="mdi mdi-close"></i>' +
									'</div>' +
								'</div>' +
							'</div>' +
						'</div>',
						removeClass : removeClass
					}
				//$(tagId).forEach
				});
				opener.postMessage(data, '/sendApprovalList');
				window.close();
			//function sendApprovalLine
			}
		//$(document).ready
		});
		
		
		function cancel() {
			window.close();
		}
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
									<div class="overflow">
									<c:forEach items="${organizationsMapKeySet}" var=key>
										<c:if test="${keySet} >= 5">
											<c:forEach items="${organizationsMap[key]}" var="org">
											<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendList("${org.empId}")'><span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>${org.empName} ${org.posName} <span class="ml-2">[${org.empMail}]</span></div>
											</c:forEach>
										</c:if>
	
										<c:if test="${keySet} < 5">
										<div class="highlight row m-1" data-toggle="collapse" data-target="#DIV${keySet}"><span class="mdi mdi-folder-account d-flex align-self-center mx-1"></span>${organizationsMap[key][0].depName}</div>
										<div id="DIV${keySet}" class="row m-1 collapse">	
											<c:forEach items="${organizationsMap[key]}" var="org">
											<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendList("${org.empId}")'><span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>${org.empName} ${org.posName} <span class="ml-2">[${org.empMail}]</span></div>
											</c:forEach>
										</div>
										</c:if>
									</c:forEach>
									</div>
								</div>
								<div class="row m-1 mt-3 mb-5 form-group d-flex flex-column" style="height: 150px; border:1px solid #ced4da;">
									<div id="approvalLine" class="overflow">
										<div class="highlight row m-1"><span class="mdi mdi mdi-minus d-flex align-self-center mx-1"></span>김부련 부장<span class="ml-2">[kimbujang@oti.com]</span></div>
									</div>
								</div>
								<div class="row mb-3" >
									<div class="col"></div>
									<button class="col btn btn-primary btn-md mt-1 mx-3" onclick="sendApprovalLine('#approvalLine')">확인</button>
									<button class="col btn btn-outline-primary btn-md mt-1 mx-3" onclick="cancel()">취소</button>
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