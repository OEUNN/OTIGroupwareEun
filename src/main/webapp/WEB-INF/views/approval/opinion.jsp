<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<style>
	#overflow {
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
	function attachOpinion(textareaId) {
		let opinion = $(textareaId).val();
		let empName = $("#empName").val();
		let posName = $("#posName").val();
		let approvalLineState = $("#approvalLineState").val();
		
		let sendData = {
			content :	
				'<p class="removeOpinion h4 font-weight-bold text-primary mb-1">' + empName + ' ' + posName + '<i id="removeOpinion" class="removeOpinion mdi mdi-close"></i></p>' +
				'<p class="removeOpinion mb-0">' + opinion + '</p>',
			removeClass : 'removeOpinion',
			opinion : opinion,
			approvalLineState : approvalLineState
		}
		
		opener.postMessage(sendData);
		window.close();
	}
	
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
									<input id="approvalLineState" type="hidden" value="${approvalLineState}">
									<input id="empName" type="hidden" value="${sessionScope.employee.empName}">
									<input id="posName" type="hidden" value="${sessionScope.employee.posName}">
									<label for="opinionText">의견</label>
								</div>
								<div class="row m-1 mt-3 form-group d-flex flex-column">
									<div class="form-group">
										<textarea class="form-control" id="opinionText" rows="4"></textarea>
									</div>
								</div>
								<div class="row mb-3" >
									<div class="col"></div>
									<button class="col btn btn-primary btn-md mt-1 mx-3" onclick="attachOpinion('#opinionText')">의견 작성하기</button>
									<button class="col btn btn-outline-primary btn-md mt-1 mx-3" onclick="cancel()">작성 취소</button>
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