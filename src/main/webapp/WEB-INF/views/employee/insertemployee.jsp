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
		<style>
			.dropdown-toggle::after{
				content:none;
			}
		</style>
		<script>

		function check(){
			var result = true;
			//empId
			let empId = $('#empDetailEmploymentDate').val();
			$('#empId').val(empId);

			//empName
			var empName = document.getElementById("empName");
			if ($('#empName').val() == '') {
				empName.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empName.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailBirthday
			var empDetailBirthday = document.getElementById("empDetailBirthday");
			if ($('#empDetailBirthday').val() == '') {
				empDetailBirthday.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empDetailBirthday.setAttribute("style", "border:1px solid none;");
			}

			//empDetailGender
			var empDetailGender = document.getElementById("empDetailGender");
			if ($('#empDetailGender').val() == '') {
				empDetailGender.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empDetailGender.setAttribute("style", "border:1px solid none;");
			}

			//empFileData
			var empFileDataMulti = document.getElementById("uploadInfo");
			if ($('#empFileDataMulti').val() == '') {
				empFileDataMulti.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empFileDataMulti.setAttribute("style", "border:1px solid none;");
			}

			//empDetailMilitaryServiceYN
			var empDetailMilitaryServiceYN = document.getElementById("empDetailMilitaryServiceYN");
			if ($('#empDetailMilitaryServiceYN').val() == '') {
				empDetailMilitaryServiceYN.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empDetailMilitaryServiceYN.setAttribute("style", "border:1px solid none;");
			}

			//empPhoneNumber
			var empPhoneNumber = document.getElementById("empPhoneNumber");
			if ($('#empPhoneNumber').val() == '') {
				empPhoneNumber.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empPhoneNumber.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailMarriedYN
			var empDetailMarriedYN = document.getElementById("empDetailMarriedYN");
			if ($('#empDetailMarriedYN').val() == '') {
				empDetailMarriedYN.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empDetailMarriedYN.setAttribute("style", "border:1px solid none;");
			}

			//empDetailMajor
			var empDetailMajor = document.getElementById("empDetailMajor");
			if ($('#empDetailMajor').val() == '') {
				empDetailMajor.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				empDetailMajor.setAttribute("style", "border:1px solid none;");
			}

			//empDetailEducation
			var school = document.getElementById("school");
			if ($('#empDetailEducation').val() == '') {
				school.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				school.setAttribute("style", "border:1px solid none;");
			}

			//empDetailEmploymentDate
			var empDetailEmploymentDate = document.getElementById("empDetailEmploymentDate");
			if ($('#empDetailEmploymentDate').val() == '') {
				empDetailEmploymentDate.setAttribute("style","border:1px solid red;");
				result = false;
			} else {
				empDetailEmploymentDate.setAttribute("style","border:1px solid none;");
				
			}

			//depId
			var department = document.getElementById("department");
			let depId = $('#depId').val();
			if ($('#depId').val() == '') {
				department.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				department.setAttribute("style", "border:1px solid none;");
				if ($('#depId').val() == '공공사업1DIV') {
					$("#depId").val(1);
				} else if ($('#depId').val() == '공공사업2DIV') {
					$("#depId").val(2);
				} else if ($('#depId').val() == '공공사업3DIV') {
					$("#depId").val(3);
				} else if ($('#depId').val() == '경영지원부') {
					$("#depId").val(4);
				} else if ($('#depId').val() == '임원') {
					$("#depId").val(5);
				}
			}

			//posId
			var position = document.getElementById("position");
			if ($('#posId').val() == '') {
				position.setAttribute("style", "border:1px solid red;");
				result = false;
			} else {
				position.setAttribute("style", "border:1px solid none;");
				if ($('#posId').val() == '사원') {
					$("#posId").val(1);
				} else if ($('#posId').val() == '대리') {
					$("#posId").val(2);
				} else if ($('#posId').val() == '과장') {
					$("#posId").val(3);
				} else if ($('#posId').val() == '차장') {
					$("#posId").val(4);
				} else if ($('#posId').val() == '부장') {
					$("#posId").val(5);
				} else if ($('#posId').val() == '이사') {
					$("#posId").val(6);
				} else if ($('#posId').val() == '대표이사') {
					$("#posId").val(7);
				}
			}

			//empDetailWorkplace
			var empDetailWorkplace = document.getElementById("empDetailWorkplace");
			if ($('#empDetailWorkplace').val() == '') {
				empDetailWorkplace.setAttribute("style","border:1px solid red;");
				result = false;
			} else {
				empDetailWorkplace.setAttribute("style","border:1px solid none;");
			}
			
			//phoneNumber
			var empPhoneNumber = document.getElementById("empPhoneNumber");
			if($('#empPhoneNumber').val() == ''){
				empPhoneNumber.setAttribute("style","border:1px solid red;");
				result = false;
			}else{
				empPhoneNumber.setAttribute("style","border:1px solid none;");
			}
			
			//empMail
			var empMail = document.getElementById("empMail");
			if ($('#empMail').val() == '') {
				empMail.setAttribute("style","border:1px solid red;");
				result = false;
			}else{
				empMail.setAttribute("style","border:1px solid none;");
			}
			
			//empExtensionNumber
			var empExtensionNumber = document.getElementById("empExtensionNumber");
			if ($('#empExtensionNumber').val() == '') {
				empExtensionNumber.setAttribute("style","border:1px solid red;");
				result = false;
			}else{
				empExtensionNumber.setAttribute("style","border:1px solid none;");
			}
			
			return result;
		}
		
		/** 메일ID 유효성 검사**/
		function mailIdCheck() {
			var empMail = document.getElementById("empMail");
			let mail_id =  $('#empMail').val();
			$.ajax({
				type : 'post',
				url : '../employee/mailidcheck',
				data : {
					mailId : mail_id
				},
				success : function(data) {
					if (data == 'false') {
						empMail.setAttribute("style", "border:1px solid red;");
						$('#mailResult').html('존재하는 ID입니다.');
						$('#empMail').focusout(function(){
							$('#empMail').val("");
						})
					} else {
						empMail.setAttribute("style", "border:1px solid none;");
						$('#mailResult').html('');
						$('#empMail').focusout(function(){
							$('#empMail').val(mail_id);
						})
					}
				}
			});

		}
		
		/** 휴대전화 유효성 검사**/
		function phoneCheck(){
			let phone_number = $('#empPhoneNumber').val();
			var phoneNumber = document.getElementById("empPhoneNumber");
			let regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			let phoneresult = regExp.test(phone_number);
			if (!phoneresult) {
				phoneNumber.setAttribute("style", "border:1px solid red;");
				$('#empPhoneNumber').focusout(function(){
					$('#empPhoneNumber').val("");
				})
			} else {
				phoneNumber.setAttribute("style", "border:1px solid none;");
				$.ajax({
					type : 'post',
					url : '../employee/phonecheck',
					data : {
						phoneNumber : phone_number
					},
					success : function(data) {
						console.log(data)
						if (data == 'false') {
							phoneNumber.setAttribute("style", "border:1px solid red;");
							$('#phoneResult').html('존재하는 휴대폰번호 입니다.');
							$('#empPhoneNumber').val("");
						} else {
							phoneNumber.setAttribute("style", "border:1px solid none;");
							$('#phoneResult').html('');
							$('#empPhoneNumber').focusout(function(){
								$('#empPhoneNumber').val(phone_number);
							})
						}
					}
				});
			}
		}
		function popup() {
			console.log($('#pw').val()); 
			var url = "../employee/passwordpopup";
            var name = "password popup";
            var option = "width = 500, height =250, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
            window.open(url, name, option);
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
										<form action="<c:url value='/employee/insertemployee'/>" class="form-sample" onsubmit="return check()" method="post" enctype="multipart/form-data">
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
															<input type="text" class="form-control" id="empName" name="empName" maxlength="19"/>
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
															<input type="text" class="form-control" oninput="mailIdCheck()" id="empMail" name="empMail" maxlength="50" />
															<small class="text-danger" id="mailResult" style="font-size:5px;"></small>
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
															<input type="date" class="form-control" id="empDetailBirthday" name="empDetailBirthday" placeholder="YYYY-MM-DD"/>
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
																<input type="file" id="empFileDataMulti" name="empFileDataMulti" class="file-upload-default" multiple>
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
															<input type="text" class="form-control" oninput="phoneCheck()" maxlength="20" id="empPhoneNumber" name="empPhoneNumber" placeholder="000-0000-0000" />
															<small class="text-danger" id="phoneResult" style="font-size:5px;"></small>
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
																<input class="my-auto" type="text" id="empDetailEducation" name="empDetailEducation" style="border:none;" readonly>
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
														        	$("#empDetailEducation").val(x);
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
															<input type="hidden" id="empId" name="empId" />
															<input type="date" class="form-control" id="empDetailEmploymentDate" name="empDetailEmploymentDate"  placeholder="YYYY-MM-DD"/>
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
																<input class="my-auto" type="text" id="depId" name="depId" style="border:none;" readonly>
															</div>
															<div class="dropdown-menu" aria-labelledby="department" style="width:100%;">
																<h6 class="dropdown-item" id="select2-1" onclick="select2(1)">공공사업1DIV</h6>
																<h6 class="dropdown-item" id="select2-2" onclick="select2(2)">공공사업2DIV</h6> 
																<h6 class="dropdown-item" id="select2-3" onclick="select2(3)">공공사업3DIV</h6>
																<h6 class="dropdown-item" id="select2-4" onclick="select2(4)">경영지원부</h6>
																<h6 class="dropdown-item" id="select2-5" onclick="select2(5)">임원</h6>
															</div>
															<script>
														        function select2(No){
														        	var x = document.getElementById("select2-" + No).innerText;
														        	$("#depId").val(x);
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
															<input type="text" class="form-control" maxlength="40" id="empDetailWorkplace" name="empDetailWorkplace"/>
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
																<input class="my-auto" type="text" id="posId" name="posId" style="border:none;" readonly>
															</div>
															<div class="dropdown-menu" aria-labelledby="position" style="width:100%;">
																<h6 class="dropdown-item" id="select3-1" onclick="select3(1)">사원</h6>
																<h6 class="dropdown-item" id="select3-2" onclick="select3(2)">대리</h6> 
																<h6 class="dropdown-item" id="select3-3" onclick="select3(3)">과장</h6>
																<h6 class="dropdown-item" id="select3-4" onclick="select3(4)">차장</h6>
																<h6 class="dropdown-item" id="select3-5" onclick="select3(5)">부장</h6>
																<h6 class="dropdown-item" id="select3-6" onclick="select3(6)">이사</h6>
																<h6 class="dropdown-item" id="select3-7" onclick="select3(7)">대표이사</h6>
															</div>
															<script>
														        function select3(No){
														        	var x = document.getElementById("select3-" + No).innerText;
														        	$("#posId").val(x);
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
																<span class="ml-2 font-weight-bold">사내 TEL</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" maxlength="20" id=empExtensionNumber name="empExtensionNumber" placeholder="000-000-0000"/>
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