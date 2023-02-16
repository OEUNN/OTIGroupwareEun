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

						<div class="col">
							<div id="content_sub_menu" class="row mt-4">
								<div class="h3 font-weight-bold mx-5 mt-2">
									<p >받은 메일</p>
								</div>
							</div>
							<div style="width:95%; border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
								<div class="container text-for-list" style="margin-top:70px;">
						            <div style="height: 50%; border-bottom:2px solid #d9d9d9;">
						            	<table class="table" style="margin-bottom: 0px;">
					            			<tr>
					            				<th class="col-1">
				            						<input class=" pr-0" type="checkbox">
													<div class="dropdown pl-0 ">
														<button class="dropbtn">
															<img src="${pageContext.request.contextPath}/resources/images/pngwing.png"style=" width:10px; height:10px;"></img>
														</button>
														<div class="dropdown-content">
															<a href="#">전체선택</a>
															<a href="#">읽은메일</a>
															<a href="#">읽지않은메일</a>
															<a href="#">중요메일</a>
															<a href="#">중요표시안한메일</a>
														</div>
													</div>
					            				</th>
					            				<th class="col-3" >발신인</th>
					            				<th class="col-5" >제목</th>
					            				<th class="col-3" >날짜</th>
					            			</tr>
					            			<tr class="my-1 table-body-hover">
					            				<td>
		            								<input type="checkbox" >
		            								<button>
					            						<img src="${pageContext.request.contextPath}/resources/images/star.png" style="width:20px; height:20px"></img>
					            					</button>
					            				</td>
					            				<td>휴가 신청합니다</td>
					            				<td>완결</td>
					            				<td></td>
					            			</tr>
					            			<tr class="my-1 table-body-hover">
					            				<td>
					            					<input type="checkbox" >
					            					<button>
					            						<img src="${pageContext.request.contextPath}/resources/images/star.png" style="width:20px; height:20px"></img>
					            					</button>
					            				</td>
					            				<td>제안서 올립니다</td>
					            				<td>결재중</td>
					            				<td></td>
					            			</tr>
					            			<tr class="my-1 table-body-hover">
					            				<td>
					            					<input type="checkbox" >
					            					<button>
					            						<img src="${pageContext.request.contextPath}/resources/images/star.png" style="width:20px; height:20px"></img>
					            					</button>
					            				</td>
					            				<td>지출품의서 올렸습니다</td>
					            				<td>완결</td>
					            				<td></td>
					            			</tr>
						            	</table>
						            </div>
						             <div class="row mt-3"  >
						             	<div class="col-3"></div>
						             	<div class="col paging-text">처음 이전 1 2 3 4 5 다음 끝</div>
						             	<div class="col-3"></div>
						             </div>
						             <div class="row">
						             	<div class="col-2">
						             		<button class="delete_button">선택 삭제</button>
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
