<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Plugin css,js for this page -->
<script src='${pageContext.request.contextPath}/resources/vendors/fullcalendar/js/index.global.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height : 300,
			editable : true,
// 			locale : 'ko',
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
			} ]
		});
		calendar.render();

		/* 한국어로 바꿨을 때 생기는 "일"을 지워줌! */
// 		$(".fc-daygrid-day-number").each(function(){
// 			var day = $(this).text();
// 			day = day.replace("일","");
// 			$(this).text(day);
// 		});
	});

	
</script>

<style>
	#calendar {
		width: 30%;
		min-width: 100%;
		margin: 0px auto;
	}
	
	.fc .fc-toolbar {
		font-size: 12px;
	}
	
	.fc .fc-toolbar.fc-header-toolbar {
		margin-bottom: 20px;
		margin-top: 20px;
	}
	
	.fc .fc-button {
		font-size: 11px;
	}
	
	.fc-daygrid-day-number {
		font-size: 12px;
	}
	
	.fc-prev-button, .fc-next-button {
		width: 10%;
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
		font-size: 2px;
		position: relative;
		top: -7px;
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
	
	.fc-icon-chevron-left:before, .fc-icon-chevron-right:before {
		color: white;
	}
</style>
<!-- End plugin css,js for this page -->

<div class="card">
	<div class="card-body">
		<p class="card-title mb-0">부서 휴가현황</p>
		<!-- 달력 -->
		<div id="calendar"></div>
	</div>
</div>
