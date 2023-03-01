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
		<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/file-upload.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/employee.js"></script>
		<style>
			.dropdown-toggle::after{
				content:none;
			}
		</style>
		<script>
		/**일반전화 유효성 검사**/
		function extensionCheck(){
			let tel_number = $('#empExtensionNumber').val();
			var telNumber = document.getElementById("empExtensionNumber");
			let regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		    let telresult = regExp.test(tel_number);
		    if(!telresult){
		    	telNumber.setAttribute("style", "border:1px solid red;");
		    	return false;
		    }else{
		    	$.ajax({
	    			type: 'post',
	    			url : 'employee/telcheck',
	    			data : {check : "tleNumber" , value : tel_number},
	    			success : function(data){
	    				let checkresult = data.result;
	    				if(checkresult == false){
	    					telNumber.setAttribute("style", "border:1px solid red;");
	    					$('input[name=empExtensionNumber]').attr('placeholder','존재하지 않는 부서 번호입니다.');
	    				}else{
	    					telNumber.setAttribute("style", "border:1px solid none;");
	    					return false;
	    				}
	    			}
	    		});
		    }
		}
		
		/** 휴대전화 유효성 검사**/
		function phoneCheck(){
			let phone_number = $('#empPhoneNumber').val();
			var phoneNumber = document.getElementById("empPhoneNumber");
			let regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		    let phoneresult = regExp.test(phone_number);
		    if(!phoneresult){
		    	phoneNumber.setAttribute("style", "border:1px solid red;");
		    	return false;
		    }else{
	    		$.ajax({
	    			type: 'post',
	    			url : 'employee/phonecheck',
	    			data : {check : "phoneNumber" , value : phone_number},
	    			success : function(data){
	    				let checkresult = data.result;
	    				if(checkresult == false){
	    					phoneNumber.setAttribute("style", "border:1px solid red;");
	    					$('input[name=empPhoneNumber]').attr('placeholder','존재하는 번호입니다.');
	    				}else{
	    					phoneNumber.setAttribute("style", "border:1px solid none;");
	    					return false;
	    				}
	    			}
	    		});
		    	
		    }
		}
		
		/** 메일ID 유효성 검사**/
		function mailIdCheck(){
			if($('#empMail').val() == ''){
				mailId.setAttribute("style", "border:1px solid red;");
		    	return false;
			}else{
	    		$.ajax({
	    			type: 'post',
	    			url : 'employee/mailidcheck',
	    			data : {check : "mailId" , value : $('#empMail').val()},
	    			success : function(data){
	    				let checkresult = data.result;
	    				if(checkresult == false){
	    					mailId.setAttribute("style", "border:1px solid red;");
	    					$('input[name=empMail]').attr('placeholder','존재하는 ID입니다.');
	    				}else{
	    					mailId.setAttribute("style", "border:1px solid none;");
	    					return false;
	    				}
	    			}
	    		});
		    	
		    }
		}

		function check(){
			var result = true;
			
			var empName = document.getElementById("empName");
			var empMail = document.getElementById("empMail");
			var empBirthdayStr = document.getElementById("empBirthdayStr");
			var empDetailGender = document.getElementById("empDetailGender");
			var uploadInfo = document.getElementById("uploadInfo");
			var empDetailMilitaryServiceYN = document.getElementById("empDetailMilitaryServiceYN");
			var empPhoneNumber = document.getElementById("empPhoneNumber");
			var empDetailMarriedYN = document.getElementById("empDetailMarriedYN");
			var empDetailMajor = document.getElementById("empDetailMajor");
			var school = document.getElementById("school");
			var employmentDateStr = document.getElementById("employmentDateStr");
			var department = document.getElementById("department");
			var empExtensionNumber = document.getElementById("empExtensionNumber");
			var position = document.getElementById("position");
			var empDetailWorkplace = document.getElementById("empDetailWorkplace");
			
			
			//empName
			if($('#empName').val() == ''){
				empName.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empName.setAttribute("style", "border:1px solid none;");
			}
			
			//empMail
			if($('#empMail').val() == ''){
				empMail.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empMail.setAttribute("style", "border:1px solid none;");
			}
			
			//empBirthdayStr
			if($('#empBirthdayStr').val() == ''){
				empBirthdayStr.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empBirthdayStr.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailGender
			if($('#empDetailGender').val() == ''){
				empDetailGender.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailGender.setAttribute("style", "border:1px solid none;");
			}
			
			//empFileData
			if($('#empFileData').val() == ''){
				uploadInfo.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				uploadInfo.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailMilitaryServiceYN
			if($('#empDetailMilitaryServiceYN').val() == ''){
				empDetailMilitaryServiceYN.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailMilitaryServiceYN.setAttribute("style", "border:1px solid none;");
			}
			
			//empPhoneNumber
			if($('#empPhoneNumber').val() == ''){
				empPhoneNumber.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empPhoneNumber.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailMarriedYN
			if($('#empDetailMarriedYN').val() == ''){
				empDetailMarriedYN.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailMarriedYN.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailMajor
			if($('#empDetailMajor').val() == ''){
				empDetailMajor.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailMajor.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailEducation
			if($('#empDetailEducation').val() == ''){
				school.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				school.setAttribute("style", "border:1px solid none;");
			}
			
			//employmentDateStr
			if($('#employmentDateStr').val() == ''){
				employmentDateStr.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				employmentDateStr.setAttribute("style", "border:1px solid none;");
			}
			
			//depId
			if($('#depId').val() == ''){
				department.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				department.setAttribute("style", "border:1px solid none;");
			}
			
			//empExtensionNumber
			if($('#empExtensionNumber').val() == ''){
				empExtensionNumber.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empExtensionNumber.setAttribute("style", "border:1px solid none;");
			}
			
			//posId
			if($('#posId').val() == ''){
				position.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				position.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailWorkplace
			if($('#empDetailWorkplace').val() == ''){
				empDetailWorkplace.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailWorkplace.setAttribute("style", "border:1px solid none;");
			}
			
			return result;
		}
		</script>
		<!-- End plugin css,js for this page -->
	</head>

	<body>
		<div class="container-scroller">
			<!-- Navbar -->
			<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
			<div class="container-fluid page-body-wrapper">
				<!-- Sidebar -->
				<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>
				<!-- partial -->
				<div class="main-panel">
					<div class="content-wrapper">
						<!-- Start information -->
						<div class="row">
							<div class="col-12 grid-margin">
								<div class="card">
									<div class="card-body ">
										<form action="<c:url value='/employee/insertemployee'/>" class="form-sample"  onsubmit="return check()" method="post"  enctype="multipart/form-data">
											<div class="d-flex justify-content-between align-items-center mb-4">
												<div class="card-title mb-0">임직원 등록</div>
												<div class="d-flex">
													<button type="submit" class="btn btn-md btn-primary mx-2" >
														<span class="mdi mdi-folder-account align-middle"></span> 
														<span>등록</span>
													</button>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6"> 
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-account"></i> 
																<span class="ml-2 font-weight-bold" >이름</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" id="empName" name="empName" maxlength="19" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-email"></i> 
																<span class="ml-2 font-weight-bold">메일ID</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" oninput="mailIdCheck()" id="empMail" name="empMail" maxlength="50"/>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-cake"></i> 
																<span class="ml-2 font-weight-bold">생년월일</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="date" class="form-control" id="empBirthdayStr" name="empBirthdayStr" placeholder="YYYY-MM-DD"/>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-human-male-female"></i> 
																<span class="ml-2 font-weight-bold">성별</span>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-check">
																<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empDetailGender" id="empDetailGender" value="M" checked>Male
																</label>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-check">
																<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empDetailGender" id="empDetailGender" value="F">Female
																</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-face"></i> 
																<span class="ml-2 font-weight-bold">사진</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div class="form-group bg-white">
																<input type="file" id="empFileData" name="empFileData" class="file-upload-default" multiple>
																<div class="input-group col-xs-12">
																	<input type="text" class="form-control file-upload-info"  id="uploadInfo" disabled placeholder="업로드 할 파일"> 
																		<span class="input-group-append">
																		<button class="file-upload-browse btn btn-primary" style="border-radius: 0;" type="button">
																			파일 첨부
																		</button>
																	</span>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-pocket"></i> 
																<span class="ml-2 font-weight-bold">병역</span>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-check">
																<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empDetailMilitaryServiceYN" id="empDetailMilitaryServiceYN" value="Y" checked>YES
																</label>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-check">
																<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empDetailMilitaryServiceYN" id="empDetailMilitaryServiceYN" value="N">NO
																</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-cellphone"></i> 
																<span class="ml-2 font-weight-bold">개인TEL</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" oninput="phoneCheck()" maxlength="20" id="empPhoneNumber" name="empPhoneNumber" placeholder="000-0000-0000"/>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-heart"></i> 
																<span class="ml-2 font-weight-bold">결혼여부</span>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-check">
																<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empDetailMarriedYN" id="empDetailMarriedYN" value="Y" checked>기혼
																</label>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-check">
																<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empDetailMarriedYN" id="empDetailMarriedYN" value="N">미혼
																</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-book-open-page-variant"></i> 
																<span class="ml-2 font-weight-bold">전공</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" name="empDetailMajor" id="empDetailMajor"/>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-school"></i> 
																<span class="ml-2 font-weight-bold">최종학력</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div class="btn dropdown-toggle d-flex form-control " id="school" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
																<i class="text-primary mdi mdi-menu-down"></i> 
																<input class="selectmenu1 my-auto" type="text" id="empDetailEducation" name="empDetailEducation" style="border:none;" readonly>
															</div>
															<div class="dropdown-menu" aria-labelledby="school" style="width:100%;">
																<h6 class="dropdown-item" id="select1-1" onclick="select1(1)">고졸</h6>
																<h6 class="dropdown-item" id="select1-2" onclick="select1(2)">학사</h6> 
																<h6 class="dropdown-item" id="select1-3" onclick="select1(3)">석사</h6>
																<h6 class="dropdown-item" id="select1-4" onclick="select1(4)">박사</h6>
															</div>
															<script>
														        function select1(No){
														        	var x = document.getElementById("select1-" + No).innerText;
														        	$(".selectmenu1").val(x);
														        }
															</script>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-clipboard-check"></i> 
																<span class="ml-2 font-weight-bold">입사일</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="date" class="form-control" id="employmentDateStr" name="employmentDateStr" placeholder="YYYY-MM-DD"/>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-account-multiple"></i> 
																<span class="ml-2 font-weight-bold">부서</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div class="btn dropdown-toggle d-flex form-control" id="department" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
																<i class="text-primary mdi mdi-menu-down"></i> 
																<input class="selectmenu2 my-auto" type="text" id="depId" name="depId" style="border:none;" readonly>
															</div>
															<div class="dropdown-menu" aria-labelledby="department" style="width:100%;">
																<h6 class="dropdown-item" id="select2-1" onclick="select2(1)">공공사업1DIV</h6>
																<h6 class="dropdown-item" id="select2-2" onclick="select2(2)">공공사업2DIV</h6> 
																<h6 class="dropdown-item" id="select2-3" onclick="select2(3)">공공사업3DIV</h6>
																<h6 class="dropdown-item" id="select2-4" onclick="select2(4)">경영지원부</h6>
															</div>
															<script>
														        function select2(No){
														        	var x = document.getElementById("select2-" + No).innerText;
														        	$(".selectmenu2").val(x);
														        	$('input[name=depId]').attr('value',No);
														        }
															</script>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-phone-classic"></i> 
																<span class="ml-2 font-weight-bold">사내TEL</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" maxlength="20" oninput="extensionCheck()" id="empExtensionNumber" name="empExtensionNumber" placeholder="000-000-0000"/>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-trophy-award"></i> 
																<span class="ml-2 font-weight-bold">직급</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div class="btn dropdown-toggle d-flex form-control" id="position" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
																<i class="text-primary mdi mdi-menu-down"></i> 
																<input class="selectmenu3 my-auto" type="text" id="posId" name="posId" style="border:none;" readonly>
															</div>
															<div class="dropdown-menu" aria-labelledby="position" style="width:100%;">
																<h6 class="dropdown-item" id="select3-1" onclick="select3(1)">사원</h6>
																<h6 class="dropdown-item" id="select3-2" onclick="select3(2)">대리</h6> 
																<h6 class="dropdown-item" id="select3-3" onclick="select3(3)">차장</h6>
																<h6 class="dropdown-item" id="select3-4" onclick="select3(4)">부장</h6>
															</div>
															<script>
														        function select3(No){
														        	var x = document.getElementById("select3-" + No).innerText;
														        	$(".selectmenu3").val(x);
														        	$('input[name="posId"]').attr('value',No);
														        }
															</script>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-phone-classic"></i> 
																<span class="ml-2 font-weight-bold">근무지</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" maxlength="40" id="empDetailWorkplace" name="empDetailWorkplace" placeholder="000-000-0000"/>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div><!-- End information -->
					</div>
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