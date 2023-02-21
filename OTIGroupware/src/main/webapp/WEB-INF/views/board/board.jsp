<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css"/>
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

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- import and send mail -->
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title d-flex justify-content-between align-items-start">
										<span>사내 공지</span> <span>
											<a class="btn btn-md btn-primary mx-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;" href="<c:url value='/writeboard'/>">
												<span class="mdi mdi-lead-pencil align-middle"></span> 
												<span>게시글 쓰기</span>
											</a>
										</span>
									</p>
									<!-- Start Search -->
									<form class="form-inline my-3">
										<select class="mx-5 board-select form-control">
											<option>전체</option>
											<option>제목</option>
											<option>작성자</option>
											<option>작성 날짜</option>
										</select> 
										
										검색어&ensp; 
										<input class="mr-5 form-control" type="text">
										작성기간&ensp; 
										<input type="date" class="form-control">
										&ensp; ~ &ensp; 
										<input class="mr-3 form-control" type="date" >
										<button class="btn btn-md btn-primary mx-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
												<span>검색</span>
											</button>
									</form>
									<!-- End Search -->
									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class="col-1">
														<div class="form-check font-weight-bold text-info">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
													</th>
													<th class="col-1">첨부</th>
													<th class="col-6">제목</th>
													<th class="col-1">작성자</th>
													<th class="col-2">작성날짜</th>
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
													<td class="text-danger">28.76% <i
														class="ti-arrow-down"></i>
													</td>
													<td><label class="badge badge-danger">Pending</label></td>
													<td>읽음</td>
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
													<td class="text-danger">21.06% <i
														class="ti-arrow-down"></i></td>
													<td><label class="badge badge-warning">In
															progress</label></td>
													<td>20221104</td>
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
													<td class="text-danger">35.00% <i
														class="ti-arrow-down"></i></td>
													<td><label class="badge badge-info">Fixed</label></td>
													<td>안읽음</td>
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
													<td class="text-success">82.00% <i class="ti-arrow-up"></i></td>
													<td><label class="badge badge-success">Completed</label></td>
													<td>안읽음</td>
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
													<td class="text-success">98.05% <i class="ti-arrow-up"></i></td>
													<td><label class="badge badge-warning">In
															progress</label></td>
													<td>안읽음</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 테이블 끝 -->

									<!-- 페이징 -->
									<div class="row mt-3">
										<div class="col-3"></div>
										<div class="col" style="text-align: center;">처음 이전 1 2 3
											4 5 다음 끝</div>
										<div class="col-3"></div>
									</div>
									<div class="row">
										<div class="col-2">
											<button class="btn btn-outline-danger btn-sm" onclick="popup()">선택
												삭제</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End import and send mail -->
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
