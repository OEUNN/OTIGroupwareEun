<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<!-- inject css, js common file -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- endinject css, js common file -->

	<!-- Plugin css,js for this page -->
	<!-- datePicker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
	<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<!-- page-transitions -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/page-transitions-master/css/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/page-transitions-master/css/multilevelmenu.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/page-transitions-master/css/component.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/page-transitions-master/css/animations.css" />
	<script src="${pageContext.request.contextPath}/resources/vendors/page-transitions-master/js/modernizr.custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/page-transitions-master/js/jquery.dlmenu.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/page-transitions-master/js/pagetransitions.js"></script>
	
	<script>
	   	/* 근무신청 결재내역 상세보기 팝업창 */
		function atdApproval(data) {
         	if(data =='근무시간수정') {
         		//근무시간수정신청서 팝업창
	        	var url = "popup/updatetimeaprv";
	         	var name = "";
	         	var option = "width = 800, height = 600, top = 200, left = 400, location = no, resizable=no, scrollbars=no  "
	         	window.open(url, name, option);
         	} else {
         		//추가근무보고서 팝업창
	        	var url = "popup/overtimeaprv";
	         	var name = "";
	         	var option = "width = 800, height = 570, top = 200, left = 400, location = no, resizable=no, scrollbars=no  "
	         	window.open(url, name, option);
         	}
		}

	   	/* 휴가신청 결재내역 상세보기 팝업창 */
		function leaveApproval() {
        	var url = "popup/leaveaprv";
         	var name = "";
         	var option = "width = 800, height = 570, top = 200, left = 400, location = no, resizable=no, scrollbars=no  "
         	window.open(url, name, option);
		}
	   	
	   	/* AJAX통신 - 근무신청결재내역 페이징 목록 */
   		function atdExcpPaging(i) {
       		let atdExcpAprvForm = $("#atd-excp-aprv-form").serialize();
			atdExcpAprvForm += '&pageNo='+ i;
       		
       		$.ajax({
                   type: "post",
                   url: "../hr/atdexcpaprvlist",
                   data: atdExcpAprvForm,
                   error: function () {
                   	alert("통신실패!");
                   },
                   success: function (data) {
                       $('#atd-excp-aprv-list').html(data);
                   }
           	});
   		}

	   	/* AJAX통신 - 휴가결재내역 페이징 목록 */
   		function levAppPaging(i) {
       		let levAppAprvForm = $("#lev-app-aprv-form").serialize();
       		levAppAprvForm += '&pageNo='+ i;
       		
       		$.ajax({
                   type: "post",
                   url: "../hr/levappaprvlist",
                   data: levAppAprvForm,
                   error: function () {
                   	alert("통신실패!");
                   },
                   success: function (data) {
                       $('#lev-app-aprv-list').html(data);
                   }
           	});
   		}
	   	
   		/* AJAX통신 -근무신청내역 상세보기*/
   		function atdAppDetail(id) {
   			$.ajax({
                type: "GET",
                url: "../hr/popup/atdapplicationdetail?atdExcpId=" + id,
                error: function () {
                	alert("통신실패!");
                },
                success: function (data) {
                    $('#lev-app-aprv-list').html(data);
                }
        	});
   			
   			/*
   			var url = "popup/atdapplicationdetail?atdExcpId=" + id;
   			var name = "";
   			var option = "width = 800, height = 630, top = 200, left = 400, location = no, resizable=no, scrollbars=no  "
   			window.open(url, name, option);
   			*/
   		}
	</script>
	<!-- End plugin css,js for this page -->
</head>

<body>
  <div class="container-scroller">
    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
    
    <div class="container-fluid page-body-wrapper">
      <!-- Sidebar -->
      <%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        	<div class="row">
        		<!-- 근무신청결재내역 -->
        		<div id="atd-excp-aprv-list" class="col-md">
	        		<%@ include file="/WEB-INF/views/hr/atdexcpaprvlist.jsp" %>
        		</div>
        		<!-- 휴가신청결재내역 -->
        		<div id="lev-app-aprv-list" class="col-md">
	        		<%@ include file="/WEB-INF/views/hr/levappaprvlist.jsp" %>
        		</div>
        	</div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.jsp -->
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