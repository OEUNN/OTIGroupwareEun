<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		
	</head>
	
	<body>
		<div class="d-flex flex-column vh-100">
			<div class="flex-grow-1">
				<div id="main_row">
					<!-- 메인메뉴 -->
					<div id="main_menu">
						<%@ include file="/WEB-INF/views/common/menu.jsp" %>
					</div>
					
					<!-- 내용 -->
					<div id="main_content" class="container-fluid row">
						<!-- ***************************************************** -->
						<div class="col-2" style="border-right: 3px solid #2F2642; height:100vh;">
							<div class="row justify-content-center mt-3">
								<img src="${pageContext.request.contextPath}/resources/images/person.png" width="200" class="bg-secondary">
							</div>
							<div class="row justify-content-center">
								<div class="ml-2 flex-column">
									<span id="emp_name">홍길동</span>
									<span id="emp_position">사원</span>
									<div id="emp_dep" class="ml-0">공공사업1DIV</div>
								</div>
							</div>
							<div id="quick_btn" class="row mt-3 pl-2">
								<div class="col">
									<button class="btn btn-sm">메일쓰기</button>
									<button class="btn btn-sm">휴가신청</button>
								</div>
								<div class="col">
									<button class="btn btn-sm">결재신청</button>
									<button class="btn btn-sm">개인정보수정</button>
								</div>
							</div>
							<div id="middle_box" class="row justify-content-start align-items-center mt-3">
								<div class="h3 font-weight-bold">나의 근무</div>
								<div class="btn-sm bg-warning ml-3">근무중</div>
							</div>
							<div class="row flex-column px-3 py-2 ml-3">
								<div><span>출근</span><span class="ml-5">09:00</span></div>
								<div><span>퇴근</span><span class="ml-5">18:00</span></div>
								<div><span>누적근로시간</span><span class="ml-2">8:00:00</span></div>
							</div>
							<div id="middle_box" class="row justify-content-start mt-3">
								<div class="h3 font-weight-bold">최근 메일 내역</div>
							</div>
							<div class="row flex-column px-3 py-2 ml-3">
								<div id="mail_mini_box" class="d-flex align-items-center">
									<div id="mini_box_font" class="d-flex align-items-center ml-2">받은메일</div>
									<div id="mini_box_number" class="ml-4">0</div>
								</div>
								<div id="mail_mini_box" class="d-flex align-items-center">
									<div id="mini_box_font" class="d-flex align-items-center ml-2">안읽음</div>
									<div id="mini_box_number" class="ml-4">0</div>
								</div>
								<div id="mail_mini_box" class="d-flex align-items-center">
									<div id="mini_box_font" class="d-flex align-items-center ml-2">임시저장</div>
									<div id="mini_box_number" class="ml-4">0</div>
								</div>
								<div id="mail_mini_box" class="d-flex align-items-center">
									<div id="mini_box_font" class="d-flex align-items-center ml-2">중요메일</div>
									<div id="mini_box_number" class="ml-4">0</div>
								</div>
							</div>
						</div>
						
						<div class="col-10">
							<div class="row align-items-center" style="border-bottom: 2px solid black;">
								<div class="col h1 font-weight-bold mt-5">HOME</div>
								<div class="col d-flex justify-content-end">
									<div id="header_box">
										<a class="text-white" href="${pageContext.request.contextPath}/member/logout">
											<div>
												<img src="${pageContext.request.contextPath}/resources/images/person_white.png" 
													 width="40" height="40" class="d-inline-block align-top">
											</div>
											 <div>마이페이지</div>
										</a>
										<a class="text-white" href="${pageContext.request.contextPath}/member/logout">
											<div>
												<img src="${pageContext.request.contextPath}/resources/images/unlock.png" 
													 width="40" height="40" class="d-inline-block align-top">
											</div>
											 <div>로그아웃</div>
										</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<!-- ===[결재내역]======================================================================================================= -->
									<div class="row mt-5">
										<div class="d-flex flex-column" style="width:100%; padding-bottom: 100px;">
									        <div class="container" style="height: 30%;">
									            <div class="row mb-1">
									                <div class="col approval-status">이번 달 결재 현황</div>
									            </div>
									            <div>
										            <div class="custom-line"></div>
										            <div class="row">
										                <div class="col">
										                    <div class="notify-specific-status">
										                        결재 대기 중
										                    </div>
										                    <div class="specific-status-data">
										                        0
										                    </div>
										                </div>
										                <div class="vertical-line"></div>
										                <div class="col">
										                    <div class="notify-specific-status">
										                        기안한 문서
										                    </div>
										                    <div class="specific-status-data">
										                        0
										                    </div>
										                </div>
										                <div class="vertical-line"></div>
										                <div class="col">
										                    <div class="notify-specific-status">
										                        반려된 문서
										                    </div>
										                    <div class="specific-status-data" style="color: #FF5050;">
										                        0
										                    </div>
										                </div>
										            </div>
									            </div>
									        </div>
								        </div>
									</div>
									<!-- ===[사내공지]======================================================================================================= -->
									<div class="row">사내공지</div>
								</div>
								<!-- ===[달력]======================================================================================================= -->
								<div class="col">
									달력
								</div>
							</div>
						</div>
						
						</div>
						<!-- ***************************************************** -->
					</div>
				</div>		
			</div>
		</div>
	</body>
</html>
