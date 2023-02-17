<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		<!-- 캘린더 -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
	    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
	
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendadr/core.main.css" />
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendadr/daygrid.main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendadr/style.css" />
		
		<script src="${pageContext.request.contextPath}/resources/calendar/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/calendar/core.main.js"></script>
    	<script src="${pageContext.request.contextPath}/resources/calendar/interaction.main.js"></script>
   		<script src="${pageContext.request.contextPath}/resources/calendar/daygrid.main.js"></script>
	</head>
	
	<body>
		<div class="container-fluid flex-column vh-100 p-0">
			<div class="flex-grow-1">
				<div id="row main_row">
					<!-- 메인메뉴 -->
					<div id="main_menu" class="col p-0">
						<%@ include file="/WEB-INF/views/common/menu.jsp" %>
					</div>
					<!-- 내용 -->
					<div class="col">
						<div id="main_content" class="container-fluid row">
							<!-- ***************************************************** -->
							<!-- 프로필/퀵메뉴/근무/메일 -->
							<div class="col-2">
								<div class="row justify-content-center mt-3">
									<img src="${pageContext.request.contextPath}/resources/images/이미지.png" width="200" class="bg-secondary rounded">
								</div>
								<div id="home_side_profile" class="row">
									<div class="row justify-content-center">
										<div class="ml-2 flex-column">
											<span id="emp_name">홍길동</span>
											<span id="emp_position">사원</span>
											<div id="emp_dep" class="ml-0">공공사업1DIV</div>
										</div>
									</div>
									<div id="quick_btn" class="row mt-3 pl-2">
										<button class="btn btn-sm">메일쓰기</button>
										<button class="btn btn-sm">휴가신청</button>
										<button class="btn btn-sm">결재신청</button>
										<button class="btn btn-sm">개인정보수정</button>
									</div>
									<div id="middle_box" class="row justify-content-start align-items-center mt-5">
										<div class="h3 font-weight-bold m-0">나의 근무</div>
										<div class="btn-sm bg-warning ml-3 font-weight-bold">근무중</div>
									</div>
									<div class="row flex-column px-3 ml-3">
										<div><span>출근</span><span class="ml-5">09:00</span></div>
										<div><span>퇴근</span><span class="ml-5">18:00</span></div>
										<div><span>누적근로시간</span><span class="ml-2">8:00:00</span></div>
									</div>
									<div id="middle_box" class="row justify-content-start mt-5">
										<div class="h3 font-weight-bold m-0">최근 메일 내역</div>
									</div>
									<div class="row flex-column px-3 py-2 ml-2">
										<div id="mail_mini_box" class="d-flex align-items-center">
											<div id="mini_box_font" class="d-flex align-items-center">받은메일</div>
											<div id="mini_box_number">0</div>
										</div>
										<div id="mail_mini_box" class="d-flex align-items-center">
											<div id="mini_box_font" class="d-flex align-items-center">안읽음</div>
											<div id="mini_box_number">0</div>
										</div>
										<div id="mail_mini_box" class="d-flex align-items-center">
											<div id="mini_box_font" class="d-flex align-items-center">임시저장</div>
											<div id="mini_box_number">0</div>
										</div>
										<div id="mail_mini_box" class="d-flex align-items-center">
											<div id="mini_box_font" class="d-flex align-items-center">중요메일</div>
											<div id="mini_box_number">0</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 마이페이지/로그아웃/최근결재/사내공지/달력 -->
							<div class="col-10">
								<div class="row align-items-center" style="border-bottom: 3.4px solid black;">
									<div class="col font-weight-bold" style="font-size: 60px;">HOME</div>
									<div class="col d-flex justify-content-end">
										<!-- 마이페이지/로그아웃 버튼 -->
										<div id="header_box">
											<div class="w-50">
												<a class="text-white" href="${pageContext.request.contextPath}/member/logout">
													<div>
														<img src="${pageContext.request.contextPath}/resources/images/person_white.png" 
															 width="30" height="30" class="d-inline-block align-top">
													</div>
													 <div>마이페이지</div>
												</a>
											</div>
											<div class="w-50">
												<a class="text-white" href="${pageContext.request.contextPath}/member/logout">
													<div>
														<img src="${pageContext.request.contextPath}/resources/images/unlock.png" 
															 width="30" height="30" class="d-inline-block align-top">
													</div>
													 <div>로그아웃</div>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col pl-5">
										<!-- ===[결재내역]======================================================================================================= -->
										<div class="row mt-5">
											<div id="recent_approval_box" class="d-flex flex-column" style="width:100%; padding-bottom: 20px;">
										        <div class="container" style="height: 30%;">
										            <div class="row mt-2 mb-1">
										                <div class="col approval-status">최근 결재내역</div>
										                <div class="col approval-status d-flex justify-content-end align-items-end">
										                	<img src="${pageContext.request.contextPath}/resources/images/plus.png" 
						 										 width="35" height="35">
										                </div>
										            </div>
										            <div>
											            <div class="custom-line"></div>
											            <div class="row">
											                <div class="col">
											                    <div class="notify-specific-status">기안</div>
											                    <div class="specific-status-data">0</div>
											                </div>
											                <div class="vertical-line"></div>
											                <div class="col">
											                    <div class="notify-specific-status">결재</div>
											                    <div class="specific-status-data">0</div>
											                </div>
											                <div class="vertical-line"></div>
											                <div class="col">
											                    <div class="notify-specific-status">승인</div>
											                    <div class="specific-status-data" style="color: #FF5050;">0</div>
											                </div>
											                <div class="vertical-line"></div>
											                <div class="col">
											                    <div class="notify-specific-status">반려</div>
											                    <div class="specific-status-data" style="color: #FF5050;">0</div>
											                </div>
											            </div>
										            </div>
										            <div class="px-3">
										            	<table class="table" style="margin-bottom: 0px;">
										            		<tbody>
										            			<tr>
										            				<td style="width:10%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">문서번호</td>
										            				<td style="width:50%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">제목</td>
										            				<td style="width:10%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">작성자</td>
										            				<td style="width:30%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">날짜</td>
										            			</tr>
										            			<tr class="table-line">
										            			</tr>
										            			<tr class="my-1 table-body-hover">
										            				<td class="col-2">1</td>
										            				<td class="col-6">행복한 회사에는 행복한 복지가 있다.</td>
										            				<td class="col-2">김복지</td>
										            				<td class="col-2">2023/02/07</td>
										            			</tr>
										            			<tr class="my-1 table-body-hover">
										            				<td>2</td>
										            				<td>2023년 3월 인사발령건 공지</td>
										            				<td>이인사</td>
										            				<td>2023/02/08</td>
										            			</tr>
										            			<tr class="my-1 table-body-hover">
										            				<td>3</td>
										            				<td>휴가 관련 공지있습니다.</td>
										            				<td>한휴가</td>
										            				<td>2023/02/09</td>
										            			</tr>
										            		</tbody>
										            	</table>
										            </div>
										        </div>
									        </div>
										 </div>
										 <!-- ===[사내공지]======================================================================================================= -->
									 	<div class="row mt-5">
											<div id="notice_box" class="d-flex flex-column" style="width:100%; padding-bottom: 20px;">
									           	<div class="container text-for-list" style="height: 30%;">
										            <div class="row mt-2">
										                <div class="col approval-status">최근 사내공지</div>
										                <div class="col approval-status d-flex justify-content-end align-items-center">
										                	<img src="${pageContext.request.contextPath}/resources/images/plus.png" 
						 										 width="35" height="35">
										                </div>
										            </div>
										            <div class="px-3">
										            	<table class="table" style="margin-bottom: 0px;">
										            		<tbody>
										            			<tr>
										            				<td style="width:10%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">문서번호</td>
										            				<td style="width:50%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">제목</td>
										            				<td style="width:10%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">작성자</td>
										            				<td style="width:30%; vertical-align:middle; font-size:16px; font-weight: 700; border: none; padding-bottom: 0px;">작성날짜</td>
										            			</tr>
										            			<tr class="table-line">
										            			</tr>
										            			<tr class="my-1 table-body-hover">
										            				<td class="col-2">1</td>
										            				<td class="col-6">행복한 회사에는 행복한 복지가 있다.</td>
										            				<td class="col-2">김복지</td>
										            				<td class="col-2">2023/02/07</td>
										            			</tr>
										            			<tr class="my-1 table-body-hover">
										            				<td>2</td>
										            				<td>2023년 3월 인사발령건 공지</td>
										            				<td>이인사</td>
										            				<td>2023/02/08</td>
										            			</tr>
										            			<tr class="my-1 table-body-hover">
										            				<td>3</td>
										            				<td>휴가 관련 공지있습니다.</td>
										            				<td>한휴가</td>
										            				<td>2023/02/09</td>
										            			</tr>
										            		</tbody>
										            	</table>
										            </div>
										        </div>
									        </div>
										 </div>
									 </div>
									<!-- ===[달력]======================================================================================================= -->
									<div class="col">
										<%@ include file="/WEB-INF/views/calendar/home_page.jsp" %>
									</div>
								</div>
							</div>
							<!-- ***************************************************** -->
						</div>
					</div>
				</div>		
			</div>
		</div>
	</body>
</html>
