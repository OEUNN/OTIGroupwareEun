<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<!-- inject css, js common file -->
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<!-- endinject css, js common file -->
	<script>
        function popup(){
            var url = "employeeaddresspopup";
            var name = "address popup";
            var option = "width = 500, height =750, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
            window.open(url, name, option);
        }
        function select(){
        	var x = document.getElementById("dropdown-item").value;
        	console.log(x);
        	$('input[name=selectmenu]').attr('value',x);
        }
	</script>
	<style>
		.dropdown-toggle::after{
			content:none;
		}
	</style>
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
						<div class="col-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-12 grid-margin">
											<div class="row  d-flex justify-content-between align-items-start">
												<h3 class="card-title">임직원 목록</h3>
											</div>
										</div>
									</div>
									<!-- Start search box -->
									<form class="form-inline">
										<label class="h5 my-auto" for="status" >재직상태</label>
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
										<label class="h5 my-auto ml-1" for="employee">주소록</label>
										<input type="text" class="form-control btn" id="employee" onclick="popup()" style="border-radius: 18px; border: 1px solid #4B49AC; background-color: transparent;width:100px;height:30px;" readonly>
										<button type="submit" class="btn btn-sm btn-primary ml-1" style="font-family: LeferiBaseType-RegularA; font-weight: 700;">
											<span>검색</span>
										</button>
									</form><!-- End search box -->
									
									<div class="row mt-3">
										<div class="table-responsive">
											<table class="table table-hover">
												<thead>
													<tr>
														<th class="col-3">이름</th>
														<th class="col-3">사번</th>
														<th class="col-6">부서</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td >28.76%</td>
														<td> Pending</td>
														<td>2022/11/11</td>
													</tr>
													<tr>
														<td >28.76%</td>
														<td> Pending</td>
														<td>2022/11/11</td>
													</tr>
													<tr>
														<td >28.76%</td>
														<td> Pending</td>
														<td>2022/11/11</td>
													</tr>
													<tr>
														<td >28.76%</td>
														<td> Pending</td>
														<td>2022/11/11</td>
													</tr>
													<tr>
														<td >28.76%</td>
														<td> Pending</td>
														<td>2022/11/11</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- 테이블 끝 -->
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-8 grid-margin stretch-card">
							<div class="card">
								<form class="card-body">
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