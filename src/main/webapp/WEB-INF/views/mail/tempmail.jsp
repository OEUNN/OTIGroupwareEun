<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css" />
		<script>
        function popup(){
            var url = "temppopup";
            var name = "temp popup";
            var option = "width = 500, height = 300, top = 100, left = 200, location = no, resizable=no, scrollbars=no  "
            window.open(url, name, option);
        }
		</script>
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
						<!-- temp mail -->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">임시 보관함</h4>
									<div class="row form-inline mx-3">
										<div>
											<button class="btn btn-outline-danger btn-sm" onclick="popup()">선택삭제</button>
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
														<div class="form-check font-weight-bold text-info ">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</th>
													<th class="col-2">발신인</th>
													<th class="col-4">제목</th>
													<th class="col-3">날짜</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-left text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-left text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
												<tr>
													<td class="form-inline">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<button>
															<i class="h3 mdi mdi-star-outline text-primary"></i>
														</button></td>
													<td>
														<i class="mdi mdi-arrow-left text-primary"></i>
														Photoshop
													</td>
													<td>28.76%</td>
													<td>2023/02/22</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 테이블 끝 -->

									<!-- 페이징 -->
									<div class="row mt-3 d-flex justify-content-center">
										<ul class="pagination  pb-0 mb-0">
											<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item active" ><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div><!-- end temp mail -->
						
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
