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
<!-- End plugin css,js for this page -->
</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- To_do_List/Chat -->
			<%@ include file="/WEB-INF/views/common/_settings-panel.jsp"%>
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
									<form class="form-sample">
										<p class="card-title d-flex justify-content-between align-items-start">
											<span>임직원 등록</span>
											<span>
												<button type="submit" class="btn btn-md btn-primary mx-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
													<span class="mdi mdi-folder-account align-middle"></span> 
													<span>등록</span>
												</button>
											</span>
										</p>
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
														<input type="text" class="form-control" />
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
														<input type="text" class="form-control"/>
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
														<input type="text" class="form-control" placeholder="YYYY/MM/DD"/>
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
															<input type="radio" class="form-check-input" name="gender" id="gender1" value="" checked>Male
															</label>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> 
															<input type="radio" class="form-check-input" name="gender" id="gender2" value="option2">Female
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
														<input type="file" class="form-control" />
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
															<input type="radio" class="form-check-input" name="military" id="military1" value="" checked>YES
															</label>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> 
															<input type="radio" class="form-check-input" name="military" id="military2" value="option2">NO
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
														<input type="text" class="form-control" placeholder="000-0000-0000"/>
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
															<input type="radio" class="form-check-input" name="marry" id="marry1" value="" checked>기혼
															</label>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> 
															<input type="radio" class="form-check-input" name="marry" id="marry2" value="option2">미혼
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
														<input type="text" class="form-control" />
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
														<select class="form-control">
															<option>고졸</option>
															<option>학사</option>
															<option>석사</option>
															<option>박사</option>
														</select>
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
															<span class="ml-2 font-weight-bold">채용일</span>
														</div>
													</div>
													<div class="col-sm-8">
														<input type="text" class="form-control" placeholder="YYYY/MM/DD"/>
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
														<input type="text" class="form-control"/>
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
														<input type="text" class="form-control" placeholder="000-000-0000"/>
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