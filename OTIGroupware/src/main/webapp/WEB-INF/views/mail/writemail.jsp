<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>		
	</head>
	<script>
        function address(){
            var url = "addresspopup";
            var name = "employee address";
            var option = "width = 500, height = 700, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
            window.open(url, name, option);
        }
		</script>
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
								<div class="h3 font-weight-bold mx-5 mt-2 col">
									<p style="margin:0px;">메일 쓰기</p>
								</div>
								<div class="col-1">
									<button class="temp-btn m-1" type="submit" style="height:40px;">임시저장</button>
								</div>
								<div class="col-1">
									<button class="send-btn m-1" type="submit" style="height:40px;">전송</button>
								</div>
						</div>
							<div style="border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
							<div class="container" style="margin-top:50px;">
					            <!-- 쓰기 부분 -->
					            <div class="row mailwrite my-3" style="width:50%;">
					            	<div class="col-2 mt-1">발신인</div>
					            	<input class="col" type="text">
					            </div>
					           <div class="row mailwrite my-3 pr-3" >
					            	<div class="col-1 mt-1">수신인</div>
					            	<input class="col mt-1 " type="text">
					            	<div class="col-2 pb-1">
					            		<button class="mailaddress" onclick="address()">주소록</button>
					            	</div>
					            	
					            </div>
					            <div class="row mailwrite my-3">
					            	<div class="col-1 mt-1">제목</div>
					            	<input class="col mt-1" type="text">
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
						</div>

					</div>
				</div>		
			</div>
		</div>
	</body>
</html>
