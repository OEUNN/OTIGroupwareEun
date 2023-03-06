<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Plugin css,js for this page -->
<!-- datepicker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

<!-- clockpicker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/clockpicker/bootstrap-clockpicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/clockpicker/jquery-clockpicker.css">
<script src="${pageContext.request.contextPath}/resources/vendors/clockpicker/bootstrap-clockpicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/clockpicker/jquery-clockpicker.js"></script>
		
<style>
	.custom-border-left {
		border-left: 1px solid rgb(206,212,218);
	}
	
	.custom-border-right {
		border-right: 1px solid rgb(206,212,218);
	}
	
	#intime-clockpicker .mdi-timer, #outtime-clockpicker .mdi-timer {
		position: relative;
		z-index: 1; 
		top:11px; 
		left:35px;
	}
	
	table td.disabled, table td.disabled:hover {
           background: #e7e7ff !important;
           color: white !important;
           cursor: not-allowed;
           border-radius: 0px !important;
       }
</style>
	
<script>
 	//datepicker 렌더링
   	$(function(){ 
	      $('#datepicker-overtimeapp').datepicker({
	    	  fautoclose: true,
	    	  startDate: "-7D",
	    	  endDate: "0D",
	    	  todayHighlight: true
	      });
	      
	      $(".datepicker-switch").css("pointer-events", "none");
	});
 	
 	//clockpicker 렌더링
 	$(function(){ 
		$('.clockpicker').clockpicker();
 	});
 	
 	//폼 유효성검사
	function validateForm() {
		var result = true;
		
		//날짜를 선택하지 않았을 경우
		if($('#atdExcpDate').val() == ''){
			$('#atdExcpDate').css('border-color', 'red');
			result = false;
		}
		//시작시간을 선택하지 않았을 경우
		if($('#atdExcpInTime').val() == '') {
			$('#atdExcpInTime').css('border-color', 'red');
			result = false;
		}

		//종료시간을 선택하지 않았을 경우
		if($('#atdExcpOutTime').val() == '') {
			$('#atdExcpOutTime').css('border-color', 'red');
			result = false;
		}
		//사유를 작성하지 않았을 경우
		if($('#reason').val() == ''){
			$("textarea.form-control").css('border-color', 'red');
			result = false;
		}
		
		return result;
	}
	
	$(function() {
		$("#atdExcpDate").focusin(function(){
		    $(this).css("border-color", "#4B49AC");
		  });

		$("#atdExcpInTime").focusin(function(){
		    $(this).css("border-color", "#4B49AC");
		  });
		
		$("#atdExcpOutTime").focusin(function(){
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

<form action="<c:url value='/hr/applicationform'/>" onsubmit="return validateForm();" method="post">
<div class="table-responsive px-3 py-2">
	<!-- 고정 내용 -->
	<table class="table">
		<tbody>
			<tr class="custom-border-left custom-border-right">
				<td class="custom-border-right"><h4
						class="font-weight-bold text-center m-0">작성자</h4></td>
				<td>${empFormInfo['작성자']}</td>
				<td></td>
				<td></td>
				<td class="custom-border-left custom-border-right"><h4
						class="font-weight-bold text-center m-0">근무날짜</h4></td>
				<td>
					<!-- 추가근무날짜 선택 --> 
					<!-- datepicker start -->
					<div id="datepicker-overtimeapp" class="input-daterange input-group">
						<span class="h3 mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top: 12px; left: 30px;"></span>
						<input id="atdExcpDate" type="text" name="atdExcpDate" class="form-control font-weight-bold text-center" name="start" style="border: 2px solid #4B49AC; border-radius: 10px;" />
					</div> <!-- datepicker end -->
				</td>
				<td></td>
			</tr>
			<tr class="custom-border-left custom-border-right">
				<td class="custom-border-right">
					<h4 class="font-weight-bold text-center m-0">결재자</h4>
				</td>
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
<div class="container-fluid">
	<div class="row ml-3">
		<div class="col-md">
			<h4 class="font-weight-bold">추가 근무시간</h4>
		</div>
	</div>
	<div class="row justify-content-center">
		<div style="border: 1px solid #a3a4a5; opacity: 0.5; width: 90%;"></div>
	</div>
	<div class="row justify-content-center px-5 py-2">
		<div class="col-md-5 d-flex align-items-center">
			<!-- clockpicker-시작시간:start -->
			<div id="intime-clockpicker">
				<div class="input-group clockpicker">
					<span class="h3 mdi mdi-timer text-primary"></span> 
					<input id="atdExcpInTime" type="text" name="atdExcpInTime" class="form-control" style="border-radius: 8px; border: 2px solid #4747A1; text-align: center;">
				</div>
			</div>
			<!-- clockpicker-시작시간:end -->
		</div>
		<div class="col-md-1 h1 text-primary align-middle">~</div>
		<div class="col-md-5 d-flex align-items-center px-0">
			<!-- clockpicker-종료시간:start -->
			<div id="outtime-clockpicker">
				<div class="input-group clockpicker">
					<span class="h3 mdi mdi-timer text-primary"></span> 
					<input id="atdExcpOutTime" type="text" name="atdExcpOutTime" class="form-control" style="border-radius: 8px; border: 2px solid #4747A1; text-align: center">
				</div>
			</div>
			<!-- clockpicker-종료시간:end -->
		</div>
	</div>
	<div class="row px-5 mt-4 justify-content-center">
		<div class="form-group">
			<label class="ml-1" for="atdExcpReason"><div class="h5 m-0 font-weight-bold text-primary">사유</div></label>
			<textarea class="form-control" id="reason" rows="5" cols="68" name="atdExcpReason"></textarea>
		</div>
	</div>
	<div class="row justify-content-center mt-3">
		<div style="border-bottom: 2px solid #4B49AC; width: 90%;"></div>
	</div>
	<!-- hidden input -->
	<input type="hidden" name="empId" value="${attendance.empId}">
	<input type="hidden" name="atdExcpApprovalEmp" value="${empFormInfo['결재자']}">
	<input type="hidden" name="atdExcpCategory" value="추가근무">
</div>
<!-- 버튼 -->
<div class="row px-5 mt-3 justify-content-end">
	<button type="submit" class="btn btn-primary mr-2">신청</button>
	<button onclick="resetForm()" type="reset" class="btn btn-inverse-primary mr-2">취소</button>
</div>
<!-- 변경내용:end -->
</form>

