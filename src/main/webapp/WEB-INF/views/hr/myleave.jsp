<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- inject css, js common file -->
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<!-- endinject css, js common file -->

<!-- Plugin css,js for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

<style>
.custom-border-left {
	border-left: 1px solid rgb(206, 212, 218);
}

.custom-border-right {
	border-right: 1px solid rgb(206, 212, 218);
}
</style>

<script>
	//datepicker 렌더링
	$(function() {
		$('#datepicker').datepicker({
			format : "yyyy-mm",
			startView : "months",
			minViewMode : "months",
			todayHighlight : true
		});

		$('#datepicker-application').datepicker({
			todayHighlight : true
		});
	});

	/* AJAX통신 - 휴가신청내역 상세보기*/
	function levAppDetail(id) {
		$.ajax({
           type: "GET",
           url: "../hr/levappaprvdetail?levAppId=" + id,
           error: function () {
           	alert("통신실패!");
           },
           success: function (data) {
               //작성폼 숨기기
               $("#leave-app-write-form").hide();
			   //AJAX 통신에 의해 상세조회 내용 넣기
               $("#leave-app-detail").hide().fadeIn(500);
               $('#leave-app-detail').html(data);
           }
   		});
	}
	
	/* 휴가신청서 자세히보기에서 X버튼 누르면 다시 목록 커짐 */
	function backLevList() {
		//상세조회 원래대로
		$("#leave-app-detail").hide().fadeOut(400);
		//숨겨놓은 근무신청내역 목록 보이기
       $("#leave-app-write-form").hide().fadeIn(600);
	}
	
	//첫번째 셀렉박스 - 잔여연차를 선택했을 경우
	$(function() {
		$("#reserve-leave").on("change", function() {
		    //연차를 클릭했을 경우, 아래 셀렉박스가 선택가능해짐
			if($(this).children("option:selected").attr("id") === 'leave-option') {
		      $('#leave-category').prop('disabled', false);
		    //대체휴무를 클릭했을 경우, 아래의 셀렉박스 초기화
			} else {
		      $('#leave-category').prop('disabled', true);
		      $("#default-option").prop("selected", true);
	    	  $('#datepicker-application').css("width", "70%");
	    	  $('#levAppDate-middle').html("~");
	    	  $('#levAppEndDate-icon').show();
	    	  $('#levAppEndDate').show();
	    	  // 삭제했던 숨겨진 input 태그 추가
	    	  const newInput = $('<input>')
	    	      .attr('id', 'sub-rev')
	    	      .attr('type', 'hidden')
	    	      .attr('name', 'levAppCategory')
	    	      .val('대체휴무');
	    	  // form 요소에 새로운 input 태그 추가
	    	  $('#levAppForm').append(newInput);
		    }
	 	});
 	});
	
	//두번째 셀렉박스 - 오전반차나 오후반차를 선택했을 경우, datepicker 변경
	$(function() {
		$("#leave-category").on("change", function() {
		    if($(this).val() === '오전반차' || $(this).val() === '오후반차') {
		    	$('#datepicker-application').css("width", "41%");
		    	$('#levAppDate-middle').html("");
		    	$('#levAppEndDate-icon').hide();
		    	$('#levAppEndDate').hide();
		    } else { //연차 선택했을 경우
		    	$('#datepicker-application').css("width", "70%");
		    	$('#levAppDate-middle').html("~");
		    	$('#levAppEndDate-icon').show();
		    	$('#levAppEndDate').show();
		    }
	 	});
 	});
	
	//폼 유효성검사
	function validateForm() {
		var result = true;
		
		//휴가선택을 select하지 않았을 경우
		if($('#reserve-leave').val() == '--선택--') {
			$('#reserve-leave').css('outline-color', 'red');
			result = false;
		}

		//휴가유형을 select하지 않았을 경우
		if($('#reserve-leave').children("option:selected").attr("id") == 'leave-option' && $('#leave-category').val() == '--선택--') {
			$('#leave-category').css('outline-color', 'red');
			result = false;
		}
		
		//휴가기간을 선택하지 않았을 경우
		if($('input[name="levAppStartDate"]').val() == '' || $('input[name="levAppEndDate"]').val() == '') {
			$('#datepicker-application').css('border-color', 'red');
			result = false;
		}
		
		//휴가기간을 선택했지만, 잔여일수에 맞지 않게 휴가기간을 선택했을 경우
		if($('input[name="levAppStartDate"]').val() != '' && $('input[name="levAppEndDate"]').val() != '') {
			//기간 차이 구하기
			var start = new Date($('input[name="levAppStartDate"]').val());
			var end = new Date($('input[name="levAppEndDate"]').val());
			var diffTime = Math.abs(end - start);
			var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))+1; 
			
			if($('input[name="levAppCategory"]').val() == '오전반차' || $('input[name="levAppCategory"]').val() == '오후반차') { //반차일 경우
				diffDays = 0.5; 
			}
			
			$('input[name="levPeriod"]').val(diffDays); //휴가기간 input태그에 등록
			
			//연차 vs 대체휴무
			var reserveCount = $('#lev-rev-period').text(); //default: 잔여연차
			if($('#reserve-leave').val() == '대체휴무') {  //대체휴무일때 기간 잔여대체휴무로 변경
				reserveCount = $('#sub-rev-period').text();
			}
			
			//"잔여일수-선택기간"이 음수이면 신청불가해야함
			if(reserveCount-diffDays < 0) {
				$('#datepicker-application').css('border-color', 'red');
				$('#add-comment').html("잔여일수에 맞게 기간설정 해주세요");
				result = false;
			}
		}
		
		
		//사유를 작성하지 않았을 경우
		if($('#levAppReason').val() == ''){
			$("textarea.form-control").css('border-color', 'red');
			result = false;
		}
		
		return result;
	}
	
	/* 유효성검사에 따른 INPUT,SELECT박스 CSS 변화 */
	$(function() {
		$("#datepicker-application").focusin(function(){
		    $(this).css("border-color", "#4B49AC");
			$('#add-comment').html("");
		  });
		
		$("textarea.form-control").focusin(function(){
		    $(this).css("border-color", "#4B49AC");
		  });

		$("textarea.form-control").focusout(function(){
		    $(this).css("border-color", "#CED4DA");
		  });
		
		$("select.form-control").focusin(function(){
		    $(this).css("outline-color", "#4B49AC");
		  });

		$("select.form-control").focusout(function(){
		    $(this).css("outline-color", "#CED4DA");
		  });
	});
