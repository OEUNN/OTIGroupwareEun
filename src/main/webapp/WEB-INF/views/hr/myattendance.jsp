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
	<!-- Chart -->
	<script src="${pageContext.request.contextPath}/resources/vendors/chart.js/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
	
	<style>
		.chart-container {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  gap: 20px;
	    }
	</style>
	
	<script>
		//차트 AJAX
		$(function() {
			/* 차트에 필요한 데이터를 AJAX통신을 통해 갖고옴 */
			$.ajax({
	              url: "../hr/attendancestats",
	              error: function () {
	              	alert("통신실패!");
	              },
	              success: function (data) {
		           	 //차트
	           	   	 chartJsFun(data);
	              }
           	});
		});
		
		//chart.js 함수
		function chartJsFun(data){
			var obj = JSON.parse(JSON.stringify(data[0]));
			//도넛  차트
          	 const dctx = document.getElementById('doughnutChart');
          	 new Chart(dctx, {
          	   type: 'doughnut',
          	   data: {
          	     datasets: [{
          	       data: [obj.정상출근, obj.지각, obj.추가근무, obj.조퇴, obj.결근],
          	       backgroundColor: [
          	         '#4B49AC',
          	         '#f37981',
          	         'rgb(255, 205, 86)',
          	         '#7978E9',
          	         '#248AFD'
          	       ],
          	       hoverOffset: 4,
	           	   datalabels: {
          	          color: 'white'
	           	   }
          	     }],
          	     labels: ['정상출근', '지각', '추가근무', '조퇴', '결근'],
          	   },
          	   options: {
          		legend: {
          		    position: 'bottom',
	           		labels: {
	                     fontSize: 13,
	                     boxWidth: 15, // 아이콘 크기 조절
	                 }
          		 },
          	     animation: {
          	       animateRotate: true,
          	       animateScale: true
          	     },
          	  	 maintainAspectRatio: false,
          	   }
          	 });
          	 //바 차트
          	 const bctx = document.getElementById('barChart');
          	 new Chart(bctx, {
          	   type: 'horizontalBar',
          	   data: {
          	     datasets: [{
          	       axis: 'y',
          	       data: [obj.정상출근, obj.지각, obj.추가근무, obj.조퇴, obj.결근],
          	       backgroundColor: [
          	         '#4B49AC',
          	         '#f37981',
          	         'rgb(255, 205, 86)',
          	         '#7978E9',
          	         '#248AFD'
          	       ],
	           	   datalabels: {
	           	     color: 'white'
		           }
          	     }],
          	     labels: ['정상출근', '지각', '추가근무', '조퇴', '결근']
          	   },
          	   options: {
          		indexAxis: 'y',
          		legend: {
          		    display: false, // 범례를 숨김
	           		labels: {
	                	fontSize: 10,
	                }
          		 },
          	     animation: {
          	       animateRotate: true,
          	       animateScale: true
          	     },
          	  	 maintainAspectRatio: false,
	           	 scales: {
	           	    xAxes: [{
	           	      ticks: {
	           	        min: 0, // x축 최소값을 0으로 설정
	           	        max: 15 // x축 최대값을 15으로 설정
	           	      }
	           	    }],
	           	    yAxes: [{
	           	      ticks: {
	           	        beginAtZero: true
	           	      }
	           	    }]
	           	 }
          	   }
          	 });
		}
		
		//차트 이전달
	   	function chartPrev(date) {
	   		let prevMonth = parseInt(date.substring(5), 10);
	   		
	   		if(prevMonth > 1) {
	   			let prevMonthAfter = prevMonth - 1;
	   			var changeDate = date.substring(0, 5) + date.substring(5).replace(prevMonth.toString(), prevMonthAfter.toString());
	   		} else {
	   			let prevMonthAfter = 12;
	   			let prevYearAfter = parseInt(date.substring(0, 5), 10) - 1;
	   			var changeDate = prevYearAfter + '/' + prevMonthAfter
	   		}
	   		
	   		$.ajax({
	              url: "../hr/attendancestats",
	              data: {chartDate: changeDate},
	              error: function () {
	            	  swal({
	    				  title: "통신실패",
	    				  text: "통신실패 하였습니다.",
	    				  icon: "error",
	    				  button: "닫기",
	    			});
	              },
	              success: function (data) {
	            	  var obj = JSON.parse(JSON.stringify(data[0]));
	            	  console.log(obj);
	            	  
	            	  if(obj.정상출근 == 0 && obj.지각 == 0 && obj.추가근무 == 0 && obj.조퇴 == 0 && obj.결근 == 0){
	            		  swal({
		    				  title: "근무내역 없음",
		    				  text: "해당 월의 근무내역이 없습니다.",
		    				  icon: "warning",
		    				  button: "닫기",
		    			});
	            	  } else {
	            		  //이전달 버튼
		            	  let prevbtn = '<button type="button" onclick="chartPrev(' + "'" + changeDate + "'" + ')" class="btn btn-md py-1 px-2" style="background-color:#4B49AC">';
		            	  prevbtn += '<span class="h3 mb-0 fc-icon fc-icon-chevron-left"></span>';
		            	  prevbtn += '</button>';
		            	  $('#chartPrevBtn').html(prevbtn);
		            	  
		            	  //다음달 버튼
		            	  let nextbtn = '<button type="button" onclick="chartNext(' + "'" + changeDate + "'" + ')" class="btn btn-md py-1 px-2 ml-2" style="background-color:#4B49AC">';
		            	  nextbtn += '<span class="h3 mb-0 fc-icon fc-icon-chevron-right"></span>';
		            	  nextbtn += '</button>';
		            	  $('#chartNextBtn').html(nextbtn);
		            	  
		            	  chartJsFun(data);	  
	            	  }
              	  }
           });
	   	}
		
	  //차트 다음달
	   	function chartNext(date) {
	   		let nextMonth = parseInt(date.substring(5), 10);
	   		
	   		if(nextMonth < 12) {
	   			let nextMonthAfter = nextMonth + 1;
	   			//다음달
	   			var changeNextDate = date.substring(0, 5) + date.substring(5).replace(nextMonth.toString(), nextMonthAfter.toString());
	   		} else {
	   			let nextMonthAfter = 1;
	   			let nextYearAfter = parseInt(date.substring(0, 5), 10) + 1;
	   			var changeNextDate = nextYearAfter + '/' + nextMonthAfter;
	   		}
	   		
	   		$.ajax({
	              url: "../hr/attendancestats",
	              data: {chartDate: changeNextDate},
	              error: function () {
	            	  swal({
	    				  title: "통신실패",
	    				  text: "통신실패 하였습니다.",
	    				  icon: "error",
	    				  button: "닫기",
	    			});
	              },
	              success: function (data) {
	            	  var obj = JSON.parse(JSON.stringify(data[0]));
	            	  
	            	  if(obj.정상출근 == 0 && obj.지각 == 0 && obj.추가근무 == 0 && obj.조퇴 == 0 && obj.결근 == 0){
	            		  swal({
		    				  title: "근무내역 없음",
		    				  text: "해당 월의 근무내역이 없습니다.",
		    				  icon: "warning",
		    				  button: "닫기",
		    			});
	            	  } else {
	            		  //이전달 버튼
		            	  let prevbtn = '<button type="button" onclick="chartPrev(' + "'" + changeNextDate + "'" + ')" class="btn btn-md py-1 px-2" style="background-color:#4B49AC">';
		            	  prevbtn += '<span class="h3 mb-0 fc-icon fc-icon-chevron-left"></span>';
		            	  prevbtn += '</button>';
		            	  $('#chartPrevBtn').html(prevbtn);
		            	  
		            	  //다음달 버튼
		            	  let nextbtn = '<button type="button" onclick="chartNext(' + "'" + changeNextDate + "'" + ')" class="btn btn-md py-1 px-2 ml-2" style="background-color:#4B49AC">';
		            	  nextbtn += '<span class="h3 mb-0 fc-icon fc-icon-chevron-right"></span>';
		            	  nextbtn += '</button>';
		            	  $('#chartNextBtn').html(nextbtn);
		            	  
		            	  //차트 불러오기
		            	  chartJsFun(data);	  
	            	  }
              	  }
           });
	   	}
		
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
        <div class="content-wrapper pt-4">
        	<div class="row">
        		<div class="col-md-4">
	        		<!-- 현재시간 / 근무상태 -->
        			<div class="row">
        				<div class="col-md">
				           <div class="grid-margin stretch-card mb-4">
					           	<div class="card">
					           		<div class="card-body px-4">
					           			<div class="row">
						           			<!-- 현재시간/근무상태 -->
						           			<div class="col-md-6 pl-1">
							           			<!-- 현재시간 -->
							               		<div class="row ml-1">
													<div class="justify-content-start align-items-center">
														<div id="now-date" class="font-weight-bold h5 text-muted"></div>
														<div id="now-time" class="font-weight-bold" style="font-size: 45px;"></div>
													</div>
												</div>
												<div class="row ml-1">
								               		<div id="select-btn">
								               			<!-- 출근버튼 클릭전 or 퇴근버튼 클릭 후 -->
								               			<c:if test="${empty attendance.atdInTime || (!empty attendance.atdInTime && !empty attendance.atdOutTime)}">
								                  			<button class="btn btn-lg btn-outline-light" type="button" style="width: 110%; height:90%; font-weight: bold; border: 1px solid #A3A4A5;">
								                         		<c:if test="${empty attendance.atdInTime}">
									                         		<span id="selectbox-btn-name" style="font-size: 150%;">미출근</span>
								                         		</c:if>
								                         		<c:if test="${!empty attendance.atdOutTime && (attendance.atdState ne '연차' && attendance.atdState ne '대체휴무')}">
									                         		<span id="selectbox-btn-name" style="font-size: 120%;">퇴근완료</span>
								                         		</c:if>
								                        	</button>
								               			</c:if>
								               			<!-- 휴가중 -->
								               			<c:if test="${attendance.atdState eq '연차' || attendance.atdState eq '대체휴무'}">
								               				<button class="btn btn-lg btn-outline-light" type="button" style="width: 110%; height:90%; font-weight: bold; border: 1px solid #A3A4A5;">
								                         		<span id="selectbox-btn-name" style="font-size: 120%;">휴가중</span>
								               				</button>
						                         		</c:if>
								               			<!-- 출근버튼 클릭후 -->
							               				<c:if test="${!empty attendance.atdInTime && empty attendance.atdOutTime && (attendance.atdState ne '연차' && attendance.atdState ne '대체휴무')}">
								                  			<button class="btn btn-lg btn-outline-light px-4" type="button" id="dropdownMenuButton1" data-toggle="dropdown" 
								                  					aria-haspopup="true" aria-expanded="true" style="width: 170%; height:90%; font-size: 140%; font-weight: bold; border: 1px solid #A3A4A5;">
								                         		<span id="selectbox-btn-name">근무중</span>
								                        	</button>
