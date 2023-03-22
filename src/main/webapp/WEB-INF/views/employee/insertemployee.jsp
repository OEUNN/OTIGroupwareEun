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
		<script src="${pageContext.request.contextPath}/resources/js/file-upload.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/custom/insertemployee.js"></script>
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
		</style>
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
															<input type="text" class="form-control" oninput="nameCheck()" id="empName" name="empName" maxlength="4"  value="장영은"/>
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
															<input type="text" class="form-control" oninput="mailIdCheck()" id="empMail" name="empMail" value="jangyes" maxlength="50" />
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
															<input type="date" class="form-control" id="empDetailBirthday" name="empDetailBirthday" placeholder="YYYY-MM-DD"/>
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
																<input type="file" id="empFileDataMulti" name="empFileDataMulti" class="file-upload-default">
																<div class="input-group col-xs-12">
																	<input type="text" class="form-control file-upload-info"  id="uploadInfo" disabled placeholder="업로드 할 파일"> 
																		<span class="input-group-append">
																		<button class="file-upload-browse btn btn-primary" style="border-radius: 0;" type="button">
																			파일 첨부
																		</button>
																	</span>
																</div>
																<small id="fileResult">&nbsp;</small>
															</div>
															<input type="hidden" id="fileInput"/>
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
														<div class="col-sm-2">
															<div class="form-check">
																<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empDetailMilitaryServiceYN" id="empDetailMilitaryServiceYN" value="Y" checked>군필
																</label>
															</div>
														</div>
														<div class="col-sm-2">
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
																<i class="h3 my-auto mdi mdi-cellphone"></i> 
																<span class="ml-2 font-weight-bold">개인TEL</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" oninput="phoneCheck()" maxlength="20" id="empPhoneNumber" value="010-6889-7892"name="empPhoneNumber" placeholder="000-0000-0000" />
															<small  id="phoneResult">&nbsp;</small>
															<input type="hidden" id="phoneInput"/>
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
															<input type="text" class="form-control" name="empDetailMajor"  value="컴퓨터" id="empDetailMajor" oninput="major()"/>
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
																<input class="my-auto" type="text" id="empDetailEducation" name="empDetailEducation" style="border:none;" value="고졸" readonly>
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
																<i class="h3 my-auto mdi mdi-clipboard-check"></i> 
																<span class="ml-2 font-weight-bold">입사일</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="hidden" id="empId" name="empId" />
															<input type="date" class="form-control" id="empDetailEmploymentDate" name="empDetailEmploymentDate"  placeholder="YYYY-MM-DD"/>
															<small id="inResult">&nbsp;</small>
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
																<input class="my-auto" type="text" id="depId" name="depId" style="border:none;" value="공공사업1DIV" readonly>
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
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-near-me"></i> 
																<span class="ml-2 font-weight-bold">근무지</span>
															</div>
														</div>
														<div class="col-sm-8">
															<input type="text" class="form-control" maxlength="40" id="empDetailWorkplace" name="empDetailWorkplace" value="혜화" oninput="dep()"/>
															<small id="depResult">&nbsp;</small>
															<input type="hidden" id="depInput" />
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
																<input class="my-auto" type="text" id="posId" name="posId" style="border:none;" value="사원" readonly>
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
															<small id="posResult">&nbsp;</small>
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
															<input type="text" class="form-control" maxlength="20" id=empExtensionNumber name="empExtensionNumber" value="02-222-2222" placeholder="000-000-0000" oninput="extension()"/>
															<small id="extensionResult">&nbsp;</small>
															<input type="hidden" id="extensionInput"/>
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