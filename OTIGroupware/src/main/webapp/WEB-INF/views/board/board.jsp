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
									<div class="card-title row container-fluid">
										<h4 class="col-1 card-title">사내 공지</h4>
										<div class="col-10"></div>
										<button class="col-1 btn btn-md btn-primary" style="text-align: right;">게시글 쓰기</button>
									</div>
									<!-- Start Search -->
									<form class="form-inline my-3">
										<select class="mx-5 board-select"
											style="border: 1px solid #CED4DA; border-radius: 10px;">
											<option>전체</option>
											<option>제목</option>
											<option>작성자</option>
											<option>작성 날짜</option>
										</select> 검색어&ensp; <input class="mr-5" type="text"
											style="border: 1px solid #CED4DA; border-radius: 10px;">
										작성기간&ensp; <input type="date"
											style="border: 1px solid #CED4DA; border-radius: 10px;">
										&ensp; ~ &ensp; <input class="mr-3" type="date"
											style="border: 1px solid #CED4DA; border-radius: 10px;">
										<input type="submit"
											class="mx-5 btn btn-sm btn-secondary btn-rounded" value="검색"
											style="width: 100px;">
									</form>
									<!-- End Search -->
									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class="col-1"><input type="checkbox"></th>
													<th class="col-1">첨부</th>
													<th class="col-6">제목</th>
													<th class="col-1">작성자</th>
													<th class="col-2">작성날짜</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="checkbox"></td>
													<td><img
														src="${pageContext.request.contextPath}/resources/images/attach.png"
														style="width: 20px; height: 20px"></img></td>
													<td class="text-danger">28.76% <i
														class="ti-arrow-down"></i>
													</td>
													<td><label class="badge badge-danger">Pending</label></td>
													<td>읽음</td>
												</tr>
												<tr>
													<td><input type="checkbox"></td>
													<td><img
														src="${pageContext.request.contextPath}/resources/images/attach.png"
														style="width: 20px; height: 20px"></img></td>
													<td class="text-danger">21.06% <i
														class="ti-arrow-down"></i></td>
													<td><label class="badge badge-warning">In
															progress</label></td>
													<td>20221104</td>
												</tr>
												<tr>
													<td><input type="checkbox"></td>
													<td><img
														src="${pageContext.request.contextPath}/resources/images/attach.png"
														style="width: 20px; height: 20px"></img></td>
													<td class="text-danger">35.00% <i
														class="ti-arrow-down"></i></td>
													<td><label class="badge badge-info">Fixed</label></td>
													<td>안읽음</td>
												</tr>
												<tr>
													<td><input type="checkbox"></td>
													<td><img
														src="${pageContext.request.contextPath}/resources/images/attach.png"
														style="width: 20px; height: 20px"></img></td>
													<td class="text-success">82.00% <i class="ti-arrow-up"></i></td>
													<td><label class="badge badge-success">Completed</label></td>
													<td>안읽음</td>
												</tr>
												<tr>
													<td><input type="checkbox"></td>
													<td><img
														src="${pageContext.request.contextPath}/resources/images/attach.png"
														style="width: 20px; height: 20px"></img></td>
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
											<button class="btn btn-dark btn-sm" onclick="popup()">선택
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
