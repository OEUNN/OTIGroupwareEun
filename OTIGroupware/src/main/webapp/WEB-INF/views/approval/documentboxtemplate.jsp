<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
</head>

<body>
<div class="container-scroller">

	<!-- partial:../../partials/_navbar.jsp -->
	<%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
	
	<!-- partial -->
	<div class="container-fluid page-body-wrapper">
	
	  	<!-- partial:../../partials/_settings-panel.jsp -->
		<%@ include file="/WEB-INF/views/common/_settings-panel.jsp" %>
		<!-- partial -->
		
		<!-- partial:../../partials/_sidebar.jsp -->
		<%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
		<!-- partial -->
			
		<!-- ***** content-start ***** -->
		<div class="main-panel">
	        <div class="content-wrapper">
	        	<div class="row">
	        		<div class="col-md-12 grid-margin">
	        			<div class="card gird-margin shadow-2" style="box-shadow: 3px 3px 6px #cdd1e1;">
	        				<div class="card-body">
	        					<p class="card-title mb-3">검색</p>
	        					<div class="card-body">
		        					<div class="row">
		        						<div class="col-3">
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
		        						<div class="col-3">
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
		        						<div class="col-3">
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
															<input type="radio" class="form-check-input" name="optradio">완결
														</label>
													</div>
			        							</div>
			        						</div>
		        						</div>
		        						<div class="col-3">
			        						<div class="card" style="border-radius:8px; border: 2px solid #4747A1;">
			        							<div class="datepicker">
			        								<div class="datepicker-inline">datepicker 들어갈 자리</div>
			        							</div>
			        						</div>
		        						</div>
		        					</div>
	        					</div>
	        					<div class="row">
	        						<div class="col">
		        						<div class="card">
		        							<div class="card-body d-flex">
		        								<div class="input-group mr-3" style="border-radius: 18px; border: 1px solid #4B49AC;">
													<div class="input-group-prepend hover-cursor mx-3" id="navbar-search-icon">
														<span class="input-group-text" id="search" style="background: transparent; border: 0; color: #000; padding: 0;">
														<i class="icon-search" style="font-size: 1.25rem; color: #6C7383;"></i>
														</span>
													</div>
													<div class="align-self-center">
														<div class="badge badge-primary font-weight-bold">
															제목
															<span class="mx-1"> X</span>
														</div>
														<div class="badge badge-primary font-weight-bold">
															기안자
															<span class="mx-1"> X</span>
														</div>
														<div class="badge badge-primary font-weight-bold">
															결재자
															<span class="mx-1"> X</span>
														</div>
													</div>
													<input type="text" class="form-control mx-4" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search" style="margin-left: .7rem; font-size: 1.25rem; color: #6C7383; background: transparent; border: 0; color: #000; padding: 0;">
												</div>
												<button type="submit" class="font-weight-bold btn btn-primary">Search</button>
		        							</div>
		        							<div class="card-body d-flex" style="padding-top: 0;">
												<div class="mr-3 align-self-center">
													<div class="badge badge-primary font-weight-bold">
														제목
														<span class="mx-1"> V</span>
													</div>
													<div class="badge badge-primary font-weight-bold">
														기안자
														<span class="mx-1"> V</span>
													</div>
													<div class="badge badge-primary font-weight-bold">
														결재자
														<span class="mx-1"> V</span>
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
						<div class="card grid-margin" style="box-shadow: 3px 3px 6px #cdd1e1;">
							<div class="card-body">
							<p class="card-title mb-0">전체문서함</p>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="pl-0  pb-2 border-bottom">문서 번호</th>
												<th class="border-bottom pb-2">결재상태</th>
												<th class="border-bottom pb-2">제목</th>
												<th class="border-bottom pb-2">기안자</th>
												<th class="border-bottom pb-2">부서</th>
												<th class="border-bottom pb-2">직급</th>
												<th class="border-bottom pb-2">상신날짜</th>
												<th class="border-bottom pb-2">완결날짜</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="pl-0">03-333</td>
												<td><div class="badge badge-success font-weight-bold">승인</div></td>
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
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>2023/02/19</td>
											</tr>
											<tr>
												<td class="pl-0">01-111</td>
												<td><div class="badge badge-primary font-weight-bold">진행</div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-primary mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="pl-0">02-222</td>
												<td><div class="badge badge-danger font-weight-bold">반려</div></td>
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
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="pl-0">03-333</td>
												<td><div class="badge badge-secondary font-weight-bold">회수</div></td>
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
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="pl-0">03-333</td>
												<td><div class="badge badge-success font-weight-bold">승인</div></td>
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
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>2023/02/19</td>
											</tr>
											<tr>
												<td class="pl-0">01-111</td>
												<td><div class="badge badge-primary font-weight-bold">진행</div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-primary mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="pl-0">02-222</td>
												<td><div class="badge badge-danger font-weight-bold">반려</div></td>
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
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="pl-0">03-333</td>
												<td><div class="badge badge-secondary font-weight-bold">회수</div></td>
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
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>
											<tr>
												<td class="pl-0">03-333</td>
												<td><div class="badge badge-success font-weight-bold">승인</div></td>
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
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>2023/02/19</td>
											</tr>
											<tr>
												<td class="pl-0">01-111</td>
												<td><div class="badge badge-primary font-weight-bold">진행</div></td>
												<td>
													<div>
														<p class="mb-0"><span class="font-weight-bold mr-2">결재 부탁드립니다</span></p>
														<p class="mb-0">
															<span class="font-weight-light text-success mr-2">장그래</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-primary mr-2">오상식</span>
															<span class="font-weight-light mr-2">>></span>
															<span class="font-weight-light text-muted mr-2">김부련</span>
														</p>
													</div>
												</td>
												<td>장그래</td>
												<td>공공사업1DIV</td>
												<td>사원</td>
												<td>2023/02/19</td>
												<td>N/A</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="card grid-margin" style="box-shadow: 3px 3px 6px #cdd1e1;">
							<div class="card-body" >
								<ul class="pagination justify-content-center pb-0 mb-0">
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