</script>
<!-- End plugin css,js for this page -->
</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>

		<div class="container-fluid page-body-wrapper">
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<!-- 휴가신청목록 -->
									<div class="d-flex justify-content-between align-items-center mb-4">
										<div class="card-title mb-0">휴가내역</div>
										<div class="d-flex justify-content-end" style="width: 70%;">
											<form action="<c:url value='/hr/myleave?pageNo=1'/>" method="POST">
												<div class="d-flex justify-content-end">
													<!-- datepicker start -->
													<div id="datepicker"
														class="input-daterange input-group text-primary"
														style="border: 2px solid #4B49AC; border-radius: 15px; width: 70%;">
														<!-- 시작날짜:start -->
														<span class="mdi mdi-calendar-clock" style="position: relative; z-index: 1; top: 12px; left: 15px;"></span>
														<input type="text" class="form-control-sm form-control font-weight-bold" name="startDate" style="border: 0px; text-align: center;">
														<!-- 시작날짜:end -->
														<span class="input-group-addon font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
														<!-- 종료날짜:start -->
														<span class="mdi mdi-calendar-clock" style="position: relative; z-index: 1; top: 12px; left: 15px;"></span>
														<input type="text" class="form-control-sm form-control font-weight-bold" name="endDate" style="border: 0px; border-radius: 15px; text-align: center;">
														<!-- 종료날짜:end -->
													</div>
													<!-- datepicker end -->
													<button class="btn btn-md btn-primary ml-2">
														<span>검색</span>
													</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 휴가통계 -->
									<div class="card card-light-blue mb-4">
										<div class="card-body">
											<div class="row text-center pl-2 pr-4"
												style="font-size: 13px; font-weight: bold;">
												<div class="col-md px-0">발생 일수</div>
												<div class="col-md px-0">사용 일수</div>
												<div class="col-md px-0">잔여 연차</div>
												<div class="col-md px-0">잔여 대체휴무</div>
											</div>
											<div class="row text-center font-weight-bold h3 mb-0">
												<div class="col-md"><fmt:formatNumber value="${levAppStats['사용휴가'] + leaveReserve + substitueReserve}" pattern="#0.0"/></div>
												<!-- 사용한 연차가 있을 경우 -->
												<c:if test="${levAppStats['사용휴가'] != null}">
													<div class="col-md"><fmt:formatNumber value="${levAppStats['사용휴가']}" pattern="#0.0"/></div>
												</c:if>
												<!-- 사용한 연차가 없을 경우 -->
												<c:if test="${levAppStats['사용휴가'] == null}">
													<div class="col-md">0.0</div>
												</c:if>
												<div id="lev-rev-period" class="col-md"><fmt:formatNumber value="${leaveReserve}" pattern="#0.0"/></div>
												<div id="sub-rev-period" class="col-md mr-3">${substitueReserve}</div>
											</div>
										</div>
									</div>
									<!-- 휴가신청내역 -->
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>휴가유형</th>
													<th>신청날짜</th>
													<th>휴가기간</th>
													<th>결재자</th>
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
															<td><small><fmt:formatDate value="${levApp.levAppDate}" pattern="yyyy-MM-dd" /></small></td>
															<td><small>
																<fmt:formatDate value="${levApp.levAppStartDate}" pattern="yyyy-MM-dd" />
															 		~ 
															 	<fmt:formatDate value="${levApp.levAppEndDate}" pattern="yyyy-MM-dd" />
															</small></td>
															<td class="px-2 py-1 text-center">${levApp.levAppApprovalEmpName}</td>
															<td class="px-2 py-1 text-center">
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
									<!-- 페이징 -->
									<c:if test="${!empty pager}">
										<div class="row mt-5 d-flex justify-content-center">
											<ul class="pagination pb-0 mb-0">
												<!-- 이전 -->
												<c:if test="${pager.groupNo > 1}">
													<li class="page-item disabled"><a class="page-link"
														href="<c:url value='/hr/myleave?pageNo=${pager.startPageNo-5}&startDate=${startDate}&endDate=${endDate}'/>">이전</a>
													</li>
												</c:if>
												<c:forEach var="i" begin="${pager.startPageNo}"
													end="${pager.endPageNo}" step="1">
													<!-- 선택할 페이지 -->
													<c:if test="${pager.pageNo != i}">
														<li class="page-item"><a class="page-link"
															href="<c:url value='/hr/myleave?pageNo=${i}&startDate=${startDate}&endDate=${endDate}'/>">${i}</a>
														</li>
													</c:if>
													<!-- 현재페이지 -->
													<c:if test="${pager.pageNo == i}">
														<li class="page-item active"><a class="page-link">${i}</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${pager.groupNo < pager.totalGroupNo}">
													<li class="page-item"><a class="page-link"
														href="<c:url value='/hr/myatdexception?pageNo=${pager.startPageNo+5}&startDate=${startDate}&endDate=${endDate}'/>">다음</a></li>
												</c:if>
											</ul>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<!-- 상세보기 -->
						<div id="leave-app-detail" class="col-md-6" style="display: none;">
						</div>
						<!-- 휴가신청폼 -->
						<div id="leave-app-write-form" class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<p class="card-title">휴가신청</p>
									<div class="table-responsive px-3 py-2">
										<!-- 고정 내용 -->
										<table class="table">
											<tbody>
												<tr class="custom-border-left custom-border-right">
													<td class="custom-border-right"><h4
															class="font-weight-bold text-center m-0">작성자</h4></td>
													<td>${sessionScope.employee.empName}</td>
													<td></td>
													<td></td>
													<td class="custom-border-left custom-border-right"><h4
															class="font-weight-bold text-center m-0">신청날짜</h4></td>
													<td>
														<!-- 오늘날짜 -->
														<c:set var="now" value="<%=new java.util.Date()%>" /> 
														<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
													</td>
													<td></td>
												</tr>
												<tr class="custom-border-left custom-border-right">
													<td class="custom-border-right"><h4
															class="font-weight-bold text-center m-0">결재자</h4></td>
													<td>${empFormInfo['결재자']}</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 변경내용-->
									<form id="levAppForm" action="<c:url value='/hr/levapplicationform'/>" onsubmit="return validateForm();" method="post">
									<div class="container-fluid">
										<div class="row justify-content-center">
											<div style="border: 1px solid #a3a4a5; opacity: 0.5; width: 90%;"></div>
										</div>
										<!-- 휴가 선택 -->
										<div class="row">
											<div class="col-md d-flex align-items-center px-5 py-2">
												<h4 class="mx-4 mb-0 font-weight-bold">휴가선택</h4>
												<!-- 잔여 연차 및 대체휴무가 존재할 경우, 셀렉박스 활성화 -->
												<c:if test="${!empty leaveReserve || !empty substitueReserve}">
													<select id="reserve-leave" class="leave-select form-control mx-2" style="font-weight: bold; width: 40%">
														<option class="text-secondary" selected>--선택--</option>
														<!-- 잔여 연차가 남아있는 경우 -->
														<c:if test="${leaveReserve ne 0}"><option id="leave-option">연차 ( 잔여 ${leaveReserve}일 )</option></c:if>
														<!-- 잔여 연차가 남아있지 않을 경우 -->
														<c:if test="${leaveReserve eq 0}"><option style="color:#CED4DA;" disabled>연차 ( 잔여 0일 )</option></c:if>
														<!-- 잔여 대체휴무가 남아있는 경우 -->
														<c:if test="${substitueReserve ne 0}">
															<option value="대체휴무">대체휴무 ( 잔여 ${substitueReserve}일 )</option>
