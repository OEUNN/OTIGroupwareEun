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
	
	<style>
		/* 목록 작아지기 */
/* 	    .activelist { */
/* 	    	animation: smallList 0.8s ease-in-out; */
/* 	    	left: -100px; */
/* 	    } */
/* 	    @keyframes smallList { */
/* 	        from { left: 0; } */
/* 	        to { left: -100px; } */
/* 	    } */
	    
		/* 상세조회 키우기 */
/* 	    .activedetail { */
/*  	    	animation: bigdetail 1s ease-in-out; */
/* 	    	top: 70px; */
/* 	    	left: -100px; */
/* 	    } */
/* 	     @keyframes bigdetail { */
/* 	        from { top: 0; left: -100px; } */
/* 	        to { top: 70px; left: -100px; } */
/* 	    } */
	    
		/* 목록 원래대로 */
/* 	    .originlist { */
/* 	    	animation: originList 0.8s ease-in-out; */
/* 	    } */
/* 	    @keyframes originList { */
/* 	        from { left: -100px; } */
/* 	        to { left: 0; } */
/* 	    } */
	</style>
	
	<script>
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
                url: "../hr/atdexcpapprovaldetail?atdExcpId=" + id,
                error: function () {
                	alert("통신실패!");
                },
                success: function (data) {
                	//근무신청내역 목록 애니메이션
//                 	$('#atd-excp-aprv-list').removeClass('originlist');
//                     $("#atd-excp-aprv-list").css("transform", "scale(0.7)");
//                     $('#atd-excp-aprv-list').addClass('activelist');
//                     $("#atd-excp-aprv-list").css('animation-play-state', 'running');
                    //휴가신청내역 목록이 숨기기
                    $("#lev-app-aprv-list").hide();
					//AJAX 통신에 의해 상세조회 내용 넣기
                    $("#atd-excp-aprv-detail").hide().fadeIn(500);
                    $('#atd-excp-aprv-detail').html(data);
//                     $("#atd-excp-aprv-detail").css("transform", "scale(1.3)");
//                     $('#atd-excp-aprv-detail').addClass('activedetail');
                }
        	});
   		}

   		/* AJAX통신 - 휴가신청내역 상세보기*/
   		function leaveDetail(id) {
   			$.ajax({
                type: "GET",
                url: "../hr/levappaprvdetail?levAppId=" + id,
                error: function () {
                	alert("통신실패!");
                },
                success: function (data) {
                    //근무신청내역 목록이 숨기기
                    $("#atd-excp-aprv-list").hide();
					//AJAX 통신에 의해 상세조회 내용 넣기
                    $("#lev-app-aprv-detail").hide().fadeIn(500);
                    $('#lev-app-aprv-detail').html(data);
                }
        	});
   		}
   		
   		/* 근무신청 자세히보기에서 X버튼 누르면 다시 목록 커짐 */
   		function backAtdList() {
   			//목록 원래대로
//    			$('#atd-excp-aprv-list').removeClass('activelist');
//    		 	$("#atd-excp-aprv-list").hide().fadeIn(500);
//    			$("#atd-excp-aprv-list").css("transform", "scale(1)");
//    			$('#atd-excp-aprv-list').addClass('originlist');
   			//상세조회 원래대로
//    			$('#atd-excp-aprv-detail').removeClass('activedetail');
//    			$('#atd-excp-aprv-detail').css("transform", "scale(1)");
   			$("#atd-excp-aprv-detail").hide().fadeOut(500);
   			//숨겨놓은 휴가신청내역 목록 보이기
            $("#lev-app-aprv-list").hide().fadeIn(700);
   		}

   		/* 근무신청 자세히보기에서 X버튼 누르면 다시 목록 커짐 */
   		function backLevList() {
   			//상세조회 원래대로
   			$("#lev-app-aprv-detail").hide();
   			//숨겨놓은 휴가신청내역 목록 보이기
            $("#atd-excp-aprv-list").hide().fadeIn(700);
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
        		<!-- 근무신청결재내역 - 목록 -->
        		<div id="atd-excp-aprv-list" class="col-md">
	        		<%@ include file="/WEB-INF/views/hr/atdexcpaprvlist.jsp" %>
        		</div>
        		<!-- 근무신청결재내역 - 상세조회 -->
        		<div id="atd-excp-aprv-detail" class="col-md" style="display: none;"></div>
        		<!-- 휴가신청결재내역 - 상세조회 -->
        		<div id="lev-app-aprv-detail" class="col-md" style="display: none;"></div>
        		<!-- 휴가신청결재내역 - 목록 -->
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