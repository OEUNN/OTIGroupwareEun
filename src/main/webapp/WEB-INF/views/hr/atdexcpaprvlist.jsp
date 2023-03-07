<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form id="atd-excp-aprv-form">
	<div class="card">
		<div class="card-body">
			<div class="d-flex justify-content-between align-items-center mb-4">
				<div class="card-title mb-0">근무신청 처리내역</div>
				<div class="d-flex justify-content-end" style="width: 70%;">
					<!-- 날짜 필터링(AJAX):start -->
					<div class="d-flex justify-content-end">
						<!-- datepicker start -->
						<div id="datepicker-attendance"
							class="ml-5 input-daterange input-group text-primary"
							style="border: 2px solid #4B49AC; border-radius: 15px; width: 60%;">
							<span class="mdi mdi-calendar-clock"
								style="position: relative; z-index: 1; top: 15px; left: 15px;"></span>
							<input type="text"
								class="form-control-sm form-control font-weight-bold"
								name="atdStartDate" style="border: 0px; text-align: center;">
							<span
								class="input-group-addon font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
							<span class="mdi mdi-calendar-clock"
								style="position: relative; z-index: 1; top: 15px; left: 15px;"></span>
							<input type="text"
								class="form-control-sm form-control font-weight-bold"
								name="atdEndDate"
								style="border: 0px; border-radius: 15px; text-align: center;">
						</div>
						<!-- datepicker end -->
						<button id="atd-excp-aprv-btn" type="button"
							class="btn btn-md btn-primary ml-2">
							<span>검색</span>
						</button>
					</div>
					<!-- 날짜 필터링(AJAX):end -->
				</div>
			</div>
			<div class="card card-light-blue mb-4">
				<div class="card-body">
					<div class="row">
						<div class="col-md text-center">
							미처리<span class="pl-2 h3 font-weight-bold">0</span>
						</div>
						<div class="col-md text-center">
							승인<span class="pl-2 h3 font-weight-bold">1</span>
						</div>
						<div class="col-md text-center">
							반려<span class="pl-2 h3 font-weight-bold">2</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 근무신청결재목록 -->
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>신청유형</th>
							<th>신청날짜</th>
							<th>결재자</th>
							<th>신청결과</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty atdExcpList}">
							<c:forEach var="atdExcp" items="${atdExcpList}">
								<tr onclick="atdAppDetail('${atdExcp.atdExcpId}')">
									<td><small>${atdExcp.atdExcpCategory}</small></td>
									<td><small>${atdExcp.atdExcpDate}</small></td>
									<td>${atdExcp.atdExcpApprovalEmp}</td>
									<td>
										<!-- 결재상태 --> <c:if
											test="${atdExcp.atdExcpProcessState == '미처리'}">
											<div
												class="badge badge-secondary font-weight-bold text-white">${atdExcp.atdExcpProcessState}</div>
										</c:if> <c:if test="${atdExcp.atdExcpProcessState == '승인'}">
											<div class="badge badge-success font-weight-bold">${atdExcp.atdExcpProcessState}</div>
										</c:if> <c:if test="${atdExcp.atdExcpProcessState == '반려'}">
											<div class="badge badge-danger font-weight-bold">${atdExcp.atdExcpProcessState}</div>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty atdExcpList}">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<c:if test="${empty atdExcpList}">
					<div class="row mx-0 justify-content-center">해당 날짜의 목록이 없습니다.</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 페이징 -->
	<c:if test="${!empty atdPager}">
		<div class="row mt-5 d-flex justify-content-center">
			<ul class="pagination pb-0 mb-0">
				<!-- 이전 -->
				<c:if test="${atdPager.groupNo > 1}">
					<li class="page-item disabled">
						<input type="hidden" name="" />
<%-- 						<a class="page-link" href="<c:url value='/hr/myatdexception?pageNo=${atdPager.startPageNo-5}&atdStartDate=${atdStartDate}&atdEndDate=${atdEndDate}'/>">이전</a> --%>
						<a id="atd-excp-aprv-btn" class="page-link">이전</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${atdPager.startPageNo}"
					end="${atdPager.endPageNo}" step="1">
					<!-- 선택할 페이지 -->
					<c:if test="${atdPager.pageNo != i}">
						<li class="page-item"><a class="page-link"
							href="<c:url value='/hr/myatdexception?pageNo=${i}&atdStartDate=${atdStartDate}&atdEndDate=${atdEndDate}'/>">${i}</a>
						</li>
					</c:if>
					<!-- 현재페이지 -->
					<c:if test="${atdPager.pageNo == i}">
						<li class="page-item active"><a class="page-link">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${atdPager.groupNo < atdPager.totalGroupNo}">
					<li class="page-item"><a class="page-link"
						href="<c:url value='/hr/myatdexception?pageNo=${atdPager.startPageNo+5}&atdStartDate=${atdStartDate}&atdEndDate=${atdEndDate}'/>">다음</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
</form>
