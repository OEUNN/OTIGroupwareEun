<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		<style>
		.table th, .jsgrid .jsgrid-table th,
		.table td,
		.jsgrid .jsgrid-table td {
		  padding: 0.525rem 1.375rem;
		}
		</style>
	</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<!-- 받은 메일 col -->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">받은 메일</h4>
									<div class="row form-inline mx-3">
										<div>
											<button class="btn btn-outline-danger btn-sm">선택삭제</button>
										</div>
										<div>
											<button class="btn btn-outline-danger btn-sm">읽은메일</button>
										</div>
										<div>
											<button class="btn btn-outline-danger btn-sm">읽지않은메일</button>
										</div>
										<div>
											<button class="btn btn-outline-danger btn-sm">중요메일</button>
										</div>
										<div>
											<button class="btn btn-outline-danger btn-sm">중요표시안한메일</button>
										</div>
									</div>
									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class=" form-inline col-2" style="border:none;">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</th>
													<th class="col-2">ID</th>
													<th class="col-5">제목</th>
													<th class="col-2">날짜</th>
													<th class="col-1">읽음</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>longzero1</td>
													<td>[Wavve] 자동결제 완료 확인</td>
													<td>2023/02/21</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star-outline text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>Microsoft 계정 보안 코드</td>
													<td>2023/02/02</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>24 hours left: Get 75% off lifetime access</td>
													<td>2023/02/21</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>미니프로젝트_발표자료.pptx</td>
													<td>2022/12/23</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>28.76%</td>
													<td>2023/02/21</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>사내 그릅웨어 요구사항 정의서</td>
													<td>2022/12/02</td>
													<td>안읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>SRM 프로젝트 화면 설계서</td>
													<td>2022/11/04</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>SRM 프로젝트 요구사항 정의서</td>
													<td>2022/11/01</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>장영은</td>
													<td>확인요청 바랍니다.</td>
													<td>2022/10/21</td>
													<td>읽음</td>
												</tr>
												<tr>
													<td class="form-inline p-2 pl-3">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button class="p-0">
															<i class="h3 mdi mdi-star-outline text-primary"></i>
														</button>
													</td>
													<td><i class="mdi mdi-arrow-left text-primary"></i>신문영</td>
													<td>공공사업 1DIV 신문영사원입니다.</td>
													<td>2022/10/21</td>
													<td>읽음</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 테이블 끝 -->

									<!-- 페이징 -->
									<div class="row mt-3 d-flex justify-content-center">
										<ul class="pagination  pb-0 mb-0">
											<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
											<li class="page-item active" ><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">다음</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div><!-- end 받은 메일 -->
						
						<!-- 메일 자세히 보기 -->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<%@ include file="/WEB-INF/views/mail/detailmail.jsp"%>
							</div>
						</div><!-- end 메일 자세히 보기 -->
						
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>

</html>
