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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		var order = 1;
		
		$(() => {
			let openerHTML = opener.$('#approvalLine');
			let drafterId = openerHTML.find('input[name="drafterId"]').val();
			appendToList(drafterId);
			openerHTML.find('.remove-flag').each((index, item) => {
				if (index % 2 === 0) {
					var Id = item.classList[0].substring(1);
					appendToList(Id);
				}
			})
		});
		
		function appendToList(elementId) {
			var readerId = $("#readerId").val();
			if (elementId !== readerId) {
				if ($("#approvalLine div").length < 4) {
					delId = 'del' + elementId;
					if ($("#approvalLine").has("div[id=" + delId + "]").length === 0) {
						
						originalId = elementId;
						elementId = '#' + elementId;
						
						clonedElement = $(elementId).clone();
						clonedElement.removeClass('mdi-account-star');
						clonedElement.addClass('mdi-minus');
						let jQueryElement = clonedElement.html();
						
						jQueryElement = '<div id="' + delId + '" class="'+order+' highlight row m-1 ' + $(elementId).attr('class').split(' ')[3] + '" onclick="removeFromList('+ "'" + originalId + "'" +')">' + jQueryElement + '</div>'
						$("#approvalLine").append(jQueryElement);
						
						order += 1;
					}
					else {
						alert("결재선에 같은 사람을 두번 이상 지정할 수 없습니다.");
					}
				}
				else {
					alert("결재선은 자신 포함 최대 5명까지만 지정이 가능합니다.");
				}
			}
			else {
				alert("자기 자신을 결재선에 지정할 수 없습니다.");
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
			let lastIndex = $(tagId).length - 1;
			$(tagId).each((index, element) => {
				var empId = $(element).attr('id').substr(3);
				var depName = $(element).attr('class').split(' ')[4];
				
				var empData = $(element).text().split(' ');
				
				var empName = empData[0];
				var posName = empData[1];
				//var empMail = empData[2];
				
				var removeClass = 'r' + empId;
				var approvalOrder = $(element).attr('class').split(' ')[0];
				
				var sendData = {
					content :	
					'<div class="' + removeClass + ' d-flex align-items-stretch justify-content-center mb-0 remove-flag">' +
						'<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>' +
					'</div>' +
					'<div class="' + removeClass + ' card card-dark-blue grid-margin shadow-2 mb-0 remove-flag">' +
						'<div class="card-body">' +
							'<div class="row">' +
								'<div id=' + empId + ' class="empId col-10 init-flag">' +
									'<p class="text-white font-weight-bold">' +
										empName +
									'</p>' +
									'<p>' +
										depName + ' ' + posName +
									'</p>' +
								'</div>' +
								'<div class="col-2">' +
									'<i id=' + removeClass + ' class="' + index + ' mdi mdi-close"></i>' +
								'</div>' +
							'</div>' +
						'</div>' +
					'</div>',
					removeClass : removeClass,
					empId : empId,
					empName : empName,
					depName : depName,
					posName : posName,
					approvalOrder : approvalOrder,
					lastIndex : lastIndex,
					index : index
				}
				opener.postMessage(sendData);
			//$(tagId).forEach
			});
			window.close();
		//function sendApprovalLine
		}
		
		function cancel() {
			window.close();
		}
	</script>
</head>

<body>
	<input id="readerId" type="hidden" value="${sessionScope.employee.empId}"/>
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
									<c:forEach items="${organizationsMapKeySet}" var="key">
										<c:if test="${key >= 5}">
											<c:forEach items="${organizationsMap[key]}" var="org">
											<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendToList("${org.empId}")'><span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>${org.empName} ${org.posName} <span class="ml-2">[${org.empMail}]</span></div>
											</c:forEach>
										</c:if>
	
										<c:if test="${key < 5}">
										<div class="highlight row m-1" data-toggle="collapse" data-target="#DIV${key}"><span class="mdi mdi-folder-account d-flex align-self-center mx-1"></span>${organizationsMap[key][0].depName}</div>
										<div id="DIV${key}" class="row m-1 collapse">	
											<c:forEach items="${organizationsMap[key]}" var="org">
											<c:if test="${org.empId != sessionScope.employee.empId}">
											<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='appendToList("${org.empId}")'><span class="mdi mdi-account d-flex align-self-center mx-1"></span>${org.empName} ${org.posName} <span class="ml-2">[${org.empMail}]</span></div>
											</c:if>
											<c:if test="${org.empId == sessionScope.employee.empId}">
											<div id="${org.empId}" class="highlight row m-1 ${org.depName}" onclick='Swal.fire("자기 자신을 결재선에 추가할 수 없습니다.")'><span class="mdi mdi-account d-flex align-self-center mx-1"></span>${org.empName} ${org.posName} <span class="ml-2">[${org.empMail}]</span></div>
											</c:if>
											</c:forEach>
										</div>
										</c:if>
									</c:forEach>
									</div>
								</div>
								<div class="row m-1 mt-3 mb-5 form-group d-flex flex-column" style="height: 150px; border:1px solid #ced4da;">
									<div id="approvalLine" class="overflow">
									</div>
								</div>
								<div class="row mb-3" >
									<div class="col"></div>
									<button class="col btn btn-primary btn-md mt-1 mx-3" onclick="sendApprovalLine('#approvalLine div')">확인</button>
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