<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${pageContext.request.contextPath}/resources/js/template.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/todolist.js"></script>

<style>
	.table th, .jsgrid .jsgrid-table th,
	.table td,
	.jsgrid .jsgrid-table td {
		padding: 0.125rem 2.375rem;
	}
	.etooltip {
	  position: relative;
	  display: inline-block;
	}
	
	.etooltip .etooltiptext {
	  visibility: hidden;
	  width: 250px;
	  background-color: #4849ac;
	  color: #fff;
	  text-align: left;
	  border-radius: 6px;
	  padding: 3px 3px;
	  position: absolute;
	  z-index: 1;
	  top: -5px;
	  left: 170%;
	  margin-left: -60px;
	  
	  /* Fade in tooltip - takes 1 second to go from 0% to 100% opac: */
	  opacity: 0;
	  transition: opacity 1s;
	}
	
	.etooltip:hover .etooltiptext {
	  visibility: visible;
	  opacity: 1;
	}
</style>
<div class="card">
	<div class="card-body">
		<h4 class="card-title">휴지통</h4>
		<!-- 검색 태그 -->
		<div class="row justify-content-between px-5 py-3">
			<div class="form-inline" style="border-bottom:1px solid #e9ecef;border-top:1px solid #e9ecef;">
				<div class="px-3 py-1 ahover">
					<div style="color:grey;">휴지통에 들어온지 30일 지난면 자동 삭제됩니다.</div>
				</div>
			</div>
			<input type="hidden" id="searchBtn"/>
			<div class="d-flex justify-content-end">
				<div id="searchForm" class="d-flex" >
     				<div style="border-radius:18px; border:1px solid #e9ecef;display: flex;">
						<div class="input-group-prepend hover-cursor mx-3">
							<span class="input-group-text" id="search" style="background: transparent; border: 0; color: #000; padding: 0;">
								<i class="icon-search" style="font-size: 1.25rem; color: #6C7383;"></i>
							</span>
						</div>
						<input type="text" id="searchBar" class="align-self-center" style="border:none;width:100%;">
					</div>
					<button onclick="submitForm()" class="font-weight-bold btn btn-md btn-warning ml-2">검색</button>
       			</div>
			</div>
		</div><!-- 검색 태그 -->
		<!-- 테이블 -->
		<div class="table-responsive p-4 pb-5">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class=" form-inline col-1" style="border:none;">
							<div class="form-check font-weight-bold text-info">
								<label class="form-check-label">
									<input type="checkbox" class="form-check-input"  name='selectall' onclick="selectAll(this)">
								</label>
							</div>
						</th>
						<th class="col-1 pb-3" style="font-size:15px;">첨부</th>
						<th class="col-1 pb-3" style="font-size:15px;">ID</th>
						<th class="col-7 pb-3" style="font-size:15px;">제목</th>
						<th class="col-2 pb-3" style="font-size:15px;">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty sendmail}">
						<c:forEach items="${sendmail}" var="send">
							<c:if test="${send.tbName =='received'}">
								<c:forEach items="${send.empList}" var="emp">
									<c:if test="${emp.empId == sessionScope.employee.empId}">
										<c:if test="${emp.readYN == 'Y'}">
											<tr style="color:#a2a2a3;">
										</c:if>
										<c:if test="${emp.readYN == 'N'}">
											<tr>
										</c:if>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${send.tbName =='send' }">
								<tr>
							</c:if>
								<td class="form-inline pr-0 p1-2">
									<div class="form-check font-weight-bold text-info">
										<label class="form-check-label">
											<input type="checkbox" class="form-check-input" name="optradio" onclick="checkSelectAll()" value="${send.sendMailId}">
										</label>
									</div>
								</td>
								<td>
									<c:if test="${send.fileYN == 'Y'}">
										<i class="h3 mdi mdi-paperclip text-info"></i>
									</c:if>
								</td>
								<td>
									<c:if test="${send.tbName =='send' }">
										<i class="mdi mdi-arrow-right-bold text-success"></i>
									</c:if>
									<c:if test="${send.tbName =='received' }">
										<i class="mdi mdi-arrow-left text-danger"></i>
									</c:if>
									
									<c:if test="${send.tbName =='received' }">
										<span>(${send.depName}) ${send.empName}${send.posName} </span>
									</c:if>
									<c:if test="${send.tbName =='send' }">
										<c:forEach items="${send.empList}" var="emp">
											<c:if test="${send.receivedCount == 1}">
												<span class="etooltip">${emp.empName} ${emp.posName}
													<span class="etooltiptext">(${emp.depName}) ${emp.empName}${emp.posName}   
														<c:if test="${emp.readYN=='Y'}">
															&nbsp;&nbsp;&nbsp;&nbsp;읽음
														</c:if>
														<c:if test="${emp.readYN=='N'}">
															&nbsp;&nbsp;&nbsp;&nbsp;안읽음
														</c:if>
													</span>
												</span>
											</c:if>
										</c:forEach>
										<c:if test="${send.receivedCount > 1}">
										<span class="etooltip">${send.empList[0].empName}${send.empList[0].posName} 외${send.receivedCount-1}명
											<span class="etooltiptext">
												<c:forEach items="${send.empList}" var="emp" begin="0">
													<div class="mb-1">
														(${emp.depName}) ${emp.empName}${emp.posName}
														<c:if test="${emp.readYN=='Y'}">
															&nbsp;&nbsp;&nbsp;&nbsp;읽음 
														</c:if>
														<c:if test="${emp.readYN=='N'}">
															&nbsp;&nbsp;&nbsp;&nbsp;안읽음
														</c:if>
													</div>
										    	</c:forEach>
										      </span>
										</span>
									</c:if>
									</c:if>
									
								</td>
								<c:if test="${send.tbName =='send' }">
									<td onclick="location.href='<c:url value="/mail/detailmail/trash/${send.sendMailId}/send"/>'" style="font-weight:bold;">${send.sendMailTitle}</td>
								</c:if>
								<c:if test="${send.tbName =='received' }">
									<td onclick="location.href='<c:url value="/mail/detailmail/trash/${send.sendMailId}/received"/>'" style="font-weight:bold;">${send.sendMailTitle}</td>
								</c:if>
								<td>
									<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${send.sendMailDate}"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty sendmail}">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td  class="p-5" style="font-size:20px;">휴지통이 비었습니다.</td>
							<td></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<!-- 테이블 끝 -->
		<!-- 하단 버튼 -->
		<div class="row form-inline m-3 d-flex justify-content-end">
				<button class="btn btn-secondary btn-sm mx-1" onclick="pager(-4)">선택복구</button>
				<button class="btn btn-danger btn-sm mx-1" onclick="popup()">선택삭제</button>
		</div><!-- 하단 버튼 -->

		<!-- 페이징 -->
		<c:if test="${!empty sendmail}">
			<div class="row mt-5 d-flex justify-content-center">
				<ul class="pagination pb-0 mb-0">
					<!-- 이전 -->
					<c:if test="${pager.groupNo > 1}">
						<li class="page-item disabled">
							<button class="page-link" onclick="pager(${i-5})">이전</button>
						</li>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
						<!-- 선택할 페이지 -->
						<c:if test="${pager.pageNo != i}">
							<li class="page-item">
								<button class="page-link" onclick="pager(${i})">${i}</button>
								<input type="hidden" id="pageBtn"/>
							</li>
						</c:if>
						<!-- 현재페이지 -->
						<c:if test="${pager.pageNo == i}">
							<li class="page-item active">
								<button id="nowPage" class="page-link" onclick="pager(${i})">${i}</button>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo < pager.totalGroupNo}">
						<li class="page-item">
							<button class="page-link" onclick="pager(${i+5})">다음</button>
						</li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</div>
