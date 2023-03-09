<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
									<h4 class="card-title">받은 메일</h4>
									<!-- 검색 태그 -->
									<div class="row mb-3 mt-5 mx-3">
										<div class="form-inline" style="border-bottom:1px solid #e9ecef;">
											<div class="px-3 py-1 ahover" >
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
													<th class="col-1">발신인</th>
													<th class="col-7">제목</th>
													<th class="col-2">날짜</th>
												</tr>
											</thead>
												<tbody>
													<c:forEach items="${receivedmail}" var="recd">
														<c:if test="${recd.recdMailReadReceiptYN == 'Y'}">
															<tr class="text-muted">
														</c:if>
														<c:if test="${recd.recdMailReadReceiptYN == 'N'}">
															<tr>
														</c:if>
															<td class="form-inline py-1">
																<div class="form-check font-weight-bold text-info">
																	<label class="form-check-label">
																		<input type="checkbox" class="form-check-input" name="optradio">
																	</label>
																</div>
																<button>
																	<c:if test="${recd.recdMailImportanceYN == 'Y'}">
																		<i class="h3 mdi mdi-star text-primary"></i>
																	</c:if>
																	<c:if test="${recd.recdMailImportanceYN == 'N'}">
																		<i class="h3 mdi mdi-star-outline text-primary"></i>
																	</c:if>
																</button>
															</td>
															<td>
																<c:if test="${recd.fileYN == Y}">
																	<i class="h3 mdi mdi-paperclip text-primary"></i>
																</c:if>
															</td>
															<td><i class="mdi mdi-arrow-left text-primary"></i>${recd.empId}</td>
															<td>${recd.sendMailTitle}</td>
															
															<td>
																<fmt:formatDate pattern="MM월 dd일   HH:mm:ss" value="${recd.recdMailDate}"/>
															</td>
														</tr>
													</c:forEach>
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
									<div class="row mt-5 d-flex justify-content-center">
										<ul class="pagination pb-0 mb-0">
											<!-- 이전 -->
											<c:if test="${pager.groupNo > 1}">
												<li class="page-item disabled">
													<a class="page-link" href="<c:url value=''/>">이전</a>
												</li>
											</c:if>
											<c:forEach var="i" begin="${pager.startPageNo}"
													end="${pager.endPageNo}" step="1">
												<!-- 선택할 페이지 -->
												<c:if test="${pager.pageNo != i}">
													<li class="page-item"><a class="page-link"
														href="<c:url value=''/>">${i}</a>
													</li>
												</c:if>
												<!-- 현재페이지 -->
												<c:if test="${pager.pageNo == i}">
													<li class="page-item active"><a class="page-link">${i}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${pager.groupNo < pager.totalGroupNo}">
												<li class="page-item"><a class="page-link"
													href="<c:url value=''/>">다음</a></li>
											</c:if>
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
