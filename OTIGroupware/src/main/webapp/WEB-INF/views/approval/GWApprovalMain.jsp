<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		<link rel="stylesheet" type="text/css" href="/groupware/resources/css/approvalMain.css">
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
					<div id="main_content" class="container-fluid row">
						<!-- 서브메뉴 -->
						<div id="sub_menu" class="col-1">
							<%@ include file="/WEB-INF/views/approval/submenu.jsp" %>
						</div>

						<div class="col">
							<div id="content_sub_menu" class="row mt-4">
								<div class="h3 font-weight-bold mx-5 mt-2">
									<a href="#">링크1</a>
								</div>
								<div class="h3 font-weight-bold mx-3 mt-2">
									<a href="#">링크2</a>
								</div>
							</div>
							<div style="width:95%; border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
							<div class="d-flex mt-5" style="width: 95%;">
							    <div class="d-flex flex-column" style="width: 100%; padding-bottom: 100px;">
							        <div class="container" style="height: 30%;">
							            <div class="row mb-1">
							                <div class="col title-section">이번 달 결재 현황</div>
							            </div>
							            <div class="p-3">
								            <div class="custom-line"></div>
								            <div class="row">
								                <div class="col">
								                    <div class="title-status" style="text-align:center; margin-top: 10%;">
														결재 대기 중
								                    </div>
								                    <div class="content-status" style="text-align:center; margin-top: 10%;">
								                        0
								                    </div>
								                </div>
								                <div class="vertical-line"></div>
								                <div class="col">
								                    <div class="title-status" style="text-align:center; text-align:center; margin-top: 10%;">
														기안한 문서
								                    </div>
								                    <div class="content-status" style="text-align:center; margin-top: 10%;">
								                        0
								                    </div>
								                </div>
								                <div class="vertical-line"></div>
								                <div class="col">
								                    <div class="title-status" style="text-align:center; margin-top: 10%;">
														반려된 문서
								                    </div>
								                    <div class="content-status" style="text-align:center; margin-top: 10%;color: #DD0000;">
								                        0
								                    </div>
								                </div>
								            </div>
							            </div>
							        </div>
							        <div class="container" style="height: 30%;"></div>
							        <div class="container" style="height: 30%;">
							            <div class="row mt-2">
							                <div class="col title-section">최근에 처리한 결재 문서</div>
							            </div>
							            <div class="p-3">
							            	<table class="table" style="margin-bottom: 0px;">
							            		<tbody>
							            			<tr>
							            				<td class="col-6 title-board" style="vertical-align:middle; border: none; padding-bottom: 0px;">문서 제목</td>
							            				<td class="col-5 title-board" style="vertical-align:middle; border: none; padding-bottom: 0px;">결재 상태</td>
							            				<td class="col-1" style="border: none; padding-bottom: 0px;"><button class="list-button" onclick="location.href=''"><img src="${pageContext.request.contextPath}/resources/images/plus.png"/></button></td>
							            			</tr>
							            			<tr class="table-line">
							            			</tr>
							            			<tr class="my-1 table-body-hover">
							            				<td class="col-6 content-board">휴가 신청합니다</td>
							            				<td class="col-5 content-board">완결</td>
							            				<td class="col-1"></td>
							            			</tr>
							            			<tr class="my-1 table-body-hover">
							            				<td class="col-6 content-board">제안서 올립니다</td>
							            				<td class="col-5 content-board">결재중</td>
							            				<td class="col-1"></td>
							            			</tr>
							            			<tr class="my-1 table-body-hover">
							            				<td class="col-6 content-board">지출품의서 올렸습니다</td>
							            				<td class="col-5 content-board">완결</td>
							            				<td class="col-1"></td>
							            			</tr>
							            		</tbody>
							            	</table>
							            </div>
							        </div>
							    </div>
							    <div class="d-flex flex-column p-3" style="width: 100%; background-color: #D9D9D9; border-radius: 20px;">
							        <div class="container p-4" style="background-color: white; border-radius: 20px; height: 100%;">
							        	<div class="row mt-2">
							                <div class="col title-section">처리해야 할 결재 문서</div>
							            </div>
							            <div class="p-3">
							            	<table class="table" style="margin-bottom: 0px;">
							            		<tbody>
							            			<tr>
							            				<td class="col-6 title-board" style="vertical-align:middle; border: none; padding-bottom: 0px;">문서 번호</td>
							            				<td class="col-5 title-board" style="vertical-align:middle; border: none; padding-bottom: 0px;">문서 제목</td>
							            				<td class="col-1" style="border: none; padding-bottom: 0px;"><button class="list-button" onclick="location.href=''"><img src="${pageContext.request.contextPath}/resources/images/plus.png"/></button></td>
							            			</tr>
							            			<tr class="table-line">
							            			</tr>
							            			<tr class="my-1 table-body-hover">
							            				<td class="col-6 content-board">01-111</td>
							            				<td class="col-5 content-board">결재 부탁드립니다.</td>
							            				<td class="col-1"></td>
							            			</tr>
							            			<tr class="my-1 table-body-hover">
							            				<td class="col-6 content-board">02-222</td>
							            				<td class="col-5 content-board">결재 부탁드립니다.</td>
							            				<td class="col-1"></td>
							            			</tr>
							            			<tr class="my-1 table-body-hover">
							            				<td class="col-6 content-board">03-333</td>
							            				<td class="col-5 content-board">결재 부탁드립니다.</td>
							            				<td class="col-1"></td>
							            			</tr>
							            		</tbody>
							            	</table>
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