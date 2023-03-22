<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	//datepicker 렌더링
	$(function() {
		$('#datepicker-leave').datepicker({
			format : "yyyy-mm",
			startView : "months",
			minViewMode : "months",
			todayHighlight : true
		});
	});
</script>

<form id="lev-app-aprv-form">
	<div class="card">
		<div class="card-body">
			<div class="d-flex justify-content-between align-items-center mb-4">
				<div class="card-title mb-0">휴가신청 처리내역</div>
				<div class="d-flex justify-content-end" style="width: 70%;">
					<!-- datepicker start -->
					<div id="datepicker-leave"
						class="ml-5 input-daterange input-group text-primary"
						style="border: 2px solid #4B49AC; border-radius: 15px; width: 60%;">
						<span class="mdi mdi-calendar-clock"
							style="position: relative; z-index: 1; top: 15px; left: 15px;"></span>
						<input type="text" class="form-control-sm form-control font-weight-bold"
							name="startDate" value="${startDate}" style="border: 0px; text-align: center;">
						<span
							class="input-group-addon font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
						<span class="mdi mdi-calendar-clock"
							style="position: relative; z-index: 1; top: 15px; left: 15px;"></span>
						<input type="text" class="form-control-sm form-control font-weight-bold"
							name="endDate" value="${endDate}" style="border: 0px; border-radius: 15px; text-align: center;">
					</div>
					<!-- datepicker end -->
					<button onclick="levAppPaging(1)" type="button" class="btn btn-md btn-primary ml-2">
						<span>검색</span>
					</button>
				</div>
			</div>
			<!-- 휴가결재통계 -->
			<div class="card card-dark-blue mb-4">
				<div class="card-body">
					<div class="row text-center"
						style="font-size: 13px; font-weight: bold;">
						<div class="col-md px-0">신청</div>
						<div class="col-md px-0">승인</div>
						<div class="col-md px-0">반려</div>
					</div>
					<div class="row text-center font-weight-bold h3 mb-0">
						<div class="col-md">${levAppStats['신청']}</div>
						<div class="col-md">${levAppStats['승인']}</div>
						<div class="col-md">${levAppStats['반려']}</div>
					</div>
				</div>
			</div>
			<!-- 휴가신청결재목록 -->
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>휴가유형</th>
							<th>신청날짜</th>
							<th>휴가기간</th>
							<th>신청자</th>
							<th>진행상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty levAppList}">
							<c:forEach var="levApp" items="${levAppList}">
								<tr onclick="levAppDetail('${levApp.levAppId}')">
									<td class="text-center">
										<c:if test="${levApp.levAppProcessState ne '취소신청' && levApp.levAppProcessState ne '취소완료'}"><small>${levApp.levAppCategory}</small></c:if>
										<c:if test="${levApp.levAppProcessState eq '취소신청' || levApp.levAppProcessState eq '취소완료'}"><small class="text-danger">${levApp.levAppCategory}취소</small></c:if>
									</td>
									<td><small><fmt:formatDate value="${levApp.levAppDate}" pattern="yyyy/MM/dd" /></small></td>
									<td><small> 
										<fmt:formatDate value="${levApp.levAppStartDate}" pattern="yyyy/MM/dd" />
										 ~
										<fmt:formatDate value="${levApp.levAppEndDate}" pattern="yyyy/MM/dd" />
									</small></td>
									<td>${levApp.empName}</td>
									<td id="aprv-state${levApp.levAppId}">
										<!-- 결재상태 --> 
										<c:if test="${levApp.levAppProcessState == '신청'}">
											<div class="badge badge-secondary font-weight-bold text-white">${levApp.levAppProcessState}</div>
										</c:if> 
										<c:if test="${levApp.levAppProcessState == '승인'}">
											<div class="badge badge-success font-weight-bold">${levApp.levAppProcessState}</div>
										</c:if> 
										<c:if test="${levApp.levAppProcessState == '반려'}">
											<div class="badge badge-danger font-weight-bold">${levApp.levAppProcessState}</div>
										</c:if>
										<c:if test="${levApp.levAppProcessState == '취소신청'}">
											<div class="badge badge-outline-danger font-weight-bold">${levApp.levAppProcessState}</div>
										</c:if>
										<c:if test="${levApp.levAppProcessState == '취소완료'}">
											<div class="badge badge-warning font-weight-bold">${levApp.levAppProcessState}</div>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty levAppList}">
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
				<c:if test="${empty levAppList}">
					<div class="row mx-0 justify-content-center">해당 날짜의 목록이 없습니다.</div>
				</c:if>
			</div>
			<!-- 페이징:Start -->
			<c:if test="${!empty levPager}">
				<div class="row mt-5 d-flex justify-content-center">
					<ul class="pagination pb-0 mb-0">
						<!-- 이전 -->
						<c:if test="${levPager.groupNo > 1}">
							<li class="page-item disabled">
								<a onclick="levAppPaging('${levPager.startPageNo-5}')" class="page-link">이전</a></li>
						</c:if>
						<!-- 1,2,3, ... -->
						<c:forEach var="i" begin="${levPager.startPageNo}" end="${levPager.endPageNo}" step="1">
							<!-- 선택할 페이지 -->
							<c:if test="${levPager.pageNo != i}">
								<li class="page-item">
									<a onclick="levAppPaging('${i}')" class="page-link">${i}</a>
								</li>
							</c:if>
							<!-- 현재페이지 -->
							<c:if test="${levPager.pageNo == i}">
								<li class="page-item active"><a class="page-link">${i}</a></li>
							</c:if>
						</c:forEach>
						<!-- 다음 -->
						<c:if test="${levPager.groupNo < levPager.totalGroupNo}">
							<li class="page-item">
								<a onclick="levAppPaging('${levPager.startPageNo+5}')" class="page-link">다음</a>
							</li>
						</c:if>
					</ul>
				</div>
			</c:if>
			<!-- 페이징:End -->
		</div>
	</div>
</form>