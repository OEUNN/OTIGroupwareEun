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
													<a class="font-weight-bold text-decoration-none" data-target="#filter_by_status" data-toggle="collapse" style="color: #4747A1;">결재상태</a>
													<div class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">승인</div>
												</div>
			        							<div id="filter_by_status" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
				        							<div class="form-check font-weight-bold text-info">
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
		        						<div class="col-4">
			        						<div class="card" style="border-radius:8px; border: 2px solid #4747A1;">
												<div class="card-header bg-white d-flex" style="border-radius:8px; border-bottom: 0px;">
													<a class="font-weight-bold text-decoration-none" data-target="#filter_by_date" data-toggle="collapse" style="color: #4747A1;">기준날짜</a>
													<div class="flex-grow-1 font-weight-bold text-info" style="text-align: end; color: #7DA0FA;">상신</div>
												</div>
			        							<div id="filter_by_date" class="card-body collapse" style="border-radius:8px; padding: 0; padding-left: 1.25rem; padding-right: 1.25rem;">
				        							<div class="form-check font-weight-bold text-info">
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
							<p class="card-title mb-0">기안함</p>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
											<tr>
												<th class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</th>
												<th class="pl-0  pb-2 border-bottom">문서 번호</th>
												<th class="border-bottom pb-2">결재상태</th>
												<th class="border-bottom pb-2">제목</th>
												<th class="border-bottom pb-2">상신날짜</th>
												<th class="border-bottom pb-2">종료날짜</th>
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
												<td><div class="badge badge-success font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-check-circle-outline d-flex align-self-center mr-1"></i><span>승인</span></div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>2023/02/19</td>
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
												<td><div class="badge badge-warning font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-file-document d-flex align-self-center mr-1"></i><span>진행</span></div></td>
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
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">02-222</td>
												<td><div class="badge badge-danger font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-block-helper d-flex align-self-center mr-1"></i><span>반려</span></div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-danger mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>2023/02/19</td>
												<td>2023/02/20</td>
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
												<td><div class="badge badge-secondary font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-replay d-flex align-self-center mr-1"></i><span>회수</span></div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2" style="text-decoration: line-through;">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2" style="text-decoration: line-through;">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2" style="text-decoration: line-through;">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2" style="text-decoration: line-through;">김부련</span>
														</p>
													</div>
												</td>
												<td>2023/02/19</td>
												<td>N/A</td>
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
												<td><div class="badge badge-success font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-check-circle-outline d-flex align-self-center mr-1"></i><span>승인</span></div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>2023/02/19</td>
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
												<td><div class="badge badge-warning font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-file-document d-flex align-self-center mr-1"></i><span>진행</span></div></td>
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
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input" name="optradio">
														</label>
													</div>
												</td>
												<td class="pl-0">02-222</td>
												<td><div class="badge badge-danger font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-block-helper d-flex align-self-center mr-1"></i><span>반려</span></div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-success mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-danger mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>2023/02/19</td>
												<td>2023/02/20</td>
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
												<td><div class="badge badge-secondary font-weight-bold d-flex" style="width: fit-content;"><i class="mdi mdi-replay d-flex align-self-center mr-1"></i><span>회수</span></div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2" style="text-decoration: line-through;">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-muted mr-2" style="text-decoration: line-through;">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2" style="text-decoration: line-through;">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2" style="text-decoration: line-through;">김부련</span>
														</p>
													</div>
												</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
										</tbody>
									</table>
									<div class="mt-5">
										<span class="btn btn-danger btn-sm">선택 삭제</span>
										<span class="btn btn-warning btn-sm">선택 회수</span>
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