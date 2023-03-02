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
		//현재 시간
		$(function() {
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

		//오늘 날짜
		$(function() {
			const todayIn = document.getElementById("today-in-date");
			const todayOut = document.getElementById("today-out-date");
	
			function getTodayDate(){
			  const d = new Date();
			  const y = String(d.getFullYear()).padStart(4);
			  const M = String(d.getMonth() + 1).padStart(2,"0");
			  const da = String(d.getDate()).padStart(2,"0");
			  todayIn.innerHTML = y + "년 " + M + "월 " + da + "일";
			  todayOut.innerHTML = y + "년 " + M + "월 " + da + "일";
			}
		
			getTodayDate();
		});
		
 		//datepicker 렌더링
	   	$(function(){ 
		      $('#datepicker-myatd').datepicker({
		    	  todayHighlight: true
		      });
		      
		      $('#datepicker-atdapp').datepicker({
		    	  format: "yyyy-mm",
		    	  startView: "months", 
		    	  minViewMode: "months",
		    	  todayHighlight: true
		      });
		});
	   	
	   	//근무상태 변경가능한 셀렉박스
		function select(item) {
        	$("#selectbox-btn-name").html(item);
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
        		<div class="col-md-3">
	        		<!-- 현재시간 / 출근상태 -->
        			<div class="row">
        				<div class="col-md-12">
				           <div class="grid-margin stretch-card mb-4">
					           	<div class="card">
					           		<div class="card-body px-5 py-4">
					               		<!-- 현재시간 -->
					               		<div class="row">
											<div class="justify-content-start align-items-center">
												<div id="now-date" class="font-weight-bold h5 text-muted"></div>
												<div id="now-time" class="font-weight-bold h1 mt-3"></div>
											</div>
					               		</div>
					               		<!-- 근무상태 -->
					               		<div id="select-btn" class="row mt-3">
					               			<!-- 출근버튼 클릭전 or 퇴근버튼 클릭 후 -->
					               			<c:if test="${empty attendance.atdInTime || (!empty attendance.atdInTime && !empty attendance.atdOutTime)}">
					                  			<button class="btn btn-lg btn-outline-light" type="button" style="width: 200%; font-size: 130%; font-weight: bold; border: 1px solid #A3A4A5;">
					                         		<span class="mdi mdi-sleep" ></span>
					                        	</button>
					               			</c:if>
					               			<!-- 출근버튼 클릭후 -->
					               			<c:if test="${!empty attendance.atdInTime && empty attendance.atdOutTime}">
					                  			<button class="btn btn-lg btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" 
					                  					aria-haspopup="true" aria-expanded="true" style="width: 200%; font-size: 130%; font-weight: bold; border: 1px solid #A3A4A5;">
					                         		<span id="selectbox-btn-name" >근무중</span>
					                        	</button>
					                        	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="width:80%;">
						                          <a class="dropdown-item" onclick="select('근무중')">근무중</a>
						                          <a class="dropdown-item" onclick="select('출장')">출장</a>
						                          <a class="dropdown-item" onclick="select('외근')">외근</a>
						                        </div>
					               			</c:if>
				                  		</div>
				                  		<!-- 출퇴근 버튼 -->
					               		<div class="row mt-4 justify-content-between">
					               			<!-- 출근버튼 클릭 전 -->
				                      	   <c:if test="${empty attendance.atdInTime}">
						               			<button onclick="location.href='${pageContext.request.contextPath}/hr/intime?nowJsp=hr'" class="btn btn-lg btn-outline-primary p-4" style="font-weight: 700; font-size: 120%;">
					                           		<span class="mdi mdi-alarm-check align-middle"></span>
					                           		<span>출근</span>
					                      	   </button>
					                           <button class="btn btn-lg btn-outline-secondary p-4" style="font-weight: 700; font-size: 120%; pointer-events: none;">
					                           		<span class="mdi mdi-alarm-off align-middle"></span>
					                           		<span>퇴근</span>
					                       	   </button>
				                      	   </c:if>
				                      	   <!-- 출근버튼 클릭 후 -->
				                      	   <c:if test="${!empty attendance.atdInTime && empty attendance.atdOutTime}">
						               			<button class="btn btn-lg btn-outline-secondary p-4" style="font-weight: 700; font-size: 120%; pointer-events: none;">
					                           		<span class="mdi mdi-alarm-check align-middle"></span>
					                           		<span>출근</span>
					                      	   </button>
					                           <button onclick="location.href='${pageContext.request.contextPath}/hr/outtime?nowJsp=hr'" class="btn btn-lg btn-outline-danger p-4" style="font-weight: 700; font-size: 120%;">
					                           		<span class="mdi mdi-alarm-off align-middle"></span>
					                           		<span>퇴근</span>
					                       	   </button>
				                      	   </c:if>
				                      	   <!-- 퇴근버튼 클릭 후 -->
				                      	   <c:if test="${!empty attendance.atdInTime && !empty attendance.atdOutTime}">
						               			<button class="btn btn-lg btn-outline-secondary p-4" style="font-weight: 700; font-size: 120%; pointer-events: none;">
					                           		<span class="mdi mdi-alarm-check align-middle"></span>
					                           		<span>출근</span>
					                      	   </button>
					                           <button class="btn btn-lg btn-outline-secondary p-4" style="font-weight: 700; font-size: 120%; pointer-events: none;">
					                           		<span class="mdi mdi-alarm-off align-middle"></span>
					                           		<span>퇴근</span>
					                       	   </button>
				                      	   </c:if>
					               		</div>
				               		</div>
			               		</div>
		               		</div>
        				</div>
        			</div>
        			<!-- 여기서도 근무수정/추가근무신청을 할 수 있음 -->
<!--         			<div class="row"> -->
<!--         				<div class="col-md-12"> -->
<!--         					<button onclick="upateTimePopup()" id="popup-btn" class="btn btn-md btn-warning mx-2"> -->
<!-- 			               		<span class="mdi mdi-calendar-clock align-middle"></span> -->
<!-- 			               		<span>근무시간수정</span> -->
<!-- 			          	   </button> -->
<!-- 			               <button onclick="overTimePopup()" id="popup-btn" class="btn btn-md btn-primary mx-2"> -->
<!-- 			               		<span class="mdi mdi-calendar-plus align-middle"></span> -->
<!-- 			               		<span>추가근무보고</span> -->
<!-- 			           	   </button> -->
<!--         				</div> -->
<!--         			</div> -->
               		<!-- 달력에서 원하는 일자를 선택하면, 해당 일자의 출/퇴근 시간이 찍힘 -->
               		<!-- 출근 -->
        			<div class="row">
        				<div class="col-md-12">
		               		<div class="grid-margin stretch-card mb-4">
					           	<div class="card card card-light-danger">
					           		<div class="card-body px-4 pb-5">
				           				<div class="card-title text-white pt-1" style="background-color: transparent;">출근</div>
				           				<div id="today-in-date" class="font-weight-bold h5 text-center"></div>
				           				<div id="today-in-time" class="font-weight-bold h1 text-center mb-0">
				           					<c:if test="${empty attendance.atdInTime}">
					           					&nbsp;
				           					</c:if>
				           					<c:if test="${!empty attendance.atdInTime}">
					           					<fmt:formatDate pattern="HH:mm" value="${attendance.atdInTime}" />
				           					</c:if>
				           				</div>
					           		</div>
				           		</div>
			           		</div>
        				</div>
        			</div>
        			<!-- 퇴근 -->
        			<div class="row">
        				<div class="col-md-12">
		               		<div class="grid-margin stretch-card">
					           	<div class="card card-dark-blue">
					           		<div class="card-body px-4 pb-5">
				           				<div class="card-title text-white pt-1" style="background-color: transparent;">퇴근</div>
				           				<div id="today-out-date" class="font-weight-bold h5 text-center">
				           					<fmt:formatDate pattern="yyyy-MM-dd" value="${attendance.atdOutTime}" />
				           				</div>
				           				<div id="today-out-time" class="font-weight-bold h1 text-center mb-0">
				           					<c:if test="${empty attendance.atdOutTime}">
					           					&nbsp;
				           					</c:if>
				           					<c:if test="${!empty attendance.atdOutTime}">
					           					<fmt:formatDate pattern="HH:mm" value="${attendance.atdOutTime}" />
				           					</c:if>
				           				</div>
					           		</div>
				           		</div>
			           		</div>
        				</div>
        			</div>
        		</div>
        		<!-- 근무현황통게 / 근무현황(달력) -->
        		<div class="col-md-9">
					<%@ include file="/WEB-INF/views/fullcalendar/atd_calendar.jsp" %>
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