<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Plugin css,js for this page -->
<script src='${pageContext.request.contextPath}/resources/vendors/fullcalendar/js/index.global.js'></script>
<script src='${pageContext.request.contextPath}/resources/vendors/fullcalendar/js/goggle.calendar.min.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		  $(function () {
				//달력 렌더링
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					contentHeight : 700,
					selectable : true,
					businessHours : true,
					locale : 'ko',
					dayMaxEvents : true,
					eventSources: [
						{
						  //DB에 담긴 이벤트 데이터를 갖고옴
						  url: '../hr/calendar',
						},
					    {
						  //구글 API를 이용하여 공휴일을 표시
					      googleCalendarApiKey: 'AIzaSyAocA5FID3dzNX7LOO3N02rbI_4oEKjQPM',
					      googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
					      className: 'fc-holiday-ko', // 특별한 클래스 이름을 사용하여 구분
				    	  color: '#89c989'
					    }
					],
					eventContent: function(info) {
						let eventTitle = info.event.title;
						let eventTime = info.event.start.toTimeString().split(' ')[0];
						eventTime = eventTime.substring(0, 5);
						
						if (eventTitle == '출근') {
							if(eventTime.substring(0, 2) <= 8) {
								return { html : '<div id="intime-badge" class="badge" style="background-color:#F3797E;">출근 ' + eventTime + '</div>' }
							} else { //지각인 경우
								return { html : '<div class="badge badge-outline-danger">지각 ' + eventTime + '</div>' }
							}
						} else if (eventTitle == '퇴근') {
							if(eventTime.substring(0, 2) <= 17) { //조퇴인 경우 
								return { html : '<div class="badge badge-outline-primary">조퇴 ' + eventTime + '</div>' }
							} else {
								return { html : '<div class="badge badge-primary">퇴근 ' + eventTime + '</div>' }
							}
						} else if(eventTitle == '결근' ) {
							return { html : '<div class="h4 mt-2 mb-0 font-weight-bold" style="color:rgba(163, 164, 165, 0.9)">결근</div>' }
						} else if(eventTitle == '휴가') {
							return { html : '<div class="btn btn-md font-weight-bold px-5" style="background-color:rgba(163, 164, 165, 0.3); color:#5b5b5e;">휴가</div>' }
						} else if(eventTitle == '오전반차' || eventTitle == '오후반차') {
							return { html : '<div class="btn btn-md font-weight-bold px-3 py-1" style="background-color:rgba(163, 164, 165, 0.3); color:#5b5b5e;">'+ eventTitle +'</div>' }
						} else if(eventTitle == '추가근무') {
							return { html : '<div class="badge" style="background-color:#FDD36A; padding: 7px 5px; font-size:5%;">추가근무 ' + eventTime + '</div>' }
						} else if($('.fc-holiday-ko')){
							return { html : eventTitle }
						}
					}
				});
				calendar.render();
		});

	});

	/* 달력에서 일자를 누르면 상세보기 가능 */
	$(document).ready(function() {
		$(document).on("click", ".fc .fc-daygrid-day-frame", function () {
			//달력에서 클릭한 날짜의 연월일을 변환
			let clickDate = $(this).find(".fc-daygrid-day-number")[0].ariaLabel;
			$("#today-in-date").html(clickDate);
			$("#today-out-date").html(clickDate);
			
			//출퇴근 이력이 있는 경우
			if($(this).find(".fc-daygrid-event-harness").length == 2) {
				let inTime = $(this).find(".fc-daygrid-event-harness")[0].innerText;
				let outTime = $(this).find(".fc-daygrid-event-harness")[1].innerText;
				
				if ((inTime.indexOf("지각") == 0 || inTime.indexOf("출근") == 0) && (outTime.indexOf("퇴근") == 0 || outTime.indexOf("조퇴") == 0 || outTime.indexOf("추가근무") == 0)) {
					$("#today-in-time").html(inTime.substring(3));
					
					if(outTime.indexOf("추가근무") == 0){
						$("#today-out-time").html(outTime.substring(4));
					} else { //나머지
						$("#today-out-time").html(outTime.substring(3));
					}
				//오전반차인 경우
				} else if(inTime.indexOf("오전반차") == 0) {
					$("#today-in-time").html("<br>");
					$("#today-out-time").html(outTime.substring(3));
				//오후반차인 경우
				} else if(outTime.indexOf("오후반차") == 0) {
					$("#today-in-time").html(inTime.substring(3));
					$("#today-out-time").html("<br>");
				}
			//출근만 있는 경우
			} else if($(this).find(".fc-daygrid-event-harness").length == 1){
				let inTime = $(this).find(".fc-daygrid-event-harness")[0].innerText;
				if(inTime.indexOf("결근") == 0 || inTime.indexOf("휴가") == 0){ //결근이거나 휴가인 경우
					$("#today-in-time").html("<br>");
					$("#today-out-time").html("<br>");
				} else if(inTime.indexOf("지각") == 0 || inTime.indexOf("출근") == 0) { //출근하나만 있을 경우!
					$("#today-in-time").html(inTime.substring(3));
					$("#today-out-time").html("<br>");
				} else {
					$("#today-in-time").html("<br>");
					$("#today-out-time").html("<br>");
				}
			//이벤트가 3개 이상인 경우(공휴일..)
			} else if($(this).find(".fc-daygrid-event-harness").length >= 3) {
				let inTime = $(this).find(".fc-daygrid-event-harness")[1].innerText;
				let outTime = $(this).find(".fc-daygrid-event-harness")[2].innerText;
				$("#today-in-time").html(inTime.substring(3));
				$("#today-out-time").html(outTime.substring(3));
			//출퇴근 이력이 없는 경우
			} else { 
				$("#today-in-time").html("<br>");
				$("#today-out-time").html("<br>");
			}
			
		});
	});

	/* 근무시간수정 팝업창 */
	function upateTimePopup() {
		var url = "popup/updatetimeapp";
		var name = "";
		var option = "width = 800, height = 750, top = 100, left = 400, location = no, resizable=no, scrollbars=no  "
		window.open(url, name, option);
	}

	/* 추가근무신청 팝업창 */
	function overTimePopup() {
		var url = "popup/overtimeapp";
		var name = "";
		var option = "width = 800, height = 740, top = 100, left = 400, location = no, resizable=no, scrollbars=no  "
		window.open(url, name, option);
	}
