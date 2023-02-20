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
	<!-- End plugin css,js for this page -->
</head>

<body>
  <div class="container-scroller">
    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
    
    <div class="container-fluid page-body-wrapper">
      <!-- To_do_List/Chat -->
      <%@ include file="/WEB-INF/views/common/_settings-panel.jsp" %>
      <!-- Sidebar -->
      <%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        	<div class="row">
        		<div class="col-md-3">
        			<!-- 현재시간 / 출근상태 -->
		           <div class="grid-margin stretch-card">
			           	<div class="card">
			           		<div class="card-body p-5">
			               		<!-- 현재시간 -->
			               		<div class="row">
									<div class="justify-content-start align-items-center">
										<div id="now-date" class="font-weight-bold h5 text-muted"></div>
										<div id="now-time" class="font-weight-bold h1 mt-3"></div>
										<script>
											$( document ).ready(function() {
												const clock1 = document.getElementById("now-date");
												const clock2 = document.getElementById("now-time");
									
												function getClock(){
												  const d = new Date();
												  const y = String(d.getFullYear()).padStart(4);
												  const M = String(d.getMonth() + 1).padStart(2,"0");
												  const da = String(d.getDate()).padStart(2,"0");
												  const h = String(d.getHours()).padStart(2,"0");
												  const m = String(d.getMinutes()).padStart(2,"0");
												  const s = String(d.getSeconds()).padStart(2,"0");
												  clock1.innerText = y + "년 " + M + "월 " + da + "일";
												  clock2.innerText = h + ":" + m + ":" + s;
												}
											
												getClock(); //맨처음에 한번 실행
												setInterval(getClock, 1000); //1초 주기로 새로실행
											});
										</script>
									</div>
			               		</div>
			               		<!-- 근무상태 -->
			               		<div class="row mt-3 justify-content-center">
		                  			<button class="btn btn-lg btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" 
		                  					aria-haspopup="true" aria-expanded="true" style="width: 200%; font-size: 130%; font-weight: bold;">
		                         		근무중
		                        	</button>
		                        	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="width: 77%;">
			                          <h6 class="dropdown-header">근무중</h6>
			                          <a class="dropdown-item" href="#">출장</a>
			                          <a class="dropdown-item" href="#">외근</a>
			                          <div class="dropdown-divider"></div>
			                          <a class="dropdown-item" href="#">기타</a>
			                        </div>
		                  		</div>
		                  		<!-- 출퇴근 버튼 -->
			               		<div class="row mt-3 justify-content-around">
			               			<button class="btn btn-lg btn-outline-primary" style="font-family: LeferiBaseType-RegularA; font-weight: 700; font-size: 120%;">출근</button>
			               			<button class="btn btn-lg btn-outline-danger" style="font-family: LeferiBaseType-RegularA; font-weight: 700; font-size: 120%;">퇴근</button>
			               		</div>
		               		</div>
	               		</div>
               		</div>
               		<!-- 현재 휴가 -->
		           <div class="grid-margin stretch-card">
			           	<div class="card">
			           		<div class="card-body p-5">
			           		</div>
		           		</div>
	           		</div>
        		</div>
        		<!-- 출/퇴근 달력 -->
        		<div class="col-md-9">
					<%@ include file="/WEB-INF/views/fullcalendar/myatd_calendar.jsp" %>
        		</div>
        	</div>
	      	<!-- 최근메일 -->
          	<div class="row">
            	<div class="col-md-6 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <p class="card-title">최근 받은메일</p>
	                  <div class="card card-light-blue mb-4">
	            		<div class="card-body">
	                      <p class="card-title text-white">Mail</p>
	                      <div class="row">
	                      	<div class="col-md">받은메일<span class="pl-2 h3 font-weight-bold">0</span></div>
	                      	<div class="col-md">안읽음<span class="pl-2 h3 font-weight-bold">1</span></div>
	                      	<div class="col-md">임시저장<span class="pl-2 h3 font-weight-bold">2</span></div>
	                      	<div class="col-md">중요메일<span class="pl-2 h3 font-weight-bold">0</span></div>
	                      </div>
	                    </div>
	            	  </div>
	                  <div class="table-responsive">
	                      <table class="table table-hover">
		                        <thead>
		                          <tr>
		                            <th>문서번호</th>
		                            <th>발신인</th>
		                            <th>제목</th>
		                            <th>날짜</th>
		                          </tr>
		                        </thead>
		                        <tbody>
		                        	<tr>
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
		                        	</tr>
		                        	<tr>
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