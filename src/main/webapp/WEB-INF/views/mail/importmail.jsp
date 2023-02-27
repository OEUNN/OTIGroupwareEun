<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		<script>
        function popup(){
            var url = "importpopup";
            var name = "import popup";
            var option = "width = 500, height = 250, top = 100, left = 200, location = no, resizable=no, scrollbars=no  "
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
					<!-- import and send mail -->
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">중요 메일함</h4>
									<!-- 검색 버튼 -->
									<div class="row mb-3 mt-5 mx-3">
										<div class="form-inline" style="border-bottom:1px solid #e9ecef;">
											<div class="px-3 py-1 ahover">
												<a href="" style="color:grey;">읽은메일</a>
											</div>
											<div class="px-3 py-1 ahover">
												<a href="" style="color:grey;">읽지않은메일</a>
											</div>
										</div>
									</div><!-- 검색 버튼 -->
									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class=" form-inline col-1" style="border:none;">
														<div class="form-check font-weight-bold">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</th>
													<th class="col-1">첨부</th>
													<th class="col-1">ID</th>
													<th class="col-7">제목</th>
													<th class="col-2">날짜</th>
												</tr>
											</thead>
											<tbody>
												<tr class="text-muted">
													<td class="form-inline py-1" >
														<div class="form-check font-weight-bold">
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
													<td><u>요청부탁드립니다.</u></td>
													<td>2023/02/24</td>
												</tr>
												<tr class="text-muted">
													<td class="form-inline py-1" >
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
													<td><i class="mdi mdi-arrow-left text-primary"></i>신문영</td>
													<td><u>2월24일자 공지사항입니다.</u></td>
													<td>2023/02/24</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td><i class="mdi mdi-arrow-left text-primary"></i>한송민</td>
													<td>대법원 요구사항 분석사항입니다.</td>
													<td>2023/02/21</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td>긴급!!빠른답신 부탁드립니다.</td>
													<td>2023/02/11</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td><i class="mdi mdi-arrow-right text-primary"></i>안한길</td>
													<td>답신부탁드립니다.</td>
													<td>2023/02/02</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td>로그인 기능입니다.</td>
													<td>2023/01/11</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td><i class="mdi mdi-arrow-right text-primary"></i>한지민</td>
													<td>2월10일까지 답신해주셔야합니다.</td>
													<td>2023/01/08</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td>법카 사용내역서 제출 부탁드립니다.</td>
													<td>2023/01/02</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td><i class="mdi mdi-arrow-right text-primary"></i>공유</td>
													<td>도깨비 좋아하십니까?</td>
													<td>2023/01/02</td>
												</tr>
												<tr>
													<td class="form-inline py-1" >
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
													<td><i class="mdi mdi-arrow-right text-primary"></i>지은탁</td>
													<td>도깨비 싫습니다</td>
													<td>2022/12/31</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 테이블 끝 -->
									
									<!-- 하단 버튼 -->
									<div class="row form-inline m-3">
										<div class="col-md-11"></div>
										<div class="col-md-1 col-12 ">
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
						</div><!-- End import mail -->
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
