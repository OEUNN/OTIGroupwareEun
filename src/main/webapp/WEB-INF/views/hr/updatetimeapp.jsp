<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Plugin css,js for this page -->
<!-- clockpicker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/clockpicker/bootstrap-clockpicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/clockpicker/jquery-clockpicker.css">
<script src="${pageContext.request.contextPath}/resources/vendors/clockpicker/bootstrap-clockpicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/clockpicker/jquery-clockpicker.js"></script>

<style>
	.custom-border-left {
		border-left: 1px solid rgb(206, 212, 218);
	}
	
	.custom-border-right {
		border-right: 1px solid rgb(206, 212, 218);
	}
	
	#intime-clockpicker .mdi-timer, #outtime-clockpicker .mdi-timer {
		position: relative;
		z-index: 1;
		top: 11px;
		left: 35px;
	}
</style>

<script>
	//clockpicker 렌더링
	$(function() {
		$('.clockpicker').clockpicker();
	});
	
	//출근, 퇴근 체크박스 클릭시 html 추가
	function isCheck(data) {
		if (data == 'in') {
			if ($('input:checkbox[id="intime-checkbtn"]').is(':checked')) {
				$('#today-intime').css('display', 'block');
				$('#intime-clockpicker').css('display', 'block');
			} else {
				$('#today-intime').css('display', 'none');
				$('#intime-clockpicker').css('display', 'none');
			}
		} else if (data == 'out') {
			if ($('input:checkbox[id="outtime-checkbtn"]').is(':checked')) {
				$('#today-outtime').css('display', 'block');
				$('#outtime-clockpicker').css('display', 'block');
			} else {
				$('#today-outtime').css('display', 'none');
				$('#outtime-clockpicker').css('display', 'none');
			}
		}
	}
	
	//작성폼 초기화
	function resetForm() {
		$('#today-intime').css('display', 'none');
		$('#intime-clockpicker').css('display', 'none');
		$('#today-outtime').css('display', 'none');
		$('#outtime-clockpicker').css('display', 'none');
	}
	
	//폼 유효성검사
	function validateForm() {
		var result = true;
		
		//출근체크박스 선택했을 경우
		if($('input:checkbox[id="intime-checkbtn"]').is(':checked') && $('#no-today-intime').val() == '' ){
			$('#no-today-intime').css('color', 'red');
			$('#no-today-intime').text('출근을 해주세요!');
			$('input[name="atdExcpInTime').css('border-color', 'red');
			result = false;
		}
		//퇴근체크박스 선택했을 경우
		if($('input:checkbox[id="outtime-checkbtn"]').is(':checked') && $('#no-today-outtime').val() == '') {
			$("#no-today-outtime").css('color', 'red');
			$('#no-today-intime').text('퇴근을 해주세요!');
			$('input[name="atdExcpOutTime').css('border-color', 'red');
			result = false;
		}
		//사유를 작성하지 않았을 경우
		if($('#reason').val() == ''){
			$("textarea.form-control").css('border-color', 'red');
			result = false;
		}
		
		return result;
	}
	
	/* 폼 유효성 검사 - CSS 적용 */
	$(function() {
		$('input[name="atdExcpInTime').focusin(function(){
		    $(this).css("border-color", "#4B49AC");
		  });
		
		$('input[name="atdExcpOutTime').focusin(function(){
		    $(this).css("border-color", "#4B49AC");
		  });
		
		$("textarea.form-control").focusin(function(){
		    $(this).css("border-color", "#4B49AC");
		  });

		$("textarea.form-control").focusout(function(){
		    $(this).css("border-color", "#CED4DA");
		  });
	});
</script>
<!-- End plugin css,js for this page -->

