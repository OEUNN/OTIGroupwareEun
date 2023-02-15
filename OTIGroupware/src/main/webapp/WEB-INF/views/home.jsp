<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		
	</head>
	
	<body>
<%-- 			<%@ include file="/WEB-INF/views/common/top.jsp" %> --%>
		<div class="d-flex flex-column vh-100">
			<div class="flex-grow-1">
				<div id="main_row">
					<!-- 사이드바 -->
					<div id="main_menu">
						<%@ include file="/WEB-INF/views/common/menu.jsp" %>
					</div>
					
					<!-- 내용 -->
					<div id="main_content" class="container row p-3">
						<!-- ***************************************************** -->
							<%@ include file="/WEB-INF/views/common/content_template.jsp" %>
						<!-- ***************************************************** -->
					</div>
				</div>		
			</div>
			<%@ include file="/WEB-INF/views/common/bottom.jsp" %>
		</div>
	</body>
</html>
