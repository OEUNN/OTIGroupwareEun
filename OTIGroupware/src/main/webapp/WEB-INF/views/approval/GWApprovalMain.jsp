<%@ page contentType="text/html; charset=UTF-8" %>
<style>
.approval-status, .text-for-List .approval-status {
    font-size: 30px;
    font-weight: 700;
    line-height: 150%;
}

.notify-specific-status {
    font-size: 18px;
    font-weight: 700;
    line-height: 150%;
    text-align: center;
    margin-top: 10%;
}

.specific-status-data {
    font-size: 36px;
    font-weight: 700;
    line-height: 150%;
    text-align: center;
    margin-bottom: 10%;
}

.text-for-list * {
    font-size: 22px;
    font-weight: 700;
    line-height: 150%;
}

.custom-line {
	background-color: #2C3639;
    height: 4px;
    border: 2px solid #2C3639;
    transform: rotate(0.42deg);
}

.list-line {
	background-color: #2C3639;
    height: 1px;
    border: 0px solid #2C3639;
    transform: rotate(0.42deg);
}
.list-button {
	background-color: transparent;
}


.vertical-line {
	background-color: #D9D9D9;
    width: 4px;
    border: 2px solid #D9D9D9;
    transform: rotate(0.42deg);
    margin-top: 20px;
    margin-bottom: 20px;
}
</style>
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
					
					<!-- 헤더 -->
					<%@ include file="/WEB-INF/views/common/top.jsp" %>
					
					<!-- 내용 -->
					<div id="main_content" class="container-fluid row p-3">
						<!-- 서브메뉴 -->
						<div id="sub_menu" class="col-1">
							<%@ include file="/WEB-INF/views/submenu.jsp" %>
						</div>

						<div class="col-11">
							<div id="content_sub_menu" class="row mt-4">
								<div class="h3 font-weight-bold mx-5 mt-2">
									결재 메인
								</div>
							</div>
							<div style="width:95%; border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
							<div class="d-flex mt-5" style="width: 95%;">
							    <div class="d-flex flex-column" style="width: 100%; padding-bottom: 100px;">
							        <div class="container" style="height: 30%;">
							            <div class="row mb-1">
							                <div class="col approval-status">이번 달 결재 현황</div>
							            </div>
							            <div class="p-3">
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
								                    <div class="specific-status-data" style="color: #DD0000;">
								                        0
								                    </div>
								                </div>
								            </div>
							            </div>
							        </div>
							        <div class="container" style="height: 30%;"></div>
							        <div class="container text-for-list" style="height: 30%;">
							            <div class="row mt-2">
							                <div class="col approval-status">최근에 처리한 결재 문서</div>
							            </div>
							            <div class="p-3">
								            <div class="row mb-2">
								                <div class="col-5 d-flex align-items-end">문서 제목</div>
								                <div class="col-5 d-flex align-items-end">결재 상태</div>
								                <div class="col-2 d-flex justify-content-center">
								                	<button class="list-button" onclick="location.href=''"><img src="${pageContext.request.contextPath}/resources/images/plus.png"/></button>
								                </div>
								            </div>
								            <div class="custom-line"></div>
								            <div class="row my-1">
								                <div class="col-5">휴가 신청합니다</div>
								                <div class="col-5">완결</div>
								            </div>
								            <div class="list-line"></div>
								            <div class="row my-1">
								                <div class="col-5">제안서 올립니다</div>
								                <div class="col-5">결재중</div>
								            </div>
								            <div class="list-line"></div>
								            <div class="row my-1">
								                <div class="col-5">지출품의서 올렸습니다</div>
								                <div class="col-5">완결</div>
								            </div>
								            <div class="list-line"></div>
							            </div>
							        </div>
							    </div>
							    <div class="d-flex flex-column p-3" style="width: 100%; background-color: #D9D9D9; border-radius: 20px;">
							        <div class="container text-for-list p-4" style="background-color: white; border-radius: 20px; height: 100%;">
							            <div class="row my-2">
							                <div class="col approval-status">처리해야 할 결재 문서</div>
							            </div>
							            <div class="p-3">
								            <div class="row mb-2">
								                <div class="col-4 d-flex align-items-end">문서 번호</div>
								                <div class="col-6 d-flex align-items-end">문서 제목</div>
								                <div class="col-2 d-flex justify-content-center"><img src="${pageContext.request.contextPath}/resources/images/plus.png"/></div>
								            </div>
								            <div class="custom-line"></div>
								            <div class="row my-1">
								                <div class="col-4">01-111</div>
								                <div class="col">결재해주세요</div>
								            </div>
								            <div class="list-line"></div>
								            <div class="row my-1">
								                <div class="col-4">02-222</div>
								                <div class="col">결재해주세요</div>
								            </div>
								            <div class="list-line"></div>
								            <div class="row my-1">
								                <div class="col-4">03-333</div>
								                <div class="col">결재해주세요</div>
								            </div>
								            <div class="list-line"></div>
							            </div>
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