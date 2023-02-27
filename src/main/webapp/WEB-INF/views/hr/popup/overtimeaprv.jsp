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
		//form 내용 제출 후, 이동
	    function overTimeAprv(data){
	    	if($('#textarea-reason').val()){
		        window.opener.top.location.href="<c:url value='/hr/hrapplication'/>";
		        window.close();
	    	}
	
	    	if(data == "반려") {
	        	$("#refuse-reason").css("display", "block");
	        	$("#cancel-btn").css("display", "block");
	        	$("#approve-btn").css("display", "none");
	        } else if(data == "승인") {
		        window.opener.top.location.href="<c:url value='/hr/hrapplication'/>";
		        window.close();
	        }
	    }
		
	  	//취소버튼
	 	function cancel() {
	 		$('#textarea-reason').val('');
	 		$("#refuse-reason").css("display", "none");
        	$("#cancel-btn").css("display", "none");
        	$("#approve-btn").css("display", "block");
	 	}
	</script>
    <!-- End plugin css,js for this page -->
</head>

<body>
	<form>
		<div class="main-panel-popup">
			<div class="content-wrapper">
				<div class="grid-margin stretch-card">
	              		<div class="card">
	                 		<div class="card-body">
		                       	<p class="card-title">추가근무 보고서</p>
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
		                       		<div class="row ml-3">
		                       			<div class="col-md">
			                       			<h4 class="font-weight-bold">추가 근무시간</h4>
		                       			</div>
		                       		</div>
		                       		<div class="row justify-content-center">
			                       		<div style="border: 1px solid #a3a4a5; opacity: 0.5; width:90%;"></div>
		                       		</div>
		                       		<!-- 추가근무시간 el -->
		                       		<div class="row px-5 py-2 mt-2">
		                       			<div class="col-md d-flex justify-content-center">
		                       				<h4 class="mx-4 mb-0 text-primary font-weight-bold">시작시간</h4>
		                       				<h4 class="mx-4 mb-0 text-primary font-weight-bold">~</h4>
		                       				<h4 class="mx-4 mb-0 text-primary font-weight-bold">종료시간</h4>
		                       			</div>
		                       		</div>
		                       		<!-- 휴가사유 -->
		                      		<div class="row px-5 mt-4 justify-content-start">
	                      				<h4 class="mx-4 mb-0 font-weight-bold ">사유</h4>
		                      		</div>
		                      		<div class="row px-5 mt-3 ml-1">
	                      				<h6 class="ml-1 mb-0 text-primary font-weight-bold">연차 사용</h6>
		                      		</div>
		                        	<div class="row justify-content-center mt-3">
		                       			<div style="border-bottom: 2px solid #4B49AC; width:90%;"></div>
		                      		</div>
		                      		<!-- 반려사유 c:if 사용하기 -->
		                      		<div id="refuse-reason" class="row px-5 mt-4 justify-content-center" style="display:none;">
		                       			<div class="form-group">
						                	<label class="ml-1" for="reason"><div class="h5 m-0 font-weight-bold text-danger">반려사유</div></label>
						                    <textarea class="form-control" id="textarea-reason" rows="5" cols="68"></textarea>
					                    </div>
		                       		</div>
		                        </div>
								<!-- 버튼 -->
		                        <div class="row px-5 mt-3 justify-content-end">
		                        	<button id="approve-btn" onclick="overTimeAprv('승인')" type="submit" class="btn btn-primary mr-2">승인</button>
		                        	<button id="cancel-btn" onclick="cancel()" type="button" class="btn btn-inverse-primary mr-2" style="display:none">취소</button>
		                        	<button onclick="overTimeAprv('반려')" type="button" class="btn btn-danger mr-2">반려</button>
		                        </div>
		                        <!-- 변경내용:end -->
	                      	</div>
	                      	<!-- card-body:end -->
	                  	</div>
	              </div>
			</div>
		</div>
	</form>
</body>

</html>
