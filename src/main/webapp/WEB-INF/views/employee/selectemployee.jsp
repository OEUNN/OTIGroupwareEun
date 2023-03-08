<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<!-- inject css, js common file -->
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<!-- endinject css, js common file -->
	<style>
		.dropdown-toggle::after{
			content:none;
		}
	</style>
	<script>
	function information(No){
		  var x = No;
			jQuery.ajax({
				type : 'post',
				url : "../employee/selectemployee",
				dataType : 'html',
				data : {empId : x},
				success : function(data){
					$('#emp_container').html(data);
				 }
			});
      }
	
	</script>
	<!-- Plugin css,js for this page -->
	<!-- End plugin css,js for this page -->
	</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-4 grid-margin stretch-card flex-column">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-12 grid-margin">
											<div class="d-flex justify-content-between align-items-center">
												<div class="card-title mb-0">임직원 목록</div>
											</div>
										</div>
									</div>
									<!-- Start search box -->
									<form class="form-inline">
										<label class="h5 my-auto mr-1" for="status" >재직상태</label>
										<div class="btn dropdown-toggle d-flex form-control p-1" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"
											style="border-radius: 18px; border: 1px solid #4B49AC;width:120px; height:30px;">
											<i class="text-primary mdi mdi-menu-down p-0 "></i> 
											<input class="selectmenu" type="text" style="border:none;width:100%;" readonly>
										</div>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
											<div class="dropdown-item" id="select-1" onclick="select(1)">전체</div>
											<div class="dropdown-item" id="select-2" onclick="select(2)">재직자</div> 
											<div class="dropdown-item" id="select-3" onclick="select(3)">퇴사자</div>
										</div>
										<script>
									        function select(No){
									        	var x = document.getElementById("select-" + No).innerText;
									        	$(".selectmenu").val(x);
									        }
										</script>
										<label class="h5 my-auto mx-1" for="employee">이름</label>
										<input type="text" class="form-control" id="employee" style="border-radius: 18px; border: 1px solid #4B49AC;width:100px;height:30px;">
										<button type="submit" class="btn btn-sm btn-primary ml-2" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
											<span>검색</span>
										</button>
									</form><!-- End search box -->
									
									<div class="row mt-3">
										<div class="table-responsive p-2">
											<c:if test="${!empty empList}">
												<table class="table table-hover">
													<thead>
														<tr>
															<th class="col-3">이름</th>
															<th class="col-3">사번</th>
															<th class="col-6">부서</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="employeeList" items="${empList}">
															<tr onclick="information(${employeeList.empId})">
																<td>${employeeList.empName}</td>
																<td>${employeeList.empId}</td>
																<td>${employeeList.depName}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</c:if>
											<c:if test="${empty empList}">
												
											</c:if>
										</div>
										<!-- 테이블 끝 -->
									</div>
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
						</div>
						<div class="col-lg-8 grid-margin stretch-card flex-column">
							<div class="card">
								<form class="card-body" id="emp_container">
									<%@ include file="/WEB-INF/views/employee/detailemployee.jsp"%>
								</form>
							</div>
						</div>
					</div>
				</div>
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