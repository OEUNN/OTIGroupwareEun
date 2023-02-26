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
		  padding: 0.225rem 1.375rem;
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
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">임시 보관함</h4>
									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class=" form-inline col-1" style="border:none;">
														<div class="form-check font-weight-bold text-info ">
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
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-left text-primary"></i>
														한지민
													</td>
													<td>어떤 내용을 써야할까요?</td>
													<td>2023/02/23</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-left text-primary"></i>
														윤하
													</td>
													<td>답신 부탁드립니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														정우성
													</td>
													<td>이번주 결제내역입니다.</td>
													<td>2023/02/14</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														공유
													</td>
													<td>공공사업 프로젝트 초안입니다.</td>
													<td>2023/01/30</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														정재영
													</td>
													<td>휴가 신청을 원합니다.</td>
													<td>2023/01/26</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														유재석
													</td>
													<td>문의사항입니다.</td>
													<td>2023/01/21</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														강호동
													</td>
													<td>과장님 좀 봐주세요..</td>
													<td>2023/01/17</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														이수근
													</td>
													<td>대리님 일 안하십니까?</td>
													<td>2023/01/11</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-right text-primary"></i>
														김희철
													</td>
													<td>삼각함수는 무엇일까요</td>
													<td>2023/01/09</td>
												</tr>
												<tr>
													<td>
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</td>
													<td><i class="h3 mdi mdi-paperclip text-primary"></i></td>
													<td>
														<i class="mdi mdi-arrow-left text-primary"></i>
														이장훈
													</td>
													<td>허허허허허</td>
													<td>2023/01/22</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 테이블 끝 -->
									
									<!-- 하단 버튼 -->
									<div class="row form-inline m-3">
										<div class="col-md-11"></div>
										<div class="col-md-1 col-12">
											<button class="btn btn-outline-danger btn-sm">선택삭제</button>
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
						</div><!-- end temp mail -->
						
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
