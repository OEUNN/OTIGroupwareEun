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
	
	<style>
		.custom-border-left {
			border-left: 1px solid rgb(206,212,218);
		}
		
		.custom-border-right {
			border-right: 1px solid rgb(206,212,218);
		}
	</style>
	
	<script>
		//datepicker 렌더링
	   	$(function(){ 
		      $('#datepicker').datepicker({
		    	  format: "yyyy-mm",
		    	  startView: "months", 
		    	  minViewMode: "months",
		    	  todayHighlight: true
		      });

		      $('#datepicker-application').datepicker({
		    	  todayHighlight: true
		      });
		});
		
		/* 휴가신청내역 상세보기 팝업창 */
		function leaveDetail() {
        	var url = "popup/leavedetail";
         	var name = "";
         	var option = "width = 800, height = 570, top = 200, left = 400, location = no, resizable=no, scrollbars=no  "
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
        		<!-- 연차일수 현황 -->
       			<div class="col-md-5 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">	
                   		<div class="card-title d-flex align-items-center justify-content-between">
                   			<div>휴가내역</div>
                   			<!-- datepicker start -->
			                <div id="datepicker" class="input-daterange input-group w-50">
								<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:13px; left: 25px;"></span>
							    <input type="text" class="form-control font-weight-bold text-center form-control-sm" name="start" style="border:2px solid #4B49AC; border-radius:10px; "/>
								<button onclick="" class="btn btn-md btn-primary ml-2">검색</button>
							</div>
			                <!-- datepicker end -->
                   		</div>
	                	<!-- 휴가일수 -->
	                	<div class="card card-light-blue mb-4">
	                  		<div class="card-body">
	                     		<p class="card-title text-white">Leave</p>
	                      		<div class="row text-center px-2" style="font-size: 14px;">
	                         		<div class="col-md">총 연차</div>
	                         		<div class="col-md">사용 연차</div>
	                         		<div class="col-md">잔여 연차</div>
	                         		<div class="col-md">잔여 대체휴무</div>
	                      		</div>
	                      		<div class="row text-center font-weight-bold h3 mb-0">
	                         		<div class="col-md">0</div>
	                         		<div class="col-md">0</div>
	                         		<div class="col-md">0</div>
	                         		<div class="col-md">0</div>
	                      		</div>
                      		</div>
                 		</div>
                 		<!-- 휴가내역 -->
                 		<div class="table-responsive">
	                      <table class="table table-hover">
		                        <thead>
		                          <tr>
		                            <th>휴가유형</th>
		                            <th>기안날짜</th>
		                            <th>휴가기간</th>
		                            <th>결재날짜</th>
		                            <th>결재상태</th>
		                          </tr>
		                        </thead>
		                        <tbody>
		                        	<tr onclick="leaveDetail()">
		                        		<td>gdgd</td>
		                        		<td>gdgd</td>
		                        		<td>gdgd</td>
		                        		<td>gdgd</td>
		                        		<td><div class="badge badge-success font-weight-bold">승인</div></td>
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
        		<!-- 휴가신청폼 -->
       			<div class="col-md-7 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">	
		                <form>
		                  <p class="card-title">휴가신청</p>
	                        <div class="table-responsive px-3 py-2">
	                       	  <!-- 고정 내용 -->
		                      <table class="table">
		                           <tbody>
		                              <tr class="custom-border-left custom-border-right">
		                                 <td class="custom-border-right"><h4 class="font-weight-bold text-center m-0">작성자</h4></td>
		                                 <td>이춘향</td>
		                                 <td></td>
		                                 <td></td>
		                                 <td class="custom-border-left custom-border-right"><h4 class="font-weight-bold text-center m-0">근무날짜</h4></td>
		                                 <td>2023-02-21</td>
		                                 <td></td>
		                              </tr>
		                              <tr class="custom-border-left custom-border-right">
		                                 <td class="custom-border-right"><h4 class="font-weight-bold text-center m-0">결재자</h4></td>
		                                 <td>홍길동</td>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                              </tr>
		                              <tr>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                                 <td></td>
		                              </tr>
		                           </tbody>
		                       </table>
		                    </div>
	          	            <!-- 변경내용-->
	                        <div class="container-fluid">
	                      		 <div class="row justify-content-center">
	                       			<div style="border: 1px solid #a3a4a5; opacity: 0.5; width:90%;"></div>
	                      		 </div>
	                      		 <!-- 휴가 선택 -->
	                      		 <div class="row">
	                      		 	<div class="col-md d-flex align-items-center px-5 py-2">
	                      		 		<h4 class="mx-4 mb-0 font-weight-bold">휴가선택</h4>
		                      		 	<select class="leave-select form-control mx-2" style="font-weight:bold; width: 40%">
											<option>연차 잔여 ( 0개 )</option>
											<option>대체휴무 잔여( 0개 )</option>
										</select>
	                      		 	</div>
	                      		 </div>
	                      		 <!-- 휴가 유형 -->
	                      		 <div class="row">
	                      		 	<div class="col-md d-flex align-items-center px-5 py-2">
	                      		 		<h4 class="mx-4 mb-0 font-weight-bold">휴가유형</h4>
		                      		 	<select class="leave-select form-control mx-2" style="font-weight:bold; width: 40%">
											<!-- 연차 -->
											<option>연차</option>
											<option>오전반차</option>
											<option>오후반차</option>
										</select>
	                      		 	</div>
	                      		 </div>
	                      		 <!-- 기간(날짜) 선택 -->
	                      		 <div class="row px-5 py-2">
	                      			<div class="col-md d-flex align-items-center pl-0">
	                      				<h4 class="mx-4 mb-0 font-weight-bold">휴가기간</h4>
	                      				<!-- datepicker start -->
					                    <div id="datepicker-application" class="mx-2 input-daterange input-group text-primary" style="border:2px solid #4B49AC; border-radius: 10px; width: 50%;">
											<span class="mdi mdi-calendar-clock" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
										    <input type="text" class="input-sm form-control font-weight-bold" name="start" style="border:0px; text-align: center;">
										    <span class="input-group-addon font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
											<span class="mdi mdi-calendar-clock" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
										    <input type="text" class="input-sm form-control font-weight-bold" name="end" style="border:0px; border-radius:10px; text-align: center;">
										</div>
					                  	<!-- datepicker end -->
	                      			</div>
	                      		 </div>
	                      		 <!-- 휴가사유 -->
	                      		 <div class="row px-5 mt-4 justify-content-center">
	                      			<div class="form-group">
					                	<label class="ml-1" for="reason"><div class="h5 m-0 font-weight-bold text-primary">사유</div></label>
					                    <textarea class="form-control" id="reason" rows="5" cols="90"></textarea>
			                    	</div>
	                      		 </div>
	                        	 <div class="row justify-content-center mt-3">
	                       			<div style="border: 1px solid #a3a4a5; opacity: 0.5; width:90%;"></div>
	                      		 </div>
	                       	   </div>
							   <!-- 버튼 -->
		                       <div class="row px-5 mt-3 justify-content-end">
		                        	<button onclick="updateTime()" type="submit" class="btn btn-primary mr-2">신청</button>
		                       </div>
		                       <!-- 변경내용:end -->
		                </form>
                	</div>
                	<!-- card:end -->
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