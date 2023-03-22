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
		<script type="text/javascript">
		function getContextPath() {
			   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
			}
			$(function () {
			$('#multiBtn').click(function(e) {
					e.preventDefault();
					$('#multi').click();
				});
			});
			//이미지 미리보기
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
						url : getContextPath()+"/employee/updateimg",
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
			function popup(){
				var result = true;
				var pw = $("#password").val();
				var num = pw.search(/[0-9]/g);
				var eng = pw.search(/[a-z]/ig);
				var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

				if(pw.length < 8 || pw.length > 20){
					swal({
						  text: "8자리 ~ 20자리 이내로 입력해주세요.",
						  icon: "error",
						  button: "닫기",
					});
					result = false;
				 }else if(pw.search(/\s/) != -1){
					 swal({
						  text: "비밀번호는 공백 없이 입력해주세요.",
						  icon: "error",
						  button: "닫기",
					});
				  	result = false;
				 }else if(num < 0 || eng < 0 || spe < 0 ){
					 swal({
						  text: "영문,숫자, 특수문자를 혼합하여 입력해주세요.",
						  icon: "error",
						  button: "닫기",
					});
				  	result = false;
				 }
				if(result == true){
					var url = getContextPath() +'/employee/passwordpopup';
				    var name = "password update popup";
				    var option = "width = 500, height =230, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
				    window.open(url, name, option);
				}
			}
			//비밀번호 수정
			function update_password() {
				var password = $('#password').val();
				jQuery.ajax({
					type : 'post',
					url : getContextPath()+"/employee/password",
					data : {password : password},
					success : function(data) {
						$('#password').val('');
						swal({
							  title: "비밀먼호 변경 성공.",
							  icon: "success",
							  button: "닫기",
						});
						
					}
				});
			}
		</script>
		<style>
			#multi { display:none; } 
		
			.og-card-title {
				color: #4B49AC;
			    font-family: 'LeferiPoint-BlackObliqueA';
			    background-color: #e7e7ff;
			    border-radius: 15px;
			    padding: 15px 20px 9px 20px;
			    box-shadow: 3px 3px 6px #cdd1e1;
			    text-transform: capitalize;
			    font-size: 2.125rem;
			    font-weight: 700;
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
					<div class="row">
						<div class="col-md-2 pl-0 grid-margin d-flex justify-content-center">
							<h5 class="mb-0 og-card-title d-flex align-content-center">
								<span class="pt-2 mr-2 mb-0 h4">마이페이지</span>
								<span class="mdi mdi-account-card-details h3 pt-1 mb-0"></span>
							</h5>
						</div>
					</div>
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body row m-0">
									<div class="col-3">
										<div>
											<!-- 사진 -->
											<div class="row mt-1 m-auto">
												<img src="<c:url value='/login/filedownload'/>" id="img" style="width:250px; height:300px;border-radius:20px;"/>
											</div>
											<div class="row mt-3" style="margin-left:70px;">
												<label id="multiBtn" class="btn btn-md btn-inverse-primary" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">사진 수정</label>
												<input type="file" id="multi" oninput="fn_submit()">
											</div>
										</div>
									</div><!-- End image card -->
									<!-- start information -->
									<div class="col-9">
										<div class="form-sample">
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
															<div>${subEmployee.empName}</div>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<span class="h3 my-auto mdi mdi-clipboard-account"></span> 
																<span class="ml-2 font-weight-bold">사번</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div>${subEmployee.empId}</div>
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
															<div><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${employeeDetail.empDetailBirthday}"/></div>
														</div>
													</div>
												</div>
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
											</div>
											<div class="row">
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
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-email"></i> 
																<span class="ml-2 font-weight-bold">메일ID</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div>${subEmployee.empMail}</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-heart"></i> 
																<span class="ml-2 font-weight-bold">결혼여부</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div>${employeeDetail.empDetailMarriedYN}</div>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-flower"></i> 
																<span class="ml-2 font-weight-bold">근무년수</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div>${employeeDetail.empDetailSeniority}년</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-pocket"></i> 
																<span class="ml-2 font-weight-bold">병역</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div>${employeeDetail.empDetailMilitaryServiceYN }</div>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-cellphone"></i> 
																<span class="ml-2 font-weight-bold">개인TEL</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div>${subEmployee.empPhoneNumber }</div>
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
															<div>${employeeDetail.empDetailMajor}</div>
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
															<div>${subEmployee.empExtensionNumber}</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row align-items-center">
														<div class="col-sm-4 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="h3 my-auto mdi mdi-school"></i> 
																<span class="ml-2 font-weight-bold">최종학력</span>
															</div>
														</div>
														<div class="col-sm-8">
															<div>${employeeDetail.empDetailEducation}</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12">
													<div class="form-group row align-items-center">
														<div class="col-sm-2 text-primary">
															<div class="d-flex align-items-center m-1">
																<i class="mdi mdi-key"></i> 
																<span class="ml-2 font-weight-bold">비밀번호 수정</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input type="password" class="form-control" id="password" name="password" placeholder="수정하고싶은 비밀번호를 입력하세요."/>
														</div>
														<div class="col-sm-2">
															<button onclick="popup()" class="btn btn-md btn-inverse-primary btn-icon-text d-flex align-items-center m-1">
																<i class="mdi mdi-key"></i> 
																<span class="ml-2 font-weight-bold">수정</span>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
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