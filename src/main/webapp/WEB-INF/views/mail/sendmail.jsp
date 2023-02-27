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
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">보낸 메일</h4>
									<!-- 검색 태그 -->
									<div class="row mb-3 mt-5 mx-3">
										<div class="form-inline" style="border-bottom:1px solid #e9ecef;">
											<div class="px-3 py-1 ahover">
												<a href="" style="color:grey;">읽은메일</a>
											</div>
											<div class="px-3 py-1 ahover">
												<a href="" style="color:grey;">읽지않은메일</a>
											</div>
											<div class="px-3 py-1 ahover">
												<a href="" style="color:grey;">중요메일</a>
											</div>
											<div class="px-3 py-1 ahover">
												<a href="" style="color:grey;">중요표시안한메일</a>
											</div>
										</div>
									</div><!-- 검색 태그 -->
									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class=" form-inline col-1" style="border:none;">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</th>
													<th class="col-1">첨부</th>
													<th class="col-1">수신인</th>
													<th class="col-7">제목</th>
													<th class="col-2">날짜</th>
												</tr>
											</thead>
											<tbody>
												<tr class="text-muted">
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>신문영</td>
													<td><u>요청부탁드립니다.</u></td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>장영은</td>
													<td>공공사업 1DIV 장영은 사원입니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>한송민</td>
													<td>화면설계서 입니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>장영은</td>
													<td>화면 설계서입니다. 확인부탁드립니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>한송민</td>
													<td>자료요쳥서입니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>이유진</td>
													<td>결제 요청서입니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline  text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>안태환</td>
													<td>이번주 들어온 문의내용 정리입니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>이지호</td>
													<td>SRM 화면 설계서입니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>장영은</td>
													<td>청구결제서 요청합니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline text-primary"></i>
														</button>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td><i class="mdi mdi-arrow-right text-primary"></i>장현</td>
													<td>front 요청서입니다.</td>
													<td>2023/02/21</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 테이블 끝 -->
									<!-- 하단 버튼 -->
									<div class="row form-inline m-3">
										<div class="col-md-11"></div>
										<div class="col-md-1 col-12">
											<button class="btn btn-danger btn-sm">선택삭제</button>
										</div>
									</div><!-- 하단 버튼 -->

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
