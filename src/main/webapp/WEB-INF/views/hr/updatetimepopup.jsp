<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- inject css, js common file -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- endinject css, js common file -->
	
	<!-- Plugin css,js for this page -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/clockpicker/bootstrap-clockpicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/clockpicker/jquery-clockpicker.css">
	<script src="${pageContext.request.contextPath}/resources/vendors/clockpicker/bootstrap-clockpicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/clockpicker/jquery-clockpicker.js"></script>
		
	<style>
		.main-panel-popup {
		  transition: width 0.25s ease, margin 0.25s ease;
		  width: 100%;
		  min-height: 100vh;
		  display: -webkit-flex;
		  display: flex;
		  -webkit-flex-direction: column;
		  flex-direction: column;
		}
		
		.custom-border-left {
			border-left: 1px solid rgb(206,212,218);
		}
		
		.custom-border-right {
			border-right: 1px solid rgb(206,212,218);
		}
	</style>
	
	<script>
	 	//팝업창 닫을 시 이동
        function updateTime(){
       		window.opener.top.location.href="<c:url value='/attendance'/>";
            window.close();
        }
	 	
	 	//clockpicker 렌더링
	 	$(function(){ 
			$('.clockpicker').clockpicker();
	 	});
	 	
	 	//출근, 퇴근 체크박스 클릭시 html 추가
	 	function isCheck(data){
	 		if(data=='in'){
	 			if($('input:checkbox[name="intime-checkbtn"]').is(':checked')) {
	 				$('#today-intime').css('display', 'block');
	 				$('#intime-clockpicker').css('display', 'block');
	 			} else {
	 				$('#today-intime').css('display', 'none');
	 				$('#intime-clockpicker').css('display', 'none');
	 			}
	 		} else if(data=='out') {
	 			if($('input:checkbox[name="outtime-checkbtn"]').is(':checked')) {
	 				$('#today-outtime').css('display', 'block');
	 				$('#outtime-clockpicker').css('display', 'block');
	 			} else {
	 				$('#today-outtime').css('display', 'none');
	 				$('#outtime-clockpicker').css('display', 'none');
	 			}
	 		}
	 	}
	</script>
    <!-- End plugin css,js for this page -->
</head>

	<body>
		<div class="main-panel-popup">
			<div class="content-wrapper">
				<div class="grid-margin stretch-card">
               		<div class="card">
                  		<div class="card-body">
                        	<p class="card-title">근무시간 수정 신청서</p>
                        	<div class="table-responsive px-3 py-2">
                        	  <!-- 고정 내용 -->
		                      <table class="table">
		                           <tbody>
		                              <tr class="custom-border-left custom-border-right">
		                                 <td class="custom-border-right"><h4 class="font-weight-bold text-center m-0">작성자</h4></td>
		                                 <td>이춘향</td>
		                                 <td></td>
		                                 <td></td>
		                                 <td class="custom-border-left custom-border-right"><h4 class="font-weight-bold text-center m-0">근무날짜</h4></td>
		                                 <td>2023-02-21</td>
		                                 <td></td>
		                              </tr>
		                              <tr class="custom-border-left custom-border-right">
		                                 <td class="custom-border-right"><h4 class="font-weight-bold text-center m-0">결재자</h4></td>
		                                 <td>홍길동</td>
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
	                        <div class="container-fluid">
	                       		<div class="row justify-content-around">
	                       			<div class="col-md">
	                       			</div>
	                       			<div class="col-md">
		                       			<h4 class="font-weight-bold">기존 근무시간</h4>
	                       			</div>
	                       			<div class="col-md">
    	                   				<h4 class="font-weight-bold">수정 근무시간</h4>
	                       			</div>
	                       		</div>
	                       		<div class="row justify-content-center">
		                       		<div style="border: 1px solid #a3a4a5; opacity: 0.5; width:90%;"></div>
	                       		</div>
	                       		<div class="row px-5 py-2">
	                       			<div class="col-md">
		                       			<div class="form-check font-weight-bold text-info">
											<label class="form-check-label">
												<input type="checkbox" class="form-check-input" name="intime-checkbtn" onclick="isCheck('in')">
												<i class="input-helper"></i>
												<span class="text-primary">출근</span>
											</label>
										</div>
	                       			</div>
	                       			<div class="col-md d-flex align-items-center">
	                       				<div id="today-intime" style="display:none">
		                       				<div class="h5 m-0">08:45</div>
	                       				</div>
	                       			</div>
	                       			<div class="col-md d-flex align-items-center">
	                       				<!-- clockpicker:start -->
	                       				<div id="intime-clockpicker" style="display:none">
		                       				<div class="input-group clockpicker">
												<input type="text" class="form-control" style="height: 30px;">
												<span class="input-group-addon input-group-append border-left" style="height: 30px;">
													<span class="mdi mdi-timer input-group-text"></span>
												</span>
											</div>
	                       				</div>
	                       				<!-- clockpicker:end -->
	                       			</div>
	                       		</div>
	                       		<div class="row px-5 py-2">
	                       			<div class="col-md">
		                       			<div class="form-check font-weight-bold text-info">
											<label class="form-check-label">
												<input type="checkbox" class="form-check-input" name="outtime-checkbtn" onclick="isCheck('out')">
												<i class="input-helper"></i>
												<span class="text-primary">퇴근</span>
											</label>
										</div>
	                       			</div>
	                       			<div class="col-md d-flex align-items-center">
	                       				<div id="today-outtime" style="display:none">
		                       				<div class="h5 m-0">18:45</div>
	                       				</div>
	                       			</div>
	                       			<div class="col-md d-flex align-items-center">
	                       				<!-- clockpicker:start -->
	                       				<div id="outtime-clockpicker" style="display:none">
		                       				<div class="input-group clockpicker">
												<input type="text" class="form-control" style="height: 30px;">
												<span class="input-group-addon input-group-append border-left" style="height: 30px;">
													<span class="mdi mdi-timer input-group-text"></span>
												</span>
											</div>
	                       				</div>
	                       				<!-- clockpicker:end -->
	                       			</div>
	                       		</div>
	                       		<div class="row px-5">
	                       			<blockquote class="blockquote">
	                       				사유
	                       			</blockquote>
	                       		</div>
	                        </div>
                       	</div>
                   	</div>
               </div>
			</div>
		</div>
	</body>

</html>