<div class="table-responsive px-3 py-2 mt-3">
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
						class="font-weight-bold text-center m-0">근무날짜</h4></td>
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
<!-- 변경내용(폼) -->
<form id="myUpdateTimeAppForm" action="<c:url value='/hr/atdapplicationform'/>" onsubmit="return validateForm();" method="post">
<div class="container-fluid">
	<div class="row justify-content-around">
		<div class="col-md"></div>
		<div class="col-md">
			<h4 class="font-weight-bold">기존 근무시간</h4>
		</div>
		<div class="col-md">
			<h4 class="font-weight-bold">수정 근무시간</h4>
		</div>
	</div>
	<div class="row justify-content-center">
		<div style="border: 1px solid #a3a4a5; opacity: 0.5; width: 90%;"></div>
	</div>
	<div class="row px-5 py-2">
		<div class="col-md">
			<div class="form-check font-weight-bold text-info">
				<label class="form-check-label"> 
					<input type="checkbox" class="form-check-input" id="intime-checkbtn" onclick="isCheck('in')"> 
					<i class="input-helper">
					</i> <span class="text-primary">출근</span>
				</label>
			</div>
		</div>
		<div class="col-md d-flex align-items-center pr-0">
			<div id="today-intime" style="display: none">
				<c:if test="${!empty attendance.atdInTime}">
					<!-- 원래출근시간 -->
					<div class="h5 mb-0 ml-3"><fmt:formatDate value="${attendance.atdInTime}" pattern="HH:mm" /></div>
				</c:if>
				<c:if test="${empty attendance.atdInTime}">
					<div id="no-today-intime" class="h5 mb-0" style="position: relative; left:-30px;">출근이력이 없습니다.</div>
				</c:if>
			</div>
		</div>
		<div class="col-md d-flex align-items-center pl-0">
			<!-- 출근시간:clockpicker:start -->
			<div id="intime-clockpicker" style="display: none">
				<div class="input-group clockpicker">
					<span class="h3 mdi mdi-timer text-primary"></span> 
					<input type="text" class="form-control" name="atdExcpInTime" style="border-radius: 8px; border: 2px solid #4747A1; text-align: center;">
				</div>
			</div>
			<!-- clockpicker:end -->
		</div>
	</div>
	<div class="row px-5 py-2">
		<div class="col-md">
			<div class="form-check font-weight-bold text-info">
				<label class="form-check-label"> 
				<input type="checkbox" class="form-check-input" id="outtime-checkbtn" onclick="isCheck('out')"> 
				<i class="input-helper"></i> 
				<span class="text-primary">퇴근</span>
				</label>
			</div>
		</div>
		<div class="col-md d-flex align-items-center pr-0">
			<div id="today-outtime" style="display: none">
				<c:if test="${!empty attendance.atdOutTime}">
					<!-- 원래퇴근시간 -->
					<div class="h5 mb-0 ml-3"><fmt:formatDate value="${attendance.atdOutTime}" pattern="HH:mm" /></div>
				</c:if>
				<c:if test="${empty attendance.atdOutTime}">
					<div id="no-today-outtime" class="h5 mb-0" style="position: relative; left:-30px;">퇴근이력이 없습니다.</div>
				</c:if>
			</div>
		</div>
		<div class="col-md d-flex align-items-center pl-0">
			<!-- 퇴근시간:clockpicker:start -->
			<div id="outtime-clockpicker" style="display: none">
				<div class="input-group clockpicker">
					<span class="h3 mdi mdi-timer text-primary"></span> 
					<input type="text" class="form-control" name="atdExcpOutTime" style="border-radius: 8px; border: 2px solid #4747A1; text-align: center;">
				</div>
			</div>
			<!-- clockpicker:end -->
		</div>
	</div>
	<div class="row px-5 mt-4 justify-content-center">
		<div class="form-group">
			<label class="ml-1" for="atdExcpReason"><div class="h5 m-0 font-weight-bold text-primary">사유</div></label>
			<textarea class="form-control" id="reason" rows="5" cols="150" name="atdExcpReason"></textarea>
		</div>
	</div>
	<div class="row justify-content-center mt-3">
		<div style="border-bottom: 2px solid #4B49AC; width: 90%;"></div>
	</div>
	<!-- hidden input -->
	<input type="hidden" name="empId" value="${attendance.empId}">
	<input type="hidden" name="atdExcpApprovalEmpName" value="${empFormInfo['결재자']}">
	<input type="hidden" name="atdExcpApprovalEmpId" value="${empFormInfo['결재자ID']}">
	<input type="hidden" name="atdExcpCategory" value="근무시간수정">
</div>
<!-- 버튼 -->
<div class="row px-5 mt-3 justify-content-end">
	<button type="submit" class="btn btn-primary mr-2">신청</button>
	<button type="button" class="btn btn-inverse-primary mr-2" onclick="location.href='${pageContext.request.contextPath}/hr/myatdexception'">닫기</button>
</div>
<!-- 변경내용:end -->
</form>