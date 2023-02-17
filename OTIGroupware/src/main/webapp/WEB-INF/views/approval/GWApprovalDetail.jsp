<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		<link rel="stylesheet" type="text/css" href="/groupware/resources/css/approvalForm.css">
		<link rel="stylesheet" type="text/css" href="/groupware/resources/css/card.css">
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
								<div class="col-1 h3 font-weight-bold mx-5 mt-2">
									01-111
								</div>
								<div class="col-4 h3 font-weight-bold mx-5 mt-2">
									공공사업1DIV 인력충원 요청
								</div>
								<div class="col-1 h3 font-weight-bold mx-5 mt-2" style="text-align: center;">
									오상식
								</div>
							</div>
							<div style="border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
							<section style="width:95%;">
								<article class="mt-2 mb-5" style="display: flex; justify-content: center;">
									<%@ include file="/WEB-INF/views/approval/GWApprovalExtraWorkForm.jsp" %>							
								</article>
								<div style="border-bottom: 3px solid #B3B3B3;"></div>
								<article class="my-2" style="display: flex;">
									<div class="title-board" style="position: relative; left: 4%;">결재선</div>
								</article>
								<article class="mb-5" style="background-color: #F0F0F0; border-radius: 10px; width: 92%; position: relative; left: 4%;">
									<table style="border-collapse: separate; border-spacing: 15px;">
										<tbody>
											<tr>
												<td class="approval-card">
													<div class="approval-card-body">
														<div class="content-card approval-card-header" style="flex: 1;">
															<div>1</div>
														</div>
														<div class="content-card approval-card-main" style="flex: 3;">
															<div>마부장</div>
															<div class="detail-card">공공사업1DIV</div>
														</div>
														<div class="content-card approval-card-footer" style="flex: 1;">
															<div>승인</div>
														</div>											
													</div>
												</td>
												<td><img src="${pageContext.request.contextPath}/resources/images/arrow.png" style="width: 30px; height: 30px;"/></td>
												<td class="approval-card">
													<div class="approval-card-body">
														<div class="content-card approval-card-header" style="flex: 1;">
															<div>2</div>
														</div>
														<div class="content-card approval-card-main" style="flex: 3;">
															<div>최전무</div>
															<div class="detail-card">공공사업1DIV</div>
														</div>
														<div class="content-card approval-card-footer" style="flex: 1;">
															<div>열람</div>
														</div>									
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</article>
							</section>
							<!-- ***************************************************** -->
						</div>
					</div>
				</div>		
			</div>
		</div>
	</body>
</html>