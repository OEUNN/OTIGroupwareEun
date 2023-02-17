<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<!-- CSS, JavaScript 적용↓ -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css"/>		
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
							<%@ include file="/WEB-INF/views/board/submenu.jsp" %>
						</div>

						<div class="col">
							<div id="content_sub_menu" class="row mt-4">
								<div class="h3 font-weight-bold mt-2 ml-5 col" style="text-align:left;">
									<p style="margin:0px;">사내 공지</p>
								</div>
				            	<div class="col-1">
				            		<button class="write-btn" type="submit" style="height:40px;">게시글 쓰기</button>
				            	</div>
							</div>
							<div style="border-bottom: 3px solid #B3B3B3;"></div>
							<!-- ***************************************************** -->
							<div class="container text-for-list" style="margin-top: 20px;">
								<form class="row">
									<div class="col-1">
										<select class="greybtn">
											<option>전체</option>
											<option>제목</option>
											<option>작성자</option>
											<option>작성 날짜</option>
										</select>
									</div>
									<div class="col-2 container-fluid">
										<div class="row">
											검색어&ensp;
											<input class="col greybtn" type="text">
										</div>
									</div>
									<div class="col-6 container-fluid">
										<div class="row">
											작성기간&ensp;
											<input class="col greybtn" type="date"> &ensp; ~ &ensp;
											<input class="col greybtn" type="date">
										</div>
									</div>
									<div class="col"></div>
									<input type="submit" class="col-1 sub-btn" value="검색" >
								</form>
								<div style="height: 50%; border-bottom: 2px solid #d9d9d9;margin-top:40px;">
									<table class="table" style="margin-bottom: 0px;">
										<tr>
											<th class="col-1">
												<input type="checkbox">
											</th>
											<th class="col-1">첨부파일</th>
											<th class="col-5">제목</th>
											<th class="col-2">작성자</th>
											<th class="col-3">작성 날짜</th>
										</tr>
										<tr class="my-1 table-body-hover">
											<td>
												<input type="checkbox">
											</td>
											<td>
												<img src="${pageContext.request.contextPath}/resources/images/clip.png" style="width: 20px; height: 20px"></img>
											</td>
											<td>?????????</td>
											<td>장영은</td>
											<td></td>
										</tr>
										<tr class="my-1 table-body-hover">
											<td>
												<input type="checkbox">
											</td>
											<td>
												<img src="${pageContext.request.contextPath}/resources/images/clip.png" style="width: 20px; height: 20px"></img>
											</td>
											<td>문서 수발</td>
											<td>신문영</td>
											<td></td>
										</tr>
										<tr class="my-1 table-body-hover">
											<td>
												<input type="checkbox">
											</td>
											<td>
												<img src="${pageContext.request.contextPath}/resources/images/clip.png" style="width: 20px; height: 20px"></img>
											</td>
											<td>오늘 점심은 스파게티 입니다.</td>
											<td>한송민</td>
											<td></td>
										</tr>
									</table>
								</div>
								<div class="row mt-3">
									<div class="col-3"></div>
									<div class="col paging-text">처음 이전 1 2 3 4 5 다음 끝</div>
									<div class="col-3"></div>
								</div>
								<div class="row">
									<div class="col-2">
										<button class="delete-button">선택 삭제</button>
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
