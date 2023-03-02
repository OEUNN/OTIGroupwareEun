<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Plugin css,js for this page -->
<script src='${pageContext.request.contextPath}/resources/vendors/fullcalendar/js/index.global.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		  $(function () {
              var request = $.ajax({
                  url: "../hr/calendar",
                  method: "GET",
                  dataType: "json"
              });
              //성공시
              request.done(function (data) {
				//달력 렌더링
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					contentHeight : 550,
					selectable : true,
					businessHours : true,
					locale : 'ko',
					dayMaxEvents : true,
					events : data,
					eventContent : function(info) {
						let eventTitle = info.event.title;
						let eventTime = info.event.start.toTimeString().split(' ')[0];
						eventTime = eventTime.substring(0, 5);
						
						if (eventTitle == '출근') {
							if(eventTime.substring(0, 2) <= 8) {
								return { html : '<div class="badge" style="background-color:#F3797E;">출근 ' + eventTime + '</div>' }
							} else { //지각인 경우
								return { html : '<div class="badge" style="background-color:rgba(243, 121, 126, 0.3); color:#fa2d35">지각 ' + eventTime + '</div>' }
							}
						} else if (eventTitle == '퇴근') {
							if(eventTime.substring(0, 2) <= 17) { //조퇴인 경우 
								return { html : '<div class="badge" style="background-color:rgba(71, 71, 161, 0.3); color:#1e1e75;">조퇴 ' + eventTime + '</div>' }
							} else {
								return { html : '<div class="badge badge-primary">퇴근 ' + eventTime + '</div>' }
							}
						} else if(eventTitle == '결근' ) {
							return { html : '<div class="h4 mt-2 mb-0 font-weight-bold" style="color:rgba(163, 164, 165, 0.9)">결근</div>' }
						} else if(eventTitle == '휴가') {
							return { html : '<div class="btn btn-md font-weight-bold px-5" style="background-color:rgba(163, 164, 165, 0.3); color:#5b5b5e;">휴가</div>' }
						}
					},
				});
				calendar.render();
			});

			//실패시
			request.fail(function(jqXHR, textStatus) {
				alert("Request failed: " + textStatus);
			});
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
				
				if ((inTime.indexOf("지각") == 0 || inTime.indexOf("출근") == 0) && (outTime.indexOf("퇴근") == 0 || outTime.indexOf("조퇴") == 0)) {
					$("#today-in-time").html(inTime.substring(3));
					$("#today-out-time").html(outTime.substring(3));
				} 
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
	<div class="card-body">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<div class="card-title mb-0">나의 출퇴근</div>
			<div class="d-flex">
				<button onclick="upateTimePopup()" id="popup-btn" class="btn btn-md btn-warning mx-2">
               		<span class="mdi mdi-calendar-clock align-middle"></span>
               		<span>근무시간수정</span>
          	   </button>
               <button onclick="overTimePopup()" id="popup-btn" class="btn btn-md btn-primary mx-2">
               		<span class="mdi mdi-calendar-plus align-middle"></span>
               		<span>추가근무보고</span>
           	   </button>
       		</div>
        </div>
        <!-- 근무현황통계 -->
        <div class="card card-tale mb-2">
          <div class="card-body">
              <div class="row">
                 <div class="col-md text-center">정상출근<span class="pl-2 h3 font-weight-bold">20</span></div>
                 <div class="col-md text-center">지각<span class="pl-2 h3 font-weight-bold">0</span></div>
                 <div class="col-md text-center">조퇴<span class="pl-2 h3 font-weight-bold">1</span></div>
                 <div class="col-md text-center">결근<span class="pl-2 h3 font-weight-bold">2</span></div>
                 <div class="col-md text-center">추가근무<span class="pl-2 h3 font-weight-bold">0</span></div>
              </div>
             </div>
         </div>
		<!-- 달력 -->
		<div id="calendar" class="px-2"></div>
	</div>
</div>
