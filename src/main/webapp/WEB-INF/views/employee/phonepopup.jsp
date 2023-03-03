<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- inject css, js common file -->
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<!-- endinject css, js common file -->

<!-- Plugin css,js for this page -->
<style>
.container-fluid {
	padding: 0px;
	margin: 0px;
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
	function phoneCheck(){
		let phone_number = $('#phoneNumber').val();
		var phoneNumber = document.getElementById("phoneNumber");
		let regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	    let phoneresult = regExp.test(phone_number);
	    if(!phoneresult){
	    	phoneNumber.setAttribute("style", "border:1px solid red;");
	    }else{
	    	phoneNumber.setAttribute("style", "border:1px solid none;");
			$.ajax({
				type: 'post',
				url : 'employee/phonecheck',
				data : {phoneNumber : phone_number},
				success : function(data){
					if(data == 'false'){
						phoneNumber.setAttribute("style", "border:1px solid red;");
						$('#phoneResult').val('존재하는 번호입니다.');
						return false;
					}else{
						phoneNumber.setAttribute("style", "border:1px solid none;");
					}
				}
			});
	    }
	}
	
	function setParentText(){
     	opener.document.getElementById("empPhoneNumber").value = document.getElementById("phoneNumber").innerText;
     	window.close();
     }
	</script>
<!-- End plugin css,js for this page -->
</head>

<!-- 로그인 실패시 뜨는 팝업창 -->
<body>
	<div class="main-panel-popup">
		<div class="content-wrapper">
			<!-- Start information -->
			<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body row m-0">
							<form class="container-fluid" method="post">
								<div class="card-title row mx-1 my-3">휴대폰 유효성 검사</div>
								<div class="row form-group bg-white mx-2 my-3">
									<div class="input-group col-xs-12">
										<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="000-0000-0000"> 
										<span class="input-group-append">
											<button onclick="phoneCheck()" class="file-upload-browse btn btn-primary" style="border-radius: 0;" type="button">
												검사
											</button>
										</span>
									</div>
									<small id="phoneResult"></small>
								</div>
								<div class="row d-flex justify-content-center">
									<button class="row btn btn-primary btn-md " onclick="window.close()">확인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- container-scroller -->
</body>

</html>