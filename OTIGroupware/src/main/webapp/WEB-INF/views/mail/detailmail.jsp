<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>		
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
							<%@ include file="/WEB-INF/views/mail/submenu.jsp" %>
						</div>

						<form class="col">
							<div id="content_sub_menu" class="row mt-4">
								<button class="col-1 "style="margin:auto;">
									<img src="${pageContext.request.contextPath}/resources/images/star.png" style="width:35x; height:35px"></img>
								</button>
								<div class="h3 font-weight-bold mt-2 col" style="text-align:left;">
									<p style="margin:0px;">제목</p>
								</div>
				            	<div class="col-1">
				            		<button class="temp-btn" type="submit" style="height:40px;">답장</button>
				            	</div>
				            	<div class="col-1">
				            		<button class="temp-btn" type="submit" style="height:40px;">전달</button>
				            	</div>
				            	<div class="col-1">
				            		<button class="send-btn	" type="submit" style="height:40px;">휴지통</button>
				            	</div>
							</div>
							<div style="border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
							<div class="container" style="margin-top:50px;">
					            <!-- 쓰기 부분 -->
					            <div class="row mailwrite my-3" style="width:50%;">
					            	<div class="col-2 mt-1">발신인</div>
					            	<input class="col" type="text" readonly>
					            </div>
					           <div class="row mailwrite my-3 pr-3" >
					            	<div class="col-1 mt-1">수신인</div>
					            	<input class="col mt-1 " type="text" readonly>
					            	
					            </div>
					            <div class="row my-3">
					            	<div class="col-1 mt-1" style="colro:#d9d9d9; font-size:15px;"> 받은 날짜 </div>
					            </div>
					            <div class="row mailfile my-3">
					            	<div class="col-1 mt-1">파일첨부</div>
					            	<input class="col" type="file" style="border:1px solid #d9d9d9; height:100px;">
					            </div>
					            <div class="row mailwrite my-3">
					            	<div class="col-1 my-3 mt-1">content</div>
					            	<input class="col" type="text">
					            </div>
					        </div>
							<!-- ***************************************************** -->
						</form>

					</div>
				</div>		
			</div>
		</div>
	</body>
</html>
