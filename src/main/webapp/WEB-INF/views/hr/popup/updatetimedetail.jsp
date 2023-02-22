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
    <!-- End plugin css,js for this page -->
</head>

<body>
	<form>
		<div class="main-panel-popup">
			<div class="content-wrapper">
				<div class="grid-margin stretch-card">
	              		<div class="card">
	                 		<div class="card-body">
		                       	<p class="card-title">근무시간수정 신청서</p>
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
		                       		<!-- 출근부분 -->
		                       		<div class="row px-5 py-2 mt-2">
		                       			<div class="col-md">
											<h4 class="mx-4 mb-0 text-primary font-weight-bold">출근</h4>
		                       			</div>
		                       			<div class="col-md d-flex align-items-center pr-0">
		                       				<div class="h5 mb-0 ml-3 text-muted">08:45</div>
		                       			</div>
		                       			<div class="col-md d-flex align-items-center pl-0">
		                       				<h6 class="ml-5 mb-0 text-primary font-weight-bold">수정된시간</h6>
		                       			</div>
		                       		</div>
		                       		<!-- 퇴근부분 -->
		                       		<div class="row px-5 py-2">
		                       			<div class="col-md">
		                       				<h4 class="mx-4 mb-0 text-primary font-weight-bold">퇴근</h4>
		                       			</div>
		                       			<div class="col-md d-flex align-items-center pr-0">
		                       				<div class="h5 mb-0 ml-3 text-muted">18:45</div>
		                       			</div>
		                       			<div class="col-md d-flex align-items-center pl-0">
		                       				<h6 class="ml-5 mb-0 text-primary font-weight-bold">수정된시간</h6>
		                       			</div>
		                       		</div>
		                       		<!-- 사유 -->
		                      		<div class="row px-5 py-2 mt-3">
	                       				<div class="col-md">
		                       				<h4 class="mx-4 mb-0 font-weight-bold">사유</h4>
		                       			</div>
	                       			</div>
		                      		<div class="row px-5 mt-2 ml-1">
	                      				<div class="col-md">
	                      					<h6 class="ml-1 mb-0 text-primary font-weight-bold">근무했음</h6>
		                      			</div>
		                      		</div>
		                        	<div class="row justify-content-center mt-3">
		                       			<div style="border: 1px solid #a3a4a5; opacity: 0.5; width:90%;"></div>
		                      		</div>
		                        </div>
								<!-- 버튼 -->
		                        <div class="row px-5 mt-3 justify-content-end">
			                        <button onclick="window.close()" type="button" class="btn btn-inverse-primary mr-2">닫기</button>
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
