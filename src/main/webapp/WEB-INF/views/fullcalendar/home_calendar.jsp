<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Plugin css,js for this page -->
<script src='${pageContext.request.contextPath}/resources/vendors/fullcalendar/js/core.js'></script>
<script src='${pageContext.request.contextPath}/resources/vendors/fullcalendar/js/goggle.calendar.min.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			contentHeight : 200,
			editable : false,
			selectable : false,
			businessHours : true,
			dayMaxEvents : true, // allow "more" link when too many events
			eventSources: [
				{
				  //DB에 담긴 이벤트 데이터를 갖고옴
				  url: '../groupware/hr/empleavecalendar',
				},
			    {
				  //구글 API를 이용하여 공휴일을 표시
			      googleCalendarApiKey: 'AIzaSyAocA5FID3dzNX7LOO3N02rbI_4oEKjQPM',
			      googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
			      className: 'fc-holiday-ko' // 특별한 클래스 이름을 사용하여 구분
			    }
			],
			eventClick: function(info){
				   //클릭시 구글캘린더 url로 가는것을 막는다.
				   info.jsEvent.stopPropagation();
				   info.jsEvent.preventDefault();
			},
			eventContent: function(info) {
				let eventTitle = info.event.title;
				let empName = eventTitle.substring(0,3);
				let posName = eventTitle.substring(3);
				let eventMemo = info.event.extendedProps.memo;
				
				let empNameDiv = '<span class="text-primary font-weight-bold">'+ empName +'</span>';
				let posNameDiv = '<span class="text-muted" style="font-size:5px;">'+ posName +'</span>';
				
				if(eventMemo == '휴가') {
					return { html : '<div class="btn btn-md font-weight-bold ml-2 px-4 pt-2 pb-1" style="background-color:rgba(163, 164, 165, 0.3); color:#5b5b5e;">'+ empNameDiv + posNameDiv +' - 휴가</div>' }
				
				} else if(eventMemo == '오전반차' || eventMemo == '오후반차') {
					return { html : '<div class="btn btn-md font-weight-bold ml-2 px-2 pt-2 pb-1" style="border:3px solid rgba(163, 164, 165, 0.3); color:#5b5b5e;">'+ empNameDiv + posNameDiv + ' - ' + eventMemo +'</div>' }
				
				} else if($('.fc-holiday-ko')){
					// 날짜 객체 생성
					var date = new Date(info.event.start);
					var holiday = date.getFullYear() + '년 ' + (date.getMonth()+1) + '월 ' + date.getDate() + '일';
					// 공휴일에 해당하는 날짜 스타일 변환
					$('a[aria-label="'+ holiday +'"]').css({
						'color': 'red',
					    'font-weight': 'bold'
					});
					// 공휴일 종류(타이틀) 태그 만들기
					var newElmentDate = '<div style="color: red; border-radius:10px;">' + date.getDate() + '일' + '</div>';
					$('a[aria-label="'+ holiday +'"]').html(newElmentDate);
				}
			}
		
		});
		calendar.render();
	});
</script>

<style>
	#calendar {
		width: 30%;
		min-width: 100%;
		margin: 0px auto;
	}
	
	/* 공휴일 이벤트 NONE */
	.fc-holiday-ko {
		display: none;
	}
	
	.fc .fc-toolbar {
		font-size: 12px;
	}
	
	.fc .fc-toolbar.fc-header-toolbar {
		margin-bottom: 10px;
		margin-top: 15px;
		padding: 0 10px;
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
		font-size: 13px;
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
	
	/* 더보기 버튼 */
	.fc .fc-daygrid-more-link {
		fon-size: 2px;
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
		background-color: rgba(255, 193, 0, 0.3);
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
