<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script>
	$(function(){
		$('#datepicker').datepicker({
		});	
	});
	</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
	<style type="text/css">
	.collapse, .collapsing {
		box-shadow: 0px 0px 0px white !important;
	}
	
	.table th, .jsgrid .jsgrid-table th,
	.table td,
	.jsgrid .jsgrid-table td {
		padding: 0.525rem 1.375rem;
	}
	</style>
</head>

<body >
<div class="container-scroller">

	<!-- partial:../../partials/_navbar.jsp -->
	<%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
	
	<!-- partial -->
	<div class="container-fluid page-body-wrapper">
	
	  	<!-- partial:../../partials/_settings-panel.jsp -->
		<!-- partial -->
		
		<!-- partial:../../partials/_sidebar.jsp -->
		<%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
		<!-- partial -->
			
		<!-- ***** content-start ***** -->
		<div class="main-panel">
	        <div class="content-wrapper">
	        	<div class="row">
	        		<div class="col-md-12 grid-margin">
						<div class="card gird-margin shadow-2">
		        			<div class="card-body">
		        				<p class="card-title mb-3">임시저장함</p>
		        				<div class="card gird-margin shadow-2 my-3" style="background-color: #e7e7ff;">
			        			<div class="card-body">
			        				<div class="card-body" style="box-shadow: 0px 0px 0px white; padding-top: 0;">
			        					<div class="row">
			        						<div class="col-3">
				        						<div class="card" style="border-radius:8px;">
													<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
														<a class="prevent-collapse font-weight-bold text-decoration-none" data-target="#filter_by_status" data-toggle="collapse" style="color: #4747A1;">결재상태</a>
														<div class="flex-grow-1" style="text-align: end; color: black;">승인</div>
													</div>
				        							<div id="filter_by_status" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
					        							<div class="form-check font-weight-bold" style="color: black;">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio" checked>승인
															</label>
														</div>
														<div class="form-check">
															<label class="form-check-label text-muted">
																<input type="checkbox" class="form-check-input" name="optradio">진행
															</label>
														</div>
														<div class="form-check disabled">
															<label class="form-check-label text-muted">
																<input type="checkbox" class="form-check-input" name="optradio">반려
															</label>
														</div>
														<div class="form-check disabled">
															<label class="form-check-label text-muted">
																<input type="checkbox" class="form-check-input" name="optradio">회수
															</label>
														</div>
				        							</div>
				        						</div>
			        						</div>
			        						<div class="col-3">
				        						<div class="card" style="border-radius:8px;">
													<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
														<a class="font-weight-bold text-decoration-none" data-target="#filter_by_div" data-toggle="collapse" style="color: #4747A1;">부서</a>
														<div class="flex-grow-1" style="text-align: end; color: black;">공공사업1DIV</div>
													</div>
				        							<div id="filter_by_div" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
					        							<div class="form-check font-weight-bold" style="color: black;">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio" checked>공공사업1DIV
															</label>
														</div>
														<div class="form-check">
															<label class="form-check-label text-muted">
																<input type="checkbox" class="form-check-input" name="optradio">공공사업2DIV
															</label>
														</div>
														<div class="form-check disabled">
															<label class="form-check-label text-muted">
																<input type="checkbox" class="form-check-input" name="optradio">경영지원부서
															</label>
														</div>
				        							</div>
				        						</div>
			        						</div>
			        						<div class="col-2">
				        						<div class="card" style="border-radius:8px;">
													<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
														<a class="font-weight-bold text-decoration-none" data-target="#filter_by_date" data-toggle="collapse" style="color: #4747A1;">기준날짜</a>
														<div class="flex-grow-1" style="text-align: end; color: black;">상신</div>
													</div>
				        							<div id="filter_by_date" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
					        							<div class="form-check font-weight-bold" style="color: black;">
															<label class="form-check-label">
																<input type="radio" class="form-check-input" name="optradio" checked>상신
															</label>
														</div>
														<div class="form-check disabled">
															<label class="form-check-label text-muted">
																<input type="radio" class="form-check-input" name="optradio">종료
															</label>
														</div>
				        							</div>
				        						</div>
			        						</div>
			        						<div class="col-4">
			        							<div class="card" style="border-radius:8px;">
					        						<div class="input-daterange input-group" id="datepicker">
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input type="text" class="input-sm form-control text-info font-weight-bold" name="start" style="border:0px; text-align: right;"/>
													    <span class="input-group-addon text-primary font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input type="text" class="input-sm form-control text-info font-weight-bold" name="end" style="border:0px; text-align: right;"/>
													</div>
												</div>
			        						</div>
			        					</div>
		        					</div>
		        					<div class="row py-0" style="padding: 1.25rem;">
		        						<div class="col-2">
			        						<div class="card" style="border-radius:8px;">
												<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
													<a class="font-weight-bold text-decoration-none" data-target="#searchparameter" data-toggle="collapse" style="color: #4747A1;">검색조건</a>
												</div>
			        							<div id="searchparameter" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
				        							<div class="form-check font-weight-bold text-info">
														<div class="d-flex">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio" checked/>
															</label>
															<div class="badge badge-warning font-weight-bold">제목</div>
														</div>
													</div>
													<div class="form-check">
														<div class="d-flex">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio" checked/>
															</label>
															<div class="badge badge-warning font-weight-bold">기안자</div>
														</div>
													</div>
													<div class="form-check disabled">
														<div class="d-flex">
															<label class="form-check-label">
																<input type="checkbox" class="form-check-input" name="optradio" checked/>
															</label>
															<div class="badge badge-warning font-weight-bold">결재자</div>
														</div>
													</div>
			        							</div>
			        						</div>
		        						</div>
		        						<div class="col-8">
		        							<div class="d-flex">
		        								<div class="input-group w-75" style="border-radius: 18px; background-color: white;">
													<div class="input-group-prepend hover-cursor mx-3" id="navbar-search-icon">
														<span class="input-group-text" id="search" style="background: transparent; border: 0; color: #000; padding: 0;">
														<i class="icon-search" style="font-size: 1.25rem; color: #6C7383;"></i>
														</span>
													</div>
													<div class="align-self-center">
														<div class="badge badge-warning font-weight-bold">
															제목
															<span class="mx-1"><i class="mdi mdi-close"></i></span>
														</div>
														<div class="badge badge-warning font-weight-bold">
															기안자
															<span class="mx-1"><i class="mdi mdi-close"></i></span>
														</div>
														<div class="badge badge-warning font-weight-bold">
															결재자
															<span class="mx-1"><i class="mdi mdi-close"></i></span>
														</div>
													</div>
													<input type="text" class="form-control mx-4" id="navbar-search-input" placeholder="검색할 내용 입력" aria-label="search" aria-describedby="search" style="margin-left: .7rem; font-size: 1.25rem; color: #6C7383; border: 0; color: #000; padding: 0;">
												</div>
												<button type="submit" class="font-weight-bold btn btn-md btn-warning ml-2">검색</button>
		        							</div>
		        						</div>
		        					</div>
		        				</div>
		        			</div>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</th>
												<th class="pl-0 pb-2 border-bottom">순번</th>
												<th class="border-bottom pb-2">제목</th>
												<th class="border-bottom pb-2">작성날짜</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">10</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>2023/02/19</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">9</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
														</p>
													</div>
												</td>
												<td>2023/02/18</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">8</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
														</p>
													</div>
												</td>
												<td>2023/02/17</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">7</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
														</p>
													</div>
												</td>
												<td>2023/02/16</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">6</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">오상식</span>
														</p>
													</div>
												</td>
												<td>2023/02/15</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">5</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
														</p>
													</div>
												</td>
												<td>2023/02/14</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">4</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
														</p>
													</div>
												</td>
												<td>2023/02/13</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">3</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
														</p>
													</div>
												</td>
												<td>2023/02/12</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">2</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">오상식</span>
														</p>
													</div>
												</td>
												<td>2023/02/11</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">1</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">임시저장</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2">장그래</span>
														</p>
													</div>
												</td>
												<td>2023/02/10</td>
											</tr>
										</tbody>
									</table>
									<div class="mt-2">
										<div class="d-flex justify-content-end">
											<span class="btn btn-danger btn-sm">선택 삭제</span>
										</div>
										<ul class="pagination justify-content-center pb-0 mb-0">
											<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
											<li class="page-item active" ><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">다음</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- ***** content-end ***** -->
			
		<!-- partial:../../partials/_footer.jsp -->
		<%@ include file="/WEB-INF/views/common/_footer.jsp" %>
		<!-- partial -->
		
		</div>
		<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
</body>

</html>