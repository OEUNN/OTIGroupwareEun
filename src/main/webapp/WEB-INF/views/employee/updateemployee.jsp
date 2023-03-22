<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<!-- inject css, js common file -->
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/custom/insertemployee.js"></script>
	<!-- endinject css, js common file -->
	
	<!-- Plugin css,js for this page -->
	<style>
		.dropdown-toggle::after{
			content:none;
		}
		.form-group{
				margin-bottom:0.4rem;
			}
		small, .small{
			font-size:60%;
		}
		#multi { display:none; } 
	</style>
	<script>
	function getContextPath() {
	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	}
	$(function () {
		$('#multiBtn').click(function(e) {
				e.preventDefault();
				$('#multi').click();
			});
		});
	var sel_file;
	$(document).ready(function() {
		$("#multi").on("change", handleImgFileSelect);
	});
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
		filesArr.forEach(function(f) {
			if (!f.type.match(reg)) {
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	//파일 업로드
	function fn_submit() {
		var result = true;
		var imgFile = $("#multi").val();
    	var fileForm = /(.*?)|.(jpg|jpeg|png|gif|bmplpdf)$/;
    	var maxSize = 5 * 1024 * 1024; // 5MB in bytes
    	var fileSize;
    	if(imgFile != '' && imgFile != null){
    		fileSize = document.getElementById("multi").files[0].size;
    		if(!imgFile.match(fileForm)){
    			swal({
    				text: "이미지 파일만 업로드 가능합니다.",
  				  icon: "error",
  				  button: "닫기",
  				});
    			result = false;
    		}else if(fileSize = maxSize){
    			swal({
    				text: "파일 사이즈가 5MB를 넘습니다.",
	  				  icon: "error",
	  				  button: "닫기",
	  				});
    			result = false;
    		}
    	}else{
    		$('#fileInput').val('true');
    		result = true;
    	}
		if(result){
			var form = new FormData();
			form.append("multi", $("#multi")[0].files[0]);
			jQuery.ajax({
				url : getContextPath()+"/employee/updateEmployeeImg"+x,
				type : "POST",
				processData : false,
				contentType : false,
				data : form,
				success : function(response) {
					console.log(response);
				}
			});
		}
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
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<form action="<c:url value='/employee/updateemployee/${employee.empId}'/>" class="form-sample" onsubmit="return check()" method="post" enctype="multipart/form-data">
										<div class="d-flex justify-content-between align-items-center mb-4">
											<div class="card-title mb-0">임직원 수정</div>
											<div class="d-flex">
												<button  type="submit" class="btn btn-md btn-primary mx-2"> 
													<span class="mdi mdi-lead-pencil align-middle"></span> 
													<span>수정</span>
												</button>
											</div>
										</div>
										
										<div class="row">
											<!-- image card -->
											<div class="col-3">
												<div>
													<!-- 사진 -->
													<div class="row mt-1 justify-content-center m-auto">
														<img src="<c:url value='/employee/file/${employee.empId}'/>" id="img" style="width:250px; height:300px;border-radius:20px;"/>
													</div>
													<div class="row mt-3 justify-content-center" >
														<label id="multiBtn" class="btn btn-md btn-inverse-primary" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">사진 수정</label>
														<input type="file" id="multi" oninput="fn_submit(${employee.empId})">
													</div>
												</div>
											</div><!-- End image card -->
											<!-- information -->
											<div class="col-9">
												<div class="row">
													<div class="col-md-6">
														<div class="form-group row align-items-center">
															<div class="col-sm-4 text-primary">
																<div class="d-flex align-items-center m-1">
																	<i class="h3 my-auto mdi mdi-account"></i> 
																	<span class="ml-2 font-weight-bold">이름</span>
																</div>
															</div>
															<div class="col-sm-8">
																<input type="text" class="form-control" oninput="nameCheck()"  id="empName" name="empName" maxlength="4" placeholder="${employee.empName }"/>
																<small id="nameResult">&nbsp;</small>
																<input type="hidden" id="nameInput"/>
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
																<input type="text" class="form-control" oninput="mailIdCheck()" id="empMail" name="empMail" maxlength="50" value="${employee.empMail }"/>
																<small id="mailResult">&nbsp;</small>
																<input type="hidden" id="mailInput"/>
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
																<input type="date" class="form-control" id="empDetailBirthday" name="empDetailBirthday" value="${employeeDetail.empDetailBirthday}">
																<small id="birthdayResult">&nbsp;</small>
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
															<div class="col-sm-8">
																<div>${employeeDetail.empDetailGender}</div>
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
																<input type="text" class="form-control" oninput="phoneCheck()" maxlength="20" id="empPhoneNumber" name="empPhoneNumber" value="${employee.empPhoneNumber }"/>
																<small  id="phoneResult">&nbsp;</small>
																<input type="hidden" id="phoneInput"/>
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
															<div class="col-sm-3">
																<div class="form-check">
																	<label class="form-check-label"> 
																	<input type="radio" class="form-check-input" name="empDetailMilitaryServiceYN" id="empDetailMilitaryServiceYN" value="Y" checked>군필
																	</label>
																</div>
															</div>
															<div class="col-sm-3">
																<div class="form-check">
																	<label class="form-check-label"> 
																	<input type="radio" class="form-check-input" name="empDetailMilitaryServiceYN" id="empDetailMilitaryServiceYN" value="N">미필
																	</label>
																</div>
															</div>
															<div class="col-sm-3">
																<div class="form-check">
																	<label class="form-check-label"> 
																	<input type="radio" class="form-check-input" name="empDetailMilitaryServiceYN" id="empDetailMilitaryServiceYN" value="X">미해당
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
																	<i class="h3 my-auto mdi mdi-clipboard-check"></i> 
																	<span class="ml-2 font-weight-bold">입사일</span>
																</div>
															</div>
															<div class="col-sm-8">
																<div><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${employeeDetail.empDetailEmploymentDate}"/></div>
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
																	<input type="radio" class="form-check-input"  name="empDetailMarriedYN" id="empDetailMarriedYN" value="Y" checked>기혼
																	</label>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="form-check">
																	<label class="form-check-label"> 
																	<input type="radio" class="form-check-input"  name="empDetailMarriedYN" id="empDetailMarriedYN" value="N">미혼
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
																<input type="text" class="form-control" name="empDetailMajor" id="empDetailMajor" oninput="major()" value="${employeeDetail.empDetailMajor}"/>
																<small id="majorResult">&nbsp;</small>
																<input type="hidden" id="majorInput"/>
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
																	<input class="my-auto" type="text" id="empDetailEducation" name="empDetailEducation"  value="${empDetail.empDetailEducation}" style="border:none;" readonly>
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
																<small id="educationResult"></small>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
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
																	<input class="selectmenu2 my-auto" type="text" id="depId" name="depId" value="${employee.depId}" style="border:none;" readonly>
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
																<small id="depIdResult">&nbsp;</small>
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group row align-items-center">
															<div class="col-sm-4 text-primary">
																<div class="d-flex align-items-center m-1">
																	<i class="h3 my-auto mdi mdi-phone-classic"></i> 
																	<span class="ml-2 font-weight-bold">사내TEL</span>
																</div>
															</div>
															<div class="col-sm-8">
																<input type="text" class="form-control" maxlength="20" id=empExtensionNumber name="empExtensionNumber" oninput="extension()" value="${emp.empExtensionNumber}"/>
																<small id="extensionResult">&nbsp;</small>
																<input type="hidden" id="extensionInput"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
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
																	<input class="my-auto" type="text" id="posId" name="posId" value="${employee.posId}" style="border:none;" readonly>
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
																	<i class="h3 my-auto mdi mdi-incognito"></i> 
																	<span class="ml-2 font-weight-bold">재직상태</span>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="form-check">
																	<label class="form-check-label"> 
																	<input type="radio" class="form-check-input" name="EMP_DETAIL_EMPLOYMENT_STATE" id="EMP_DETAIL_EMPLOYMENT_STATE" value="work" checked>재직중
																	</label>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="form-check">
																	<label class="form-check-label"> 
																	<input type="radio" class="form-check-input" name="EMP_DETAIL_EMPLOYMENT_STATE" id="EMP_DETAIL_EMPLOYMENT_STATE" value="fire">퇴사
																	</label>
																</div>
															</div>
														</div>
													</div>
												</div><!-- End information -->
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
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