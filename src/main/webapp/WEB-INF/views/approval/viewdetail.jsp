<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tinymce/tinymceinit.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/tinymce/themes/silver/theme.min.js"></script>
	<script type="text/javascript">
	function popup(){
	    let url = "opinion";
	    let name = "opinion";
	    let option = "width=600, height=600, top=600px, left=600px, menubars=no, status=no, titlebars=no"
	    window.open(url, name, option);
	}
	</script>
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
	        		<div class="col-md-9 grid-margin">
	        			<div class="card gird-margin shadow-2">
		        			<div class="card-body">
		        				<p class="card-title mb-3 d-flex justify-content-between">문서 상세 보기
		        				<span>
			        				<span class="font-weight-bold btn btn-success btn-md">승인</span>
			        				<span class="font-weight-bold btn btn-danger btn-md">반려</span>
			        				<span class="font-weight-bold btn btn-warning btn-md">회수</span>
		        				</span>
		        				</p>
		        				<div class="card-body mb-3" style="box-shadow: 0px 0px 0px white;">
									<textarea id="document_detail" style="width: inherit;"></textarea>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
	        		<div class="col-md-3 grid-margin">
						<div class="card grid-margin">
							<div class="card-body">
								<div class="d-flex justify-content-between">												
									<p class="card-title">결재선</p>
								</div>
								
								<div class="row m-1">
		       						<div class="card card-dark-blue grid-margin shadow-2 mb-0 w-100" style="background-color: #57B657;">
					                    <div class="card-body">
						                    <div class="row mb-3">
							                    <div class="col-10">
							                    	<p class="card-title text-white fs-3">오상식</p>
							                    	<p>공공사업1DIV 차장</p>
							                    </div>
							                    <div class="col-2">
							                    	<i class="mdi mdi-close"></i>
							                    </div>
						                    </div>
						                    <div class="row">
						                    	<div class="col-12">
						                    		<h3 style="text-align: center; font-weight:bold; margin-bottom: -3px;">승인</h3>
						                    	</div>
						                    </div>
					                    </div>
									</div>
								</div>
								<div class="row m-1">
		       						<div class="d-flex align-items-stretch justify-content-center mb-0 w-100">
		          						<h1 class="mdi mdi-menu-down mt-1 mb-0 align-self-center"></h1>
		      						</div>
								</div>
								<div class="row m-1">
		       						<div class="card card-tale grid-margin shadow-2 mb-0 w-100 bg-warning">
					                    <div class="card-body">
						                    <div class="row mb-3">
							                    <div class="col-10">
							                    	<p class="card-title text-white fs-3">김부련</p>
							                    	<p>공공사업1DIV 부장</p>
							                    </div>
							                    <div class="col-2">
							                    	<i class="mdi mdi-close"></i>
							                    </div>
						                    </div>
						                   	<div class="row">
						                    	<div class="col-12">
						                    		<h3 style="text-align: center; font-weight:bold; margin-bottom: -3px;">열람 중</h3>
						                    	</div>
						                    </div>
					                    </div>
		         					</div>
								</div>
								<div class="row m-1">
		       						<div class="d-flex align-items-stretch justify-content-center mb-0 w-100">
		          						<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>
		      						</div>
								</div> 
								<div class="row m-1">
		         					<div class="card card-dark-danger grid-margin shadow-2 w-100" style="background-color: #DC4A38;">
					                    <div class="card-body">
						                    <div class="row mb-3">
							                    <div class="col-10">
							                    	<p class="card-title text-white fs-3">최전무</p>
							                    	<p class="text-white">공공사업1DIV 대표이사</p>
							                    </div>
							                    <div class="col-2">
							                    	<i class="mdi mdi-close text-white"></i>
							                    </div>
						                    </div>
						                    <div class="row">
						                    	<div class="col-12">
						                    		<h3 style="text-align: center; font-weight:bold; color: white; margin-bottom: -3px;">반려</h3>
						                    	</div>
						                    </div>
					                    </div>
		         					</div>
								</div>
								<div class="row m-1">
		         					<div class="card bg-info grid-margin shadow-2 w-100">
					                    <div class="card-body">
						                    <div class="row mb-3">
							                    <div class="col-10">
							                    	<p class="card-title text-white fs-3">최전무</p>
							                    	<p class="text-white">공공사업1DIV 대표이사</p>
							                    </div>
							                    <div class="col-2">
							                    	<i class="mdi mdi-close text-white"></i>
							                    </div>
						                    </div>
						                    <div class="row">
						                    	<div class="col-6">
						                    		<button class="btn btn-success w-100" style="text-align: center; font-weight:bold; margin-bottom: -3px;">승인</button>
						                    	</div>
						                    	<div class="col-6 d-flex justify-content-center">
						                    		<button class="btn btn-danger w-100" style="text-align: center; font-weight:bold; margin-bottom: -3px;">반려</button>
						                    	</div>
						                    </div>
					                    </div>
		         					</div>
								</div>
								<div class="row m-1">
		         					<div class="card card-warning grid-margin shadow-2 w-100" style="background-color: #939495;">
					                    <div class="card-body">
						                    <div class="row mb-3">
							                    <div class="col-10">
							                    	<p class="card-title text-white fs-3">최전무</p>
							                    	<p class="text-white">공공사업1DIV 대표이사</p>
							                    </div>
							                    <div class="col-2">
							                    	<i class="mdi mdi-close text-white"></i>
							                    </div>
						                    </div>
						                   	<div class="row">
						                    	<div class="col-12">
						                    		<h3 style="text-align: center; font-weight:bold; color: white; margin-bottom: -3px;">미열람/대기중</h3>
						                    	</div>
						                    </div>
					                    </div>
		         					</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<p class="card-title"><a onclick="popup()">의견란</a></p>
									<ul class="icon-data-list">
									<li>
										<div class="d-flex">
											<img src="images/faces/face2.jpg" alt="user">
											<div>
												<p class="h4 font-weight-bold text-primary mb-1">최전무 대표이사</p>
												<p class="mb-0">재밌네, 진행시켜</p>	
											</div>
										</div>
									</li>
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