<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Plugin css,js for this page -->
<script src='${pageContext.request.contextPath}/resources/vendors/fullcalendar/js/index.global.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			editable : true,
			selectable : true,
			businessHours : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : [ {
				title : 'All Day Event',
				start : '2023-01-02'
			}, {
				title : 'Long Event',
				start : '2023-01-06',
				end : '2023-01-10'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2023-01-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2023-01-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2023-01-11',
				end : '2023-01-13'
			}, {
				title : 'Meeting',
				start : '2023-01-12T10:30:00',
				end : '2023-01-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2023-01-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2023-01-12T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2023-01-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2023-01-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2023-01-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2023-01-28'
			}, {
				title : '출근',
				start : '2023-02-20T08:45:02'
			}, {
				title : '퇴근',
				start : '2023-02-20T18:15:04'
			} ]
		});

		calendar.render();
	});
	
	/* 달력에서 일자를 누르면 상세보기 가능 */
	$(document).ready(function(){
		$('.fc-daygrid-day-frame').click(function(){
			  let atdArr = $(this).find(".fc-daygrid-day-events .fc-event-title").get();
			  let timeArr = $(this).find(".fc-daygrid-day-events .fc-event-time").get();
			  
			  if(timeArr.length != 0) { //시간이 찍혀있을 경우
				  for(var i=0; i<timeArr.length; i++){
					 let atdStr = atdArr[i].innerHTML; 
					 let timeStr = timeArr[i].innerHTML; 
					 
					 console.log(timeStr.substr(4));
					 
					 if(timeStr.substr(4)=="a"){
						 timeStr = "AM " + timeStr.substr(0,4);
					 } else {
						 timeStr = "PM " + timeStr.substr(0,4);
					 }
					 if(atdStr === "출근") {
						 $("#today-in-time").html(timeStr);
					 } else if (atdStr === "퇴근") {
						 $("#today-out-time").html(timeStr);
					 }
				  }
			  } else { //시간이 찍혀있지 않을 경우
				  $("#today-in-time").html(" ");
				  $("#today-out-time").html(" ");
			  }
		});
	});
	
	/* 근무시간수정 팝업창 */
     function upateTimePopup(){
         var url = "popup/updatetime";
         var name = "";
         var option = "width = 800, height = 730, top = 100, left = 400, location = no, resizable=no, scrollbars=no  "
         window.open(url, name, option);
     }
	
	/* 추가근무신청 팝업창 */
     function overTimePopup(){
         var url = "popup/overtime";
         var name = "";
         var option = "width = 800, height = 690, top = 100, left = 400, location = no, resizable=no, scrollbars=no  "
         window.open(url, name, option);
     }
</script>

<style>
	#calendar {
		min-width: 100%;
	}
	
	.fc-theme-standard td, .fc-theme-standard th,
	.fc-theme-standard .fc-scrollgrid {
		border: none;
	}

	.fc-theme-standard th {
		border-bottom: 2px solid rgba(75, 73, 172, 0.2);
	}
	
	.fc-button-group > button:not(:last-child):not(.dropdown-toggle), 
	.fc-button-group > button:not(:first-child):not(.dropdown-toggle) {
		background-color: #4B49AC;
	}

	.fc-col-header-cell-cushion {
		color: #4B49AC;
	}

	.fc-daygrid-day-number {
		color: black;
	}
	
	.fc .fc-daygrid-more-link {
		color: #FF4747;
	}

	.fc-col-header-cell-cushion:hover, .fc-daygrid-day-number:hover {
		text-decoration-line: none;
		color: #4B49AC;
	}
	
	.fc-event-time, .fc-event-title {
		color: black;
	}
	
	/* 일요일 날짜 빨간색 */
	.fc-day-sun a {
	  color: red;
	  text-decoration: none;
	}
	
	/* 토요일 날짜 파란색 */
	.fc-day-sat a {
	  color: blue;
	  text-decoration: none;
	}
	
	/* 오늘 날짜 */
	.fc .fc-daygrid-day.fc-day-today {
		background-color: rgba(255, 71, 71, 0.2);
		border-radius: 10px;
	}
	
	/* 날짜 선택했을시 */
	.fc .fc-highlight {
		background-color: #DAE7FF;
		color: white;
		border-radius: 10px;
	}
	
	/* 팝업 버튼 */
	#popup-btn {
		font-family: LeferiBaseType-RegularA;
		font-weight: 700;
	}
</style>
<!-- End plugin css,js for this page -->


<div class="card">
	<div class="card-body">
		<p class="card-title d-flex justify-content-between align-items-start">
			<span>나의 출퇴근</span>
			<span>
				<button onclick="upateTimePopup()" id="popup-btn" class="btn btn-md btn-primary mx-2">
               		<span class="mdi mdi-calendar-clock align-middle"></span>
               		<span>근무시간수정</span>
          	   </button>
               <button onclick="overTimePopup()" id="popup-btn" class="btn btn-md btn-warning mx-2">
               		<span class="mdi mdi-calendar-plus align-middle"></span>
               		<span>추가근무신청</span>
           	   </button>
			</span>
		</p>
		<!-- 달력 -->
		<div id="calendar"></div>
	</div>
</div>
