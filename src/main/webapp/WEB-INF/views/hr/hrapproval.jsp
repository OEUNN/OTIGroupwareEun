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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
	<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	
	
	<script>
		//datepicker 렌더링
	   	$(function(){ 
		      $('#datepicker-attendance').datepicker({
		    	  format: "yyyy-mm",
		    	  startView: "months", 
		    	  minViewMode: "months",
		    	  todayHighlight: true
		      });

		      $('#datepicker-leave').datepicker({
		    	  format: "yyyy-mm",
		    	  startView: "months", 
		    	  minViewMode: "months",
		    	  todayHighlight: true
		      });
		});
		
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
	         	var option = "width = 800, height = 560, top = 200, left = 400, location = no, resizable=no, scrollbars=no  "
	         	window.open(url, name, option);
         	}
		}

	   	/* 휴가신청 결재내역 상세보기 팝업창 */
		function leaveApproval() {
        	var url = "popup/leaveaprv";
         	var name = "";
         	var option = "width = 800, height = 560, top = 200, left = 400, location = no, resizable=no, scrollbars=no  "
         	window.open(url, name, option);
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
        		<!-- 근무결재내역 -->
        		<div class="col-md">
        			<div class="card">
		                <div class="card-body">
		                  <div class="card-title d-flex align-items-center justify-content-between">
	                   	  	<div>근무결재내역</div>
	                   		<!-- datepicker start -->
				            <div id="datepicker-attendance" class="input-daterange input-group w-50">
								<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:13px; left: 25px;"></span>
								<input type="text" class="form-control font-weight-bold text-center form-control-sm" name="start" style="border:2px solid #4B49AC; border-radius:10px; "/>
								<button onclick="" class="btn btn-md btn-primary ml-2">검색</button>
							</div>
				            <!-- datepicker end -->
	                   	  </div>
		                  <div class="card card-light-blue mb-4">
			                  <div class="card-body">
			                      <p class="card-title text-white">Attendance Approval</p>
			                      <div class="row">
			                         <div class="col-md">총 결재<span class="pl-2 h3 font-weight-bold">0</span></div>
			                         <div class="col-md">결재 중<span class="pl-2 h3 font-weight-bold">1</span></div>
			                         <div class="col-md">결재 완료<span class="pl-2 h3 font-weight-bold">2</span></div>
			                      </div>
		                      </div>
		                 </div>
	                 	 <div class="table-responsive">
	                    	<table class="table table-hover">
	                           <thead>
	                             <tr>
	                               <th>신청유형</th>
	                               <th>기안날짜</th>
	                               <th>기안자</th>
	                               <th>결재날짜</th>
	                               <th>결재상태</th>
	                             </tr>
	                           </thead>
	                           <tbody>
	                              <tr onclick="atdApproval('근무시간수정')">
	                                 <td>근무시간수정</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr onclick="atdApproval('추가근무')">
	                                 <td>추가근무</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                           </tbody>
	                        </table>
	                     </div>
	                 </div>
	               </div>
        		</div>
        		<!-- 휴가결재내역 -->
        		<div class="col-md">
        			<div class="card">
		                <div class="card-body">
		                  <div class="card-title d-flex align-items-center justify-content-between">
	                   	  	<div>휴가결재내역</div>
	                   		<!-- datepicker start -->
				            <div id="datepicker-leave" class="input-daterange input-group w-50">
								<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:13px; left: 25px;"></span>
								<input type="text" class="form-control font-weight-bold text-center form-control-sm" name="start" style="border:2px solid #4B49AC; border-radius:10px; "/>
								<button onclick="" class="btn btn-md btn-primary ml-2">검색</button>
							</div>
				            <!-- datepicker end -->
	                   	  </div>
		                  <div class="card card-dark-blue mb-4">
			                  <div class="card-body">
			                      <p class="card-title text-white">Leave Approval</p>
			                      <div class="row">
			                         <div class="col-md">총 결재<span class="pl-2 h3 font-weight-bold">0</span></div>
			                         <div class="col-md">결재 중<span class="pl-2 h3 font-weight-bold">1</span></div>
			                         <div class="col-md">결재 완료<span class="pl-2 h3 font-weight-bold">2</span></div>
			                      </div>
		                      </div>
		                 </div>
	                 	 <div class="table-responsive">
	                    	<table class="table table-hover">
	                           <thead>
	                             <tr>
	                               <th>휴가유형</th>
	                               <th>기안날짜</th>
	                               <th>기안자</th>
	                               <th>결재날짜</th>
	                               <th>결재상태</th>
	                             </tr>
	                           </thead>
	                           <tbody>
	                              <tr onclick="leaveApproval()">
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                              <tr>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                                 <td>gdgd</td>
	                              </tr>
	                           </tbody>
	                        </table>
	                     </div>
	                 </div>
	               </div>
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