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
													<th class=" form-inline " style="border:none;">
														<div class="form-check font-weight-bold text-info ">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio">
															</label>
														</div>
														<div class="dropdown">
															<button class="dropdown-toggle" 
																 id="dropdownMenuIconButton2"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">
															</button>
															<div class="dropdown-menu"
																aria-labelledby="dropdownMenuIconButton2">
																<a class="dropdown-item" href="#">전체선택</a> <a
																	class="dropdown-item" href="#">읽은메일</a> <a
																	class="dropdown-item" href="#">읽지않은메일</a>
																<a class="dropdown-item" href="#">중요메일</a>
																<a class="dropdown-item" href="#">중요표시안한메일</a>
															</div>
														</div>
													</th>
													<th class="col-2"><div class="h4">발신인</div></th>
													<th class="col-6"><div class="h4">제목</div></th>
													<th class="col-2"><div class="h4">날짜</div></th>
													<th class="col-1"><div class="h4">읽음</div></th>
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
													<td><div class="h4">장영은</div></td>
													<td><div class="h4">28.76%</div></td>
													<td><div class="h4">2023/02/21</div></td>
													<td><div class="h4">읽음</div></td>
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
													<td><div class="h4">장영은</div></td>
													<td><div class="h4">28.76%</div></td>
													<td><div class="h4">2023/02/21</div></td>
													<td><div class="h4">읽음</div></td>
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
													<td><div class="h4">장영은</div></td>
													<td><div class="h4">28.76%</div></td>
													<td><div class="h4">2023/02/21</div></td>
													<td><div class="h4">읽음</div></td>
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
													<td><div class="h4">장영은</div></td>
													<td><div class="h4">28.76%</div></td>
													<td><div class="h4">2023/02/21</div></td>
													<td><div class="h4">읽음</div></td>
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
													<td><div class="h4">장영은</div></td>
													<td><div class="h4">28.76%</div></td>
													<td><div class="h4">2023/02/21</div></td>
													<td><div class="h4">읽음</div></td>
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
											<button class="btn btn-outline-danger btn-sm">선택 삭제</button>
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
