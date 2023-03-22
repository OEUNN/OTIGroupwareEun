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
	   		let result = true;
	   		let refuseText = $('#textarea-reason').val();
	   		
	   		if(refuseText == null) {
	   			result = false;
	   		} 
	   		
	   		if(result == true) {
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
   		}
	   	
   		/* AJAX통신 -근무신청내역 상세보기*/
   		function atdExcpDetail(id, category) {
   			$.ajax({
                type: "GET",
                url: "../hr/atdexcpapprovaldetail?atdExcpId=" + id + "&atdExcpCategory=" + category,
                error: function () {
                	alert("통신실패!");
                },
                success: function (data) {
                    //휴가신청내역 목록이 숨기기
                    $("#lev-app-aprv-list").hide();
					//AJAX 통신에 의해 상세조회 내용 넣기
//                     $("#atd-excp-aprv-detail").hide().fadeIn(500);
                    $('#atd-excp-aprv-detail').html(data);
                    $('#atd-excp-aprv-detail').show();
                }
        	});
   		}

   		/* AJAX통신 - 휴가신청내역 상세보기*/
   		function levAppDetail(id) {
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
//                     $("#lev-app-aprv-detail").hide().fadeIn(500);
                    $('#lev-app-aprv-detail').html(data);
                    $('#lev-app-aprv-detail').show();
                }
        	});
   		}
   		
   		/* AJAX통신 - 근무신청 결재 처리(승인,반려) */
   		function atdExcpAprv(state, id, category) {
   		//"승인" 버튼을 눌렀을 경우
   			if(state == "승인") {
   				$.ajax({
   					type: 'GET',
   					url: '../hr/atdexcpaprvstatecomplete',
   					data: {atdExcpProcessState: state, atdExcpId: id, atdExcpOpinion: state, atdExcpCategory: category},
   					error: function() {
   						swal({
  	    				  title: "결재실패",
  	    				  text: "결재실패 하였습니다.",
  	    				  icon: "error",
  	    				  button: "닫기",
  	    				});
   					},
   					success: function(data) {
   						swal({
  	    				  title: "결재승인",
  	    				  text: "결재승인 되었습니다.",
  	    				  icon: "success",
  	    				  button: "닫기",
  	    				});
   						$('#atd-excp-aprv-detail').html(data);
   						$('#atd-aprv-state' + id).html('<div class="badge badge-success font-weight-bold text-white">승인</div>');
   					}
   				});
   				
   			//"반려" 버튼을 눌렀을 경우
   			} else if(state == "반려") {
   				$("#refuse-reason").css("display", "block");
   				$("#cancel-btn").css("display", "block");
   				$("#approve-btn").css("display", "none");
   				
   				let opinion = $("#textarea-reason").val(); //반려사유 선택
   				
   				$.ajax({
   					 type : 'GET',
   					 url : "../hr/atdexcpaprvstatecomplete",
   					 data : {atdExcpProcessState: state, atdExcpId: id, atdExcpOpinion: opinion, atdExcpCategory: category},
   					 error : function() {
   						swal({
    	    				  title: "결재실패",
    	    				  text: "결재실패 하였습니다.",
    	    				  icon: "error",
    	    				  button: "닫기",
    	    				});
   					 },
   					 success : function(data) {
   						swal({
    	    				  title: "결재반려",
    	    				  text: "결재반려 되었습니다.",
    	    				  icon: "warning",
    	    				  button: "닫기",
   	    				 });
   						 $('#atd-excp-aprv-detail').html(data);
   						 $('#atd-aprv-state' + id).html('<div class="badge badge-danger font-weight-bold text-white">반려</div>');
   					 }
   				 });
   			}
   		}
   		
   		/* AJAX통신 - 휴가신청 결재 처리(승인,반려) */
   		function levAppAprv(state, id) {
   			//"승인" 버튼을 눌렀을 경우
   			if(state == "승인" || state == "취소완료") {
   				$.ajax({
   					type: 'GET',
   					url: '../hr/levappaprvstatecomplete',
   					data: {levAppProcessState: state, levAppId: id, levAppOpinion: state},
   					error: function() {
   						swal({
    	    				  title: "결재 승인 불가",
    	    				  text: "신청자의 잔여일수를 확인해주세요.",
    	    				  icon: "error",
    	    				  button: "닫기",
   						})
   					},
   					success: function(data) {
   						$('#lev-app-aprv-detail').html(data);
   						if(state == '승인'){
   							swal({
   	  	    				  title: "결재승인",
   	  	    				  text: "결재승인 되었습니다.",
   	  	    				  icon: "success",
   	  	    				  button: "닫기",
   	  	    				});
	   						$('#aprv-state' + id).html('<div class="badge badge-success font-weight-bold text-white">'+ state +'</div>');
   						} else {
   							swal({
   	  	    				  title: "결재취소완료",
   	  	    				  text: "결재취소완료 되었습니다.",
   	  	    				  icon: "success",
   	  	    				  button: "닫기",
   	  	    				});
	   						$('#aprv-state' + id).html('<div class="badge badge-warning font-weight-bold">'+ state +'</div>');
   						}
   					}
   				});
   				
   			//"반려" 버튼을 눌렀을 경우
   			} else if(state == "반려") {
   				$("#refuse-reason").css("display", "block");
   				$("#cancel-btn").css("display", "block");
   				$("#approve-btn").css("display", "none");
   				
   				let opinion = $("#textarea-reason").val(); //반려사유 선택
   				
   				$.ajax({
   					 type : 'GET',
   					 url : "../hr/levappaprvstatecomplete",
   					 data : {levAppProcessState: state, levAppId: id, levAppOpinion: opinion},
   					 error : function() {
   						swal({
  	    				  title: "결재실패",
  	    				  text: "결재실패 하였습니다.",
  	    				  icon: "error",
  	    				  button: "닫기",
  	    				});
   					 },
   					 success : function(data) {
   						swal({
  	    				  title: "결재반려",
  	    				  text: "결재반려 되었습니다.",
  	    				  icon: "warning",
  	    				  button: "닫기",
 	    				 });
   						 $('#lev-app-aprv-detail').html(data);
   						 $('#aprv-state' + id).html('<div class="badge badge-danger font-weight-bold text-white">반려</div>');
   					 }
   				 });
   			}
   		}
   		
   		/* 근무신청서 자세히보기에서 X버튼 누르면 다시 목록 커짐 */
   		function backAtdList() {
//    			$("#atd-excp-aprv-detail").hide().fadeOut(400);
   			$("#atd-excp-aprv-detail").hide();
   			//숨겨놓은 휴가신청내역 목록 보이기
            $("#lev-app-aprv-list").show();
//             $("#lev-app-aprv-list").hide().fadeIn(600);
   		}

   		/* 휴가신청서 자세히보기에서 X버튼 누르면 다시 목록 커짐 */
   		function backLevList() {
   			//상세조회 원래대로
//    			$("#lev-app-aprv-detail").hide().fadeOut(400);
   			$("#lev-app-aprv-detail").hide();
   			//숨겨놓은 근무신청내역 목록 보이기
            $("#atd-excp-aprv-list").show();
   		}
   		
   		//첫번째 반려버튼을 눌렀을 경우, 반려사유 작성란이 뜸
   		function refuseBtn() {
   			$("#refuse-reason").css("display", "block");
   			$("#cancel-btn").css("display", "block");
   			$("#first-refuse-btn").css("display", "none");
   			$("#second-refuse-btn").css("display", "block");
   			$("#approve-btn").css("display", "none");
   		}	
   		
   		//취소버튼
   		function cancel() {
   			$('#textarea-reason').val('');
   			$("#refuse-reason").css("display", "none");
   			$("#cancel-btn").css("display", "none");
   			$("#second-refuse-btn").css("display", "none");
   			$("#first-refuse-btn").css("display", "block");
   			$("#approve-btn").css("display", "block");
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