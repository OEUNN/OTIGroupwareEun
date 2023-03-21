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
			if($('#dep-'+ No).text() == ''){
				$.ajax({
					type : 'GET',
					url : "../employee/searchdepartment",
					data : {depId : No},
					success : function(data){
						$('#collapse-div-' + No).html(data);
						setTimeout(function() {
							$("#DIV" + No).collapse("show");
							}, 100); // 0.1초(100ms) 지연
					}
				});
			}
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
		
		.og-card-title {
			color: #4B49AC;
		    font-family: 'LeferiPoint-BlackObliqueA';
		    background-color: #e7e7ff;
		    border-radius: 15px;
		    padding: 15px 20px 9px 20px;
		    box-shadow: 3px 3px 6px #cdd1e1;
		    text-transform: capitalize;
		    font-size: 2.125rem;
		    font-weight: 700;
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
					<div class="row" style="height: 80px;">
						<div class="col-md-2 pl-0 grid-margin d-flex justify-content-center">
							<h5 class="mb-0 og-card-title d-flex align-content-center">
								<span class="pt-2 mr-2 mb-0 h4">조직도</span>
								<span class="mdi mdi-account-multiple h3 pt-1 mb-0"></span>
							</h5>
						</div>
					</div>
					<!-- top human -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-2">
							<div class="card" style="border-radius: 50%;">
								<div class="card-body" style="border-radius: 50%; padding: 50px; background-color: #4B49AC;">
									<div class="d-flex justify-content-center">
										<button id="ceo" class="d-flex align-items-center m-1 btn-color text-light" onclick="popup('0912011')">
											<i class="h1 my-auto mdi mdi-human-greeting"></i> 
											<div class="ml-2 font-weight-bold" style="font-size: 18px;">대표이사</div>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div><!-- End detail information -->
					<!-- Align-Middle Line -->
					<div class="row d-flex justify-content-center">
						<div style="border: 3px dashed gray; height:55px;"></div>
					</div>
					<!-- Start detail information -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-2 stretch-card">
							<div class="card" style="border-radius: 30px; background-color: #e7e7ff;">
								<div class="card-body" style="border-radius: 30px; padding: 20px 10px;">
									<div class=" d-flex justify-content-center">
										<button class="d-flex align-items-center m-1 btn-color text-primary" onclick="popup('0912012')">
											<i class="h2 pt-1 my-auto mdi mdi-account"></i> 
											<span class="ml-2 font-weight-bold" style="font-size: 18px;">이사</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div><!-- end top human -->
					<!-- Horizontal & Vertical-Center Line -->
					<div class="row d-flex justify-content-center">
						<div class="col-2 d-flex justify-content-center" style="height:55px; border-bottom: 3px solid gray;"></div>
						<div class="col-3 d-flex justify-content-center" style="border-bottom: 3px solid gray;"></div>
						<div class="col-3 d-flex justify-content-center" style="border-bottom: 3px solid gray; border-left: 4px solid gray;"> </div>
						<div class="col-2 d-flex justify-content-center"></div>
					</div>
					<!-- Vertical-Center Line & 경영지원부 -->
					<div class="row d-flex justify-content-center" style="height:100px">
						<div class="col-3" style="height:100px; border-left: 3px solid gray;"></div>
						<div class="col-3" style="height:100px; border-left: 3px solid gray; border-right: 3px solid gray;"></div>
						<div class="col-2"></div>
						<div class="col-2 pl-0" style="position: relative; top: -50px;">
						</div>
					</div>
					<!-- 1팀 -->
					<div class="form-inlie d-flex align-items-start"  style="height:100px">
						<div class="col-3 grid-margin">
							<div class="card" style="width: 80%;">
								<div class="card-body">
									<!-- AJAX 통신 부분 -->
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV1">
										<button class="dep d-flex align-items-center text-primary" onclick="department(1)">
											<i class="h2 my-auto mdi mdi-menu-down"></i> 
											<span class="h4 mb-0 ml-2 font-weight-bold">공공사업1DIV</span>
										</button>
									</div>
									<div id="collapse-div-1"></div>
								</div>
							</div>
						</div>
						<!-- 2팀 -->
						<div class="col-3 grid-margin">
							<div class="card" style="width: 80%;">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV2">
										<button class="dep d-flex align-items-center text-primary" onclick="department(2)">
											<i class="h2 my-auto mdi mdi-menu-down"></i> 
											<span class="h4 mb-0 ml-2 font-weight-bold" >공공사업2DIV</span>
										</button>
									</div>
									<div id="collapse-div-2"></div>
								</div>
							</div>
						</div>
						<!-- 3팀 -->
						<div class="col-3 grid-margin">
							<div class="card" style="width: 80%;">
								<div class="card-body">
									<div class="text-primary m-1 row" data-toggle="collapse"  data-target="#DIV3">
										<button class="dep d-flex align-items-center text-primary" onclick="department(3)">
											<i class="h2 my-auto mdi mdi-menu-down"></i> 
											<span class="h4 mb-0 ml-2 font-weight-bold">공공사업3DIV</span>
										</button>
									</div>
									<div id="collapse-div-3"></div>
								</div>
							</div>
						</div>
						<div class="col-3 grid-margin">
							<div class="card" style="width: 80%;">
								<div class="card-body">
									<!-- AJAX 통신 부분 -->
									<div class="text-primary m-1 row" data-toggle="collapse" data-target="#DIV4">
										<button class="dep d-flex align-items-center text-primary" onclick="department(4)">
											<i class="h2 my-auto mdi mdi-menu-down"></i> 
											<span class="h4 mb-0 ml-3 font-weight-bold">경영지원</span>
										</button>
									</div>
									<div id="collapse-div-4"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>

</html>