<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
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
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">받은 메일</h4>
									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class="col-1"><input class=" pr-0" type="checkbox">
														<div class="dropdown-m pl-0 ">
															<button class="dropbtn-m dropdown-toggle"></button>
															<div class="dropdown-content-m">
																<a href="#">전체선택</a> <a href="#">읽은메일</a> <a href="#">읽지않은메일</a>
																<a href="#">중요메일</a> <a href="#">중요표시안한메일</a>
															</div>
														</div></th>
													<th class="col-2">발신인</th>
													<th class="col-6">제목</th>
													<th class="col-2">날짜</th>
													<th class="col-1">읽음</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class=" pr-0" type="checkbox">
														<button>
															<img
																src="${pageContext.request.contextPath}/resources/images/star.png"
																style="width: 20px; height: 20px"></img>
														</button></td>
													<td>Photoshop</td>
													<td class="text-danger">28.76% <i
														class="ti-arrow-down"></i></td>
													<td><label class="badge badge-danger">Pending</label></td>
													<td>읽음</td>
												</tr>
												<tr>
													<td><input class=" pr-0" type="checkbox">
														<button>
															<img
																src="${pageContext.request.contextPath}/resources/images/star.png"
																style="width: 20px; height: 20px"></img>
														</button></td>
													<td>Flash</td>
													<td class="text-danger">21.06% <i
														class="ti-arrow-down"></i></td>
													<td><label class="badge badge-warning">In
															progress</label></td>
													<td>읽음</td>
												</tr>
												<tr>
													<td><input class=" pr-0" type="checkbox">
														<button>
															<img
																src="${pageContext.request.contextPath}/resources/images/star.png"
																style="width: 20px; height: 20px"></img>
														</button></td>
													<td>Premier</td>
													<td class="text-danger">35.00% <i
														class="ti-arrow-down"></i></td>
													<td><label class="badge badge-info">Fixed</label></td>
													<td>읽음</td>
												</tr>
												<tr>
													<td><input class=" pr-0" type="checkbox">
														<button>
															<img
																src="${pageContext.request.contextPath}/resources/images/star.png"
																style="width: 20px; height: 20px"></img>
														</button></td>
													<td>After effects</td>
													<td class="text-success">82.00% <i class="ti-arrow-up"></i></td>
													<td><label class="badge badge-success">Completed</label></td>
													<td>읽음</td>
												</tr>
												<tr>
													<td><input class=" pr-0" type="checkbox">
														<button>
															<img
																src="${pageContext.request.contextPath}/resources/images/star.png"
																style="width: 20px; height: 20px"></img>
														</button></td>
													<td>53275535</td>
													<td class="text-success">98.05% <i class="ti-arrow-up"></i></td>
													<td><label class="badge badge-warning">In
															progress</label></td>
													<td>읽음</td>
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
											<button class="btn btn-dark btn-sm">선택 삭제</button>
										</div>
									</div>
								</div>
							</div>
						</div>
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