<!-- 								                  			<button class="btn btn-lg btn-outline-light dropdown-toggle px-4" type="button" id="dropdownMenuButton1" data-toggle="dropdown"  -->
<!-- 								                  					aria-haspopup="true" aria-expanded="true" style="width: 140%; height:90%; font-size: 140%; font-weight: bold; border: 1px solid #A3A4A5;"> -->
<!-- 								                         		<span id="selectbox-btn-name">근무중</span> -->
<!-- 								                        	</button> -->
<!-- 								                        	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="width:80%;"> -->
<!-- 									                          <a class="dropdown-item" onclick="select('근무중')">근무중</a> -->
<!-- 									                          <a class="dropdown-item" onclick="select('출장')">출장</a> -->
<!-- 									                          <a class="dropdown-item" onclick="select('외근')">외근</a> -->
<!-- 									                        </div> -->
								               			</c:if>
							                  		</div>
												</div>
						           			</div>
						           			<!-- 출퇴근버튼 -->
						           			<div class="col-md-6 pr-0" style="border-left: 4px dashed rgba(163, 164, 165, 0.3);">
						           				<div class="row">
						           					<div class="card-title ml-3">
						           						출근/퇴근
					           						</div>
						           				</div>
						           				<div class="d-flex justify-content-around">
							               		    <!-- 출근버튼 클릭 전 -->
						                      	    <c:if test="${empty attendance.atdInTime && attendance.atdState ne '연차' && attendance.atdState ne '대체휴무'}">
								               			<button onclick="location.href='${pageContext.request.contextPath}/hr/intime?nowJsp=hr'" class="btn btn-lg btn-outline-primary px-4 py-3" style="font-weight: 700; font-size: 120%;">
							                           		<div class="h2 mdi mdi-alarm-check align-middle"></div>
							                           		<div>출근</div>
							                      	   </button>
							                           <button class="btn btn-lg btn-outline-secondary px-4 py-3" style="font-weight: 700; font-size: 120%; pointer-events: none;">
							                           		<div class="h2 mdi mdi-alarm-off align-middle"></div>
							                           		<div>퇴근</div>
							                       	   </button>
						                      	   </c:if>
						                      	   <!--  출근버튼 클릭 후 -->
						                      	   <c:if test="${!empty attendance.atdInTime && empty attendance.atdOutTime && attendance.atdState ne '연차' && attendance.atdState ne '대체휴무'}">
								               			<button class="btn btn-lg btn-outline-secondary px-4 py-3" style="font-weight: 700; font-size: 120%; pointer-events: none;">
							                           		<div class="h2 mdi mdi-alarm-check align-middle"></div>
							                           		<div>출근</div>
							                      	   </button>
							                           <button onclick="location.href='${pageContext.request.contextPath}/hr/outtime?nowJsp=hr'" class="btn btn-lg btn-outline-danger px-4 py-3" style="font-weight: 700; font-size: 120%;">
							                           		<div class="h2 mdi mdi-alarm-off align-middle"></div>
							                           		<div>퇴근</div>
							                       	   </button>
						                      	   </c:if>
						                      	   <!-- 퇴근버튼 클릭 후 -->
						                      	   <c:if test="${(!empty attendance.atdInTime && !empty attendance.atdOutTime) || (attendance.atdState eq '연차' || attendance.atdState eq '대체휴무')}">
								               			<button class="btn btn-lg btn-outline-secondary px-4 py-3" style="font-weight: 700; font-size: 120%; pointer-events: none;">
							                           		<div class="h2 mdi mdi-alarm-check align-middle"></div>
							                           		<div>출근</div>
							                      	   </button>
							                           <button class="btn btn-lg btn-outline-secondary px-4 py-3" style="font-weight: 700; font-size: 120%; pointer-events: none;">
							                           		<div class="h2 mdi mdi-alarm-off align-middle"></div>
							                           		<div>퇴근</div>
							                       	   </button>
						                      	   </c:if>
							               		</div>
						           			</div>
					           			</div>
				               		</div>
			               		</div>
		               		</div>
        				</div>
        			</div>
               		<!-- 달력에서 원하는 일자를 선택하면, 해당 일자의 출/퇴근 시간이 찍힘 -->
        			<div class="row">
	               		<!-- 출근 -->
        				<div class="col-lg-6">
		               		<div class="grid-margin stretch-card mb-4">
					           	<div class="card card card-dark-blue">
					           		<div class="card-body px-4 pb-5">
				           				<div class="card-title text-white pt-1" style="background-color: transparent;">출근</div>
				           				<div id="today-in-date" class="font-weight-bold h5 text-center mb-2"></div>
				           				<div id="today-in-time" class="font-weight-bold h2 text-center mb-0">
				           					<!-- 결근인 경우 -->
				           					<c:if test="${empty attendance.atdInTime}">
					           					&nbsp;
				           					</c:if>
				           					<!-- 휴가인경우 -->
				           					<c:if test="${!empty attendance.atdInTime && (attendance.atdState eq '연차' || attendance.atdState eq '대체휴무' || attendance.atdState eq '오전반차')}">
					           					&nbsp;
				           					</c:if>
				           					<!-- 나머지 -->
				           					<c:if test="${!empty attendance.atdInTime && attendance.atdState ne '연차' && attendance.atdState ne '대체휴무'}">
					           					<fmt:formatDate pattern="HH:mm" value="${attendance.atdInTime}" />
				           					</c:if>
				           				</div>
					           		</div>
				           		</div>
			           		</div>
        				</div>
        				<!-- 퇴근 -->
        				<div class="col-lg-6">
		               		<div class="grid-margin stretch-card">
					           	<div class="card card-light-danger">
					           		<div class="card-body px-4 pb-5">
				           				<div class="card-title text-white pt-1" style="background-color: transparent;">퇴근</div>
				           				<div id="today-out-date" class="font-weight-bold h5 text-center mb-2">
				           					<fmt:formatDate pattern="yyyy-MM-dd" value="${attendance.atdOutTime}" />
				           				</div>
				           				<div id="today-out-time" class="font-weight-bold h2 text-center mb-0">
				           					<!-- 결근인 경우 -->
				           					<c:if test="${empty attendance.atdOutTime}">
					           					&nbsp;
				           					</c:if>
				           					<!-- 휴가인경우 -->
				           					<c:if test="${!empty attendance.atdOutTime && (attendance.atdState eq '연차' || attendance.atdState eq '대체휴무')}">
					           					&nbsp;
				           					</c:if>
				           					<!-- 나머지 -->
				           					<c:if test="${!empty attendance.atdOutTime && attendance.atdState ne '연차' && attendance.atdState ne '대체휴무'}">
				           						<c:if test="${attendance.atdState eq '오후반차'}">
				           							&nbsp;
				           						</c:if>
				           						<c:if test="${attendance.atdState ne '오후반차'}">
						           					<fmt:formatDate pattern="HH:mm" value="${attendance.atdOutTime}" />
				           						</c:if>
				           					</c:if>
				           				</div>
					           		</div>
				           		</div>
			           		</div>
        				</div>
        			</div>
        			<!-- 나의 근무 통계 -->
        			<div class="row">
        				<div class="col-md-12">
					    	<!-- 근무현황통계(차트) -->
					    	<div class="card">
					        	<div class="card-body">
									<div class="row">
										<div class="col d-flex justify-content-between align-items-baseline">
											<div class="card-title">월별 근무통계</div>
											<!-- 이전달/다음달 -->
											<div class="d-flex">
												<!-- 이전달 -->
												<div id="chartPrevBtn">
													<button type="button" onclick="chartPrev('${sessionScope.chartDate}')" class="btn btn-md py-1 px-2" style="background-color:#4B49AC">
														<span class="h3 mb-0 fc-icon fc-icon-chevron-left"></span>
													</button>
												</div>
												<!-- 다음달 -->
												<div id="chartNextBtn">
													<button type="button" onclick="chartNext('${sessionScope.chartDate}')" class="btn btn-md py-1 px-2 ml-2" style="background-color:#4B49AC">
														<span class="h3 mb-0 fc-icon fc-icon-chevron-right"></span>
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 차트!! -->
									<div class="row">
										<div class="col-md-6">
											<canvas id="doughnutChart" width="600"></canvas>
										</div>
										<div class="col-md-6 pl-0">
											<canvas id="barChart"></canvas>
										</div>
									</div>
					          	</div>
					    	</div>
        				</div>
        			</div>
        		</div>
        		<!-- 근무현황통게 / 근무현황(달력) -->
        		<div class="col-md-8">
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