<!-- 															<input id="sub-rev" type="hidden" name="levAppCategory" value="대체휴무"/> -->
														</c:if>
														<!-- 잔여 대체휴무가 남아있지 않을 경우 -->
														<c:if test="${substitueReserve eq 0}"><option style="color:#CED4DA;" disabled>대체휴무 ( 잔여 0일 )</option></c:if>
													</select>
												</c:if>
												<!-- 잔여 연차 및 대체휴무가 존재하지 않을 경우 -->
												<c:if test="${empty leaveReserve && empty substitueReserve}">
													<select class="leave-select form-control mx-2" style="font-weight: bold; width: 40%" disabled>
														<option>연차 ( 잔여 ${leaveReserve}일 )</option>
														<option>대체휴무 ( 잔여 ${substitueReserve}일 )</option>
													</select>
												</c:if>
											</div>
										</div>
										<!-- 휴가 유형 -->
										<div class="row">
											<div class="col-md d-flex align-items-center px-5 py-2">
												<h4 class="mx-4 mb-0 font-weight-bold">휴가유형</h4>
												<select id="leave-category" name="levAppCategory" class="leave-select form-control mx-2" style="font-weight: bold; width: 40%" disabled>
													<!-- 연차 -->
													<option id="default-option" class="text-secondary" selected>--선택--</option>
													<option value="연차">연차</option>
													<option value="오전반차">오전반차</option>
													<option value="오후반차">오후반차</option>
												</select>
											</div>
										</div>
										<!-- 기간(날짜) 선택 -->
										<div class="row px-5 py-2">
											<div class="col-md d-flex align-items-center pl-0">
												<h4 class="mx-4 mb-0 font-weight-bold">휴가기간</h4>
												<!-- datepicker-application: start -->
												<div id="datepicker-application" class="mx-2 input-daterange input-group text-primary" style="border: 2px solid #4B49AC; border-radius: 10px; width: 70%;">
													<!-- 휴가시작날짜:start -->
													<span class="mdi mdi-calendar-clock" style="position: relative; z-index: 1; top: 15px; left: 15px;"></span>
													<input id="levAppStartDate" type="text" class="input-sm form-control font-weight-bold" name="levAppStartDate" style="border: 0px; text-align: center;">
													<!-- 휴가시작날짜:end -->	
													<span id="levAppDate-middle" class="input-group-addon font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
													<!-- 휴가종료날짜:start -->
													<span id="levAppEndDate-icon" class="mdi mdi-calendar-clock" style="position: relative; z-index: 1; top: 15px; left: 15px;"></span>
													<input id="levAppEndDate" type="text" class="input-sm form-control font-weight-bold" name="levAppEndDate" style="border: 0px; border-radius: 10px; text-align: center;">
													<!-- 휴가종료날짜:end -->
												</div>
												<!-- datepicker-application: end -->
											</div>
										</div>
										<!-- 기간 유효성 검사 실패했을 경우 -->
										<div class="row p-0" style="margin-left: 150px;">
											<small class="col-md text-danger" id="add-comment"></small>
										</div>
										<!-- 휴가사유 -->
										<div class="row px-5 mt-4 justify-content-center">
											<div class="form-group">
												<label class="ml-1" for="levAppReason"><div class="h5 m-0 font-weight-bold text-primary">사유</div></label>
												<textarea class="form-control" id="levAppReason" name="levAppReason" rows="5" cols="90"></textarea>
											</div>
										</div>
										<div class="row justify-content-center mt-3">
											<div style="border-bottom: 2px solid #4B49AC; width: 90%;"></div>
										</div>
										<!-- hidden input -->
										<input type="hidden" name="empId" value="${sessionScope.employee.empId}">
										<input type="hidden" name="levAppApprovalEmpId" value="${empFormInfo['결재자ID']}">
										<input type="hidden" name="levAppApprovalEmpName" value="${empFormInfo['결재자']}">
										<input type="hidden" name="levPeriod" />
									</div>
									<!-- 버튼 -->
									<div class="row px-5 mt-3 justify-content-end">
										<button type="submit" class="btn btn-primary mr-2">신청</button>
										<button type="reset" class="btn btn-inverse-primary mr-2">취소</button>
									</div>
									<!-- 변경내용:end -->
									</form>
								</div>
								<!-- card-body:end -->
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
				<%@ include file="/WEB-INF/views/common/_footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

</body>

</html>