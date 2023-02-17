<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- End custom js for this page-->
	<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
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
            		
						<div class="card">
							<div class="card-body">
								<p class="card-title">Advanced Table</p>
								<div class="row">
									<div class="col-12">
										<div class="table-responsive">
											<table id="example" class="display expandable-table" style="width:100%">
												<thead>
													<tr>
														<th>Quote#</th>
														<th>Product</th>
														<th>Business type</th>
														<th>Policy holder</th>
														<th>Premium</th>
														<th>Status</th>
														<th>Updated at</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>테스트</td>
														<td>테스트</td>
														<td>테스트</td>
														<td>테스트</td>
														<td>테스트</td>
														<td>테스트</td>
														<td>테스트</td>
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