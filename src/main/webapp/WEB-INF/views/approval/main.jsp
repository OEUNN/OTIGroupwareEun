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
		
		<!-- partial:../../partials/_sidebar.jsp -->
		<%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
		<!-- partial -->
			
		<!-- ***** content-start ***** -->
		<div class="main-panel">
	        <div class="content-wrapper">
	        	<div class="row">
	        	
            		<div class="col-md-6 grid-margin">
            			<div class="card grid-margin">
							<div class="card-body">
								<p class="card-title">이번 달 결재 현황</p>
								<div class="row mb-3">
									<div class="col-3">
										<div class="card card-dark-blue">
						                    <div class="card-body">
						                    	<p class="card-title text-white mb-4">승인 된 문서</p>
						                    	<p class="fs-30 mb-2">8</p>
						                    	<p>66.67% (1 month)</p>
						                    </div>
						                </div>
									</div>
									<div class="col-3">
										<div class="card card-light-danger">
						                    <div class="card-body">
						                    	<p class="card-title text-white mb-4">반려 된 문서</p>
						                    	<p class="fs-30 mb-2">2</p>
						                    	<p>20.00% (1 month)</p>
						                    </div>
						                </div>
									</div>
									<div class="col-3">
										<div class="card card-tale">
						                    <div class="card-body">
						                    	<p class="card-title text-white mb-4">대기 중인 문서</p>
						                    	<p class="fs-30 mb-2">2</p>
						                    	<p>평균 처리일: 0.75일</p>
						                    </div>
						                </div>
									</div>
									<div class="col-3">
										<div class="card card-light-blue">
						                    <div class="card-body">
						                    	<p class="card-title text-white mb-4">상신한 문서</p>
						                    	<p class="fs-30 mb-2">12</p>
						                    	<p>지난 달 대비: +1</p>
						                    </div>
						                </div>
									</div>
								</div>
							</div>
						</div>
						<div class="card grid-margin">
							<div class="card-body">
							<p class="card-title mb-0">Projects</p>
								<div class="table-responsive">
									<table class="table table-borderless">
										<thead>
											<tr>
												<th class="pl-0  pb-2 border-bottom">Places</th>
												<th class="border-bottom pb-2">Orders</th>
												<th class="border-bottom pb-2">Users</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="pl-0">Kentucky</td>
												<td><p class="mb-0"><span class="font-weight-bold mr-2">65</span>(2.15%)</p></td>
												<td class="text-muted">65</td>
											</tr>
											<tr>
												<td class="pl-0">Ohio</td>
												<td><p class="mb-0"><span class="font-weight-bold mr-2">54</span>(3.25%)</p></td>
												<td class="text-muted">51</td>
											</tr>
											<tr>
												<td class="pl-0">Nevada</td>
												<td><p class="mb-0"><span class="font-weight-bold mr-2">22</span>(2.22%)</p></td>
												<td class="text-muted">32</td>
											</tr>
											<tr>
												<td class="pl-0">North Carolina</td>
												<td><p class="mb-0"><span class="font-weight-bold mr-2">46</span>(3.27%)</p></td>
												<td class="text-muted">15</td>
											</tr>
											<tr>
												<td class="pl-0">Montana</td>
												<td><p class="mb-0"><span class="font-weight-bold mr-2">17</span>(1.25%)</p></td>
												<td class="text-muted">25</td>
											</tr>
											<tr>
												<td class="pl-0">Nevada</td>
												<td><p class="mb-0"><span class="font-weight-bold mr-2">52</span>(3.11%)</p></td>
												<td class="text-muted">71</td>
											</tr>
											<tr>
												<td class="pl-0 pb-0">Louisiana</td>
												<td class="pb-0"><p class="mb-0"><span class="font-weight-bold mr-2">25</span>(1.32%)</p></td>
												<td class="pb-0">14</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 grid-margin">
            			<div class="card grid-margin">
							<div class="card-body">
								<p class="card-title">결재 대기 중인 문서</p>
								<div class="row">
									<div class="col-12">
										<div class="table-responsive">
											<table id="example" class="display expandable-table" style="width:100%">
												<thead>
													<tr>
														<th>상신날짜</th>
														<th>문서 제목</th>
														<th>부서</th>
														<th>기안자</th>
														<th>직급</th>
														<th>문서 번호</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2023/02/17 09:00:00</td>
														<td>추가근무 신청</td>
														<td>공공사업1DIV</td>
														<td>장그래</td>
														<td>사원</td>
														<td>01-111</td>
													</tr>
													<tr>
														<td>2023/02/17 09:00:00</td>
														<td>출장 신청</td>
														<td>공공사업1DIV</td>
														<td>오상식</td>
														<td>차장</td>
														<td>02-222</td>
													</tr>
													<tr>
														<td>2023/02/17 09:00:00</td>
														<td>경조사</td>
														<td>공공사업1DIV</td>
														<td>마복렬</td>
														<td>부장</td>
														<td>03-333</td>
													</tr>
													<tr>
														<td>2023/02/17 09:00:00</td>
														<td>경조사</td>
														<td>공공사업1DIV</td>
														<td>마복렬</td>
														<td>부장</td>
														<td>03-333</td>
													</tr>
													<tr>
														<td>2023/02/17 09:00:00</td>
														<td>경조사</td>
														<td>공공사업1DIV</td>
														<td>마복렬</td>
														<td>부장</td>
														<td>03-333</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card grid-margin">
							<div class="card-body">
								<p class="card-title">최근에 처리한 결재 문서</p>
								<div class="row">
									<div class="col-12">
										<div class="table-responsive">
											<table id="example" class="display expandable-table" style="width:100%">
												<thead>
													<tr>
														<th>결재상태</th>
														<th>문서 제목</th>
														<th>부서</th>
														<th>기안자</th>
														<th>직급</th>
														<th>문서 번호</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>승인</td>
														<td>추가근무 신청</td>
														<td>공공사업1DIV</td>
														<td>장그래</td>
														<td>사원</td>
														<td>01-111</td>
													</tr>
													<tr>
														<td>반려</td>
														<td>출장 신청</td>
														<td>공공사업1DIV</td>
														<td>오상식</td>
														<td>차장</td>
														<td>02-222</td>
													</tr>
													<tr>
														<td>진행 중</td>
														<td>경조사</td>
														<td>공공사업1DIV</td>
														<td>마복렬</td>
														<td>부장</td>
														<td>03-333</td>
													</tr>
													<tr>
														<td>진행 중</td>
														<td>경조사</td>
														<td>공공사업1DIV</td>
														<td>마복렬</td>
														<td>부장</td>
														<td>03-333</td>
													</tr>
													<tr>
														<td>진행 중</td>
														<td>경조사</td>
														<td>공공사업1DIV</td>
														<td>마복렬</td>
														<td>부장</td>
														<td>03-333</td>
													</tr>
												</tbody>
											</table>
										</div>
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