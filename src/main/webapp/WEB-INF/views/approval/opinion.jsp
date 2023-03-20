<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function attachOpinion() {
		var opinion = $("#opinionText").val().toString();
		var approvalLineState = $("#approvalLineState").val();

		var sendData = {
			attached : true,
			opinion : opinion,
			approvalLineState : approvalLineState
		}
		
		opener.postMessage(sendData);
 		window.close();
	}
	
	function omitOpinion() {
		var opinion = "foo";
		var approvalLineState = $("#approvalLineState").val();
		
		var sendData = {
			attached : false,
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
									<label for="opinionText">의견 제시하기</label>
								</div>
								<div class="row m-1 mt-3 form-group d-flex flex-column">
									<div class="form-group">
										<textarea class="form-control" id="opinionText" rows="4"></textarea>
									</div>
								</div>
								<div class="row mb-3" >
									<div class="col"></div>
									<c:if test="${approvalLineState == '승인'}">
									<button class="col btn btn-primary btn-md mt-1 mx-3" onclick="omitOpinion()">의견 생략</button>
									</c:if>
									<button class="col btn btn-primary btn-md mt-1 mx-3" onclick="attachOpinion()">작성 완료</button>
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