</script>

<style>
	#calendar {
		min-width: 100%;
	}
	
	/* 공휴일	 */
/* 	.fc-holiday-ko { */
/* 		display: none; */
/* 	} */
	
	.fc-daygrid-event {
		border-radius: 3px;
	}
	
	.fc .fc-daygrid-day-bottom {
		position: relative;
		margin: 0px 0px;
		background-color: #fadbcf;
		border-radius: 0 0 3px 3px;
		z-index: 200;
		top: -3px;
	}
	
	
	.fc-popover .fc-popover-body .fc-daygrid-event-harness .fc-holiday-ko {
		display: none;
	}
	
	.fc-direction-ltr .fc-daygrid-event.fc-event-end {
		display: flex;
		justify-content: center;
		margin: 0px;
		padding: 1px;
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
	
	/* 더보기 버튼 */
	.fc .fc-daygrid-more-link {
		position: relative;
		color: #F3797E;
		padding: 5px 0;
		left: 5px;
	}

	.fc-col-header-cell-cushion:hover, .fc-daygrid-day-number:hover {
		text-decoration-line: none;
		color: #4B49AC;
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
	
	/* 팝업 버튼 */
	#popup-btn {
		font-family: LeferiBaseType-RegularA;
		font-weight: 700;
	}
	
	.fc-icon-chevron-left:before, .fc-icon-chevron-right:before {
		color: white;
	}
	
</style>
<!-- End plugin css,js for this page -->


<div class="card">
	<div class="card-body pt-0 pb-3">
		<!-- 달력 -->
		<div id="calendar"></div>
	</div>
</div>
