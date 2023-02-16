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
					
					<!-- 헤더 -->
					<%@ include file="/WEB-INF/views/common/top.jsp" %>
					
					<!-- 내용 -->
					<div id="main_content" class="container-fluid row p-3">
						<!-- 서브메뉴 -->
						<div id="sub_menu" class="col-2">
							<%@ include file="/WEB-INF/views/mail/submenu.jsp" %>
						</div>

						<div class="col-10">
							<div id="content_sub_menu" class="row mt-4">
								<div class="h3 font-weight-bold mx-5 mt-2">
									<p href="#">받은 메일</p>
								</div>
							</div>
							<div style="width:95%; border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
							<div class="container-fluid">
								<div class="row"></div>
								<div class="row"></div>
								<div class="row"></div>
								<div class="row"></div>
							</div>
							<!-- ***************************************************** -->
						</div>

					</div>
				</div>		
			</div>
		</div>
	</body>
</html>
