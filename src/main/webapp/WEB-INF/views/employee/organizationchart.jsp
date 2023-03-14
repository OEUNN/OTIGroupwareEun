<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<!-- inject css, js common file -->
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<!-- endinject css, js common file -->
	
	<!-- Plugin css,js for this  page  -->
	<script>
      function department(No){
    	  var x = No;
			jQuery.ajax({
				type : 'post',
				url : "../employee/searchdepartment",
				data : {depId : x},
				success : function(data){
					$('#dep-'+x).empty();
					 $.each(data, function( index, value) {
						var sql = ""
						sql += '<button class="row my-1 ml-3 text-primary btn-color" onclick="popup(\''+value.empId+'\')">'
						sql += '<i class="h3 my-auto  mdi mdi-account"></i> '
						sql += '<span id="empName" class="ml-4 font-weight-bold" >' + value.empName+' '+value.posName+ '</span>'
						sql += '</button>'
						$('#dep-'+x).append(sql);
					 });
				}
			});
      }
      
      //직원 정보 popup창
		function popup(value) {
			var url = 'detailpopup/'+value;
            var name = "detail employee";
            var option = "width = 700, height = 450, top = 100, left = 200, location = no, resizable=no, scrollbars=no  "
            window.open(url, name, option);
		}
     
	</script>
	
	<style>
		.btn-color{
			padding:0px;
			border:none;
			background-color:transparent;
		}
		.btn-color:hover{
			padding:0px;
			border:none;
			background-color:transparent;
			color:#ced4da;
			text-decoration: none;
		}
		.dep{
			border : none;
			background-color: transparent;
		}
	</style>
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
						<div class="col-md-12 grid-margin">
							<div class="row  d-flex justify-content-between align-items-start">
								<h3 class="font-weight-bold">조직도</h3>
							</div>
						</div>
					</div>
					<!-- top human -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-3 grid-margin stretch-card ">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-center">
										<button id="ceo" class="d-flex align-items-center m-1 btn-color text-primary" onclick="popup('0912011')">
											<i class="h3 my-auto mdi mdi-worker"></i> 
											<span class="ml-2 font-weight-bold" onclick="popup('0912011')">대표이사</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div><!-- End detail information -->
					<!-- Start detail information -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-3 grid-margin stretch-card ">
							<div class="card">
								<div class="card-body">
									<div class=" d-flex justify-content-center">
										<button class="d-flex align-items-center m-1 btn-color text-primary" onclick="popup('0912012')">
											<i class="h3 my-auto mdi mdi-account"></i> 
											<span class="ml-2 font-weight-bold">이사</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div><!-- end top human -->
					<!-- 1팀 -->
					<div class="form-inlie d-flex align-items-start">
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV1">
										<button class="dep d-flex align-items-center m-1 text-primary" onclick="department(1)">
											<i class="h3 my-auto mdi mdi-menu-down"></i> 
											<span class="ml-2 font-weight-bold">공공사업1DIV</span>
										</button>
									</div>
									<div id="DIV1" class="row m-1 collapse text-primary mt-3 " data-target="#dep-1">
										<div id="dep-1" class=" flex-column">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 2팀 -->
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV2">
										<button class="dep d-flex align-items-center m-1 text-primary" onclick="department(2)">
											<i class="h3 my-auto mdi mdi-menu-down"></i> 
											<span class="ml-2 font-weight-bold" >공공사업2DIV</span>
										</button>
									</div>
									<div id="DIV2" class="row m-1 collapse text-primary mt-3">
										<div id="dep-2" class="flex-column">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 3팀 -->
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse"  data-target="#DIV3">
										<button class="dep d-flex align-items-center m-1 text-primary" onclick="department(3)">
											<i class="h3 my-auto mdi mdi-menu-down"></i> 
											<span class="ml-2 font-weight-bold">공공사업3DIV</span>
										</button>
									</div>
									<div id="DIV3" class="row m-1 collapse text-primary mt-3">
										<div id="dep-3" class="flex-column">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 4팀 -->
						<div class="col-3 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV4">
										<button class="dep d-flex align-items-center m-1 text-primary" onclick="department(4)">
											<i class="h3 my-auto mdi mdi-menu-down"></i> 
											<span class="ml-2 font-weight-bold">경영지원</span>
										</button>
									</div>
									<div id="DIV4" class="hide row m-1 collapse text-primary mt-3">
										<div id="dep-4" class="flex-column">
										</div>
									</div>
								</div>
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