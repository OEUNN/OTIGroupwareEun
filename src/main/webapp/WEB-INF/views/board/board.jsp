<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css"/>
		<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script>
			$(function(){
				$('#datepicker').datepicker({
				});	
			});
		</script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
		<style>
			.table th, .jsgrid .jsgrid-table th,
			.table td,
			.jsgrid .jsgrid-table td {
			  padding: 0.525rem 1.375rem;
			}
			.dropdown-toggle::after{
				content:none;
			}
			collapse, .collapsing {
				box-shadow: 0px 0px 0px white !important;
			}
		</style>
	</head>

<body>
	<div class="container-scroller ">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<!-- main title -->
									<div class="row">
										<div class="col-md-12 grid-margin">
											<div class="row  d-flex justify-content-between align-items-start">
												<h3 class="card-title">사내 공지</h3>
												<a type="submit" class="btn btn-md btn-primary mx-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;" href="<c:url value='/writeboard'/>">
													<span class="mdi mdi-lead-pencil align-middle"></span> 
													<span>게시글 쓰기</span>
												</a>
											</div>
										</div>
									</div><!-- 메인 title -->
									<!-- Start search box -->
									<form>
										<div class="row form-inline mb-3">
											<div class=" form-group ml-3">
												<div class="card" style="border-radius:18px; border: 1px solid #4747A1;">
					        						<div class="input-daterange input-group" id="datepicker" style="border:none;">
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input type="text" class="input-sm form-control" name="start" style="border:0px; text-align: right;"/>
													    <span class="input-group-addon text-primary font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input type="text" class="input-sm form-control" name="end" style="border-radius:18px;border:0px; text-align: right;"/>
													</div>
												</div>
											</div>
										</div>
										<div class="row  form-inline">
											<div class="form-group">
												<label class="h3 my-auto mr-1">카테고리</label>
												<div class="btn dropdown-toggle d-flex form-control" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"
													style="font-weight:bold;border-radius: 18px; border: 1px solid #4B49AC;">
													<i class="text-primary mdi mdi-menu-down"></i> 
													<input class="selectmenu my-auto" type="text" value="" style="border:none;width:120px;" readonly>
												</div>
												<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
													<h6 class="dropdown-item" id="select-1" onclick="select(1)">전체</h6>
													<h6 class="dropdown-item" id="select-2" onclick="select(2)">제목</h6> 
													<h6 class="dropdown-item" id="select-3" onclick="select(3)">작성자</h6>
												</div>
												<script>
											        function select(No){
											        	var x = document.getElementById("select-" + No).innerText;
											        	$(".selectmenu").val(x);
											        }
												</script>
											</div>
											<div class="form-group">
												<label class="mr-2 h3 my-auto ml-3">검색어</label>
												<input class="form-control" type="text" style="border-radius: 18px; border: 1px solid #4B49AC;">
											</div>
											<div class="ml-5 form-group">
												<button class="btn btn-md btn-primary" style="font-family: LeferiBaseType-RegularA; font-weight:700;">
													<span>검색</span>
												</button>
											</div>
										</div>
									</form><!-- End search box -->
									
									<div class="row form-inline mx-3 my-3">
										<div>
											<button class="btn btn-outline-danger btn-sm" onclick="popup()">선택삭제</button>
										</div>
									</div>
									
									<!-- 테이블 -->
									<div class="table-responsive row">
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
													<th class="col-5">제목</th>
													<th class="col-2">작성자</th>
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
													<td >28.76%</td>
													<td> Pending</td>
													<td>2022/11/11</td>
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
													<td >28.76%</td>
													<td> Pending</td>
													<td>2022/11/11</td>
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
													<td >28.76%</td>
													<td> Pending</td>
													<td>2022/11/11</td>
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
													<td >28.76%</td>
													<td> Pending</td>
													<td>2022/11/11</td>
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
													<td >28.76%</td>
													<td> Pending</td>
													<td>2022/11/11</td>
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
						</div>
						<!-- 게시글 자세히 보기 -->
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<%@ include file="/WEB-INF/views/board/detailboard.jsp"%>
							</div>
						</div><!-- end 게시글 자세히 보기 -->
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
