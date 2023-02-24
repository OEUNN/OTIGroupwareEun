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
		        				<p class="card-title mb-3">검색</p>
		        				<div class="card-body mb-3" style="box-shadow: 0px 0px 0px white;">
		        					<div class="row">
		        						<div class="col-4">
			        						<div class="card" style="border-radius:8px; border: 2px solid #4747A1;">
												<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
													<a class="font-weight-bold text-decoration-none" data-target="#filter_by_div" data-toggle="collapse" style="color: #4747A1;">부서</a>
													<div class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">공공사업1DIV</div>
												</div>
			        							<div id="filter_by_div" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
				        							<div class="form-check font-weight-bold text-info">
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
		        						<div class="col-4">
			        						<div class="card" style="border-radius:8px; border: 2px solid #4747A1;">
												<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
													<a class="font-weight-bold text-decoration-none" style="color: #4747A1;">기준날짜</a>
													<div class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">상신</div>
												</div>
			        						</div>
		        						</div>
		        						<div class="col-4">
		        							<div class="card" style="border-radius:8px; border: 2px solid #4747A1;">
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
	        					<div class="row">
	        						<div class="col">
		        						<div class="card">
		        							<div class="card-body d-flex" style="box-shadow: 0px 0px 0px white;">
		        								<div class="input-group mr-3" style="border-radius: 18px; border: 1px solid #4B49AC;">
													<div class="input-group-prepend hover-cursor mx-3" id="navbar-search-icon">
														<span class="input-group-text" id="search" style="background: transparent; border: 0; color: #000; padding: 0;">
														<i class="icon-search" style="font-size: 1.25rem; color: #6C7383;"></i>
														</span>
													</div>
													<div class="align-self-center">
														<div class="badge badge-primary font-weight-bold">
															제목
															<span class="mx-1"><i class="mdi mdi-close"></i></span>
														</div>
														<div class="badge badge-primary font-weight-bold">
															기안자
															<span class="mx-1"><i class="mdi mdi-close"></i></span>
														</div>
														<div class="badge badge-primary font-weight-bold">
															결재자
															<span class="mx-1"><i class="mdi mdi-close"></i></span>
														</div>
													</div>
													<input type="text" class="form-control mx-4" id="navbar-search-input" placeholder="검색할 내용 입력" aria-label="search" aria-describedby="search" style="margin-left: .7rem; font-size: 1.25rem; color: #6C7383; background: transparent; border: 0; color: #000; padding: 0;">
												</div>
												<button type="submit" class="font-weight-bold btn btn-primary" style="min-width: fit-content;">검색</button>
		        							</div>
		        							<div class="card-body d-flex" style="padding-top: 0; box-shadow: 0px 0px 0px white;">
												<div class="mr-3 align-self-center">
													<div class="badge badge-primary font-weight-bold">
														제목
														<span class="mx-1"><i class="mdi mdi-check"></i></span>
													</div>
													<div class="badge badge-primary font-weight-bold">
														기안자
														<span class="mx-1"><i class="mdi mdi-check"></i></span>
													</div>
													<div class="badge badge-primary font-weight-bold">
														결재자
														<span class="mx-1"><i class="mdi mdi-check"></i></span>
													</div>
												</div>
		        							</div>
		        						</div>
	        						</div>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
	        	</div>
	        	<div class="row">
            		<div class="col-md-12 grid-margin">
						<div class="card grid-margin">
							<div class="card-body">
							<p class="card-title mb-0">결재대기함</p>
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
												<th class="pl-0  pb-2 border-bottom">문서 번호</th>
												<th class="border-bottom pb-2">제목</th>
												<th class="border-bottom pb-2">기안자</th>
												<th class="border-bottom pb-2">부서</th>
												<th class="border-bottom pb-2">직급</th>
												<th class="border-bottom pb-2">상신날짜</th>
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
												<td class="pl-0">03-333</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">01-111</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">03-333</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">01-111</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">03-333</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">01-111</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">03-333</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">01-111</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
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
												<td class="pl-0">03-333</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												<td class="pl-0">01-111</td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-warning mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
											</tr>
										</tbody>
									</table>
									<div class="mt-5">
										<span class="btn btn-success btn-sm">선택 승인</span>
										<span class="btn btn-danger btn-sm">선택 반려</span>
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