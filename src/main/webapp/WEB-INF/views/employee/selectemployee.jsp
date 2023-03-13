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
	function pager(No){
		var startRowNo = ${pager.startRowNo};
		var endRowNo =  ${pager.endRowNo};
		if(No < startRowNo ){
			No = 1;
		}else if (No > endRowNo){
			No = endRowNo;
		}
		console.log(No);
		jQuery.ajax({
			type : 'post',
			url : '../employee/employeepager',
			dataType : 'html',
			data : {page : No},
			success : function(data){
				$('#select_container').html(data);
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
						<div class="col-4 grid-margin stretch-card flex-column" id="select_container">
							<%@ include file="/WEB-INF/views/employee/selectemployeeinfo.jsp"%>
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