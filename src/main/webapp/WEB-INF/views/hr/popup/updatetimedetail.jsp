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
			                                 <td>${atdExcp.empName}</td>
			                                 <td></td>
			                                 <td></td>
			                                 <td class="custom-border-left custom-border-right"><h4 class="font-weight-bold text-center m-0">근무날짜</h4></td>
			                                 <td>${atdExcp.atdExcpDate}</td>
			                                 <td></td>
			                              </tr>
			                              <tr class="custom-border-left custom-border-right">
			                                 <td class="custom-border-right"><h4 class="font-weight-bold text-center m-0">결재자</h4></td>
			                                 <td>${atdExcp.atdExcpApprovalEmpName}</td>
			                                 <td></td>
			                                 <td></td>
			                                 <td class="custom-border-left custom-border-right"><h4 class="font-weight-bold text-center m-0">신청결과</h4></td>
			                                 <td>
			                                 	<!-- 결재상태 -->
												<c:if test="${atdExcp.atdExcpProcessState == '미처리'}">
													<div class="badge badge-secondary font-weight-bold text-white">${atdExcp.atdExcpProcessState}</div>
												</c:if>
												<c:if test="${atdExcp.atdExcpProcessState == '승인'}">
													<div class="badge badge-success font-weight-bold">${atdExcp.atdExcpProcessState}</div>
												</c:if>
												<c:if test="${atdExcp.atdExcpProcessState == '반려'}">
													<div class="badge badge-danger font-weight-bold">${atdExcp.atdExcpProcessState}</div>
												</c:if>
			                                 </td>
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
		                       		<c:if test="${!empty atdExcp.atdExcpInTime}">
			                       		<div class="row px-5 py-2 mt-2">
			                       			<div class="col-md">
												<h4 class="mx-4 mb-0 text-primary font-weight-bold">출근</h4>
			                       			</div>
			                       			<div class="col-md d-flex align-items-center pr-0">
			                       				<div class="h5 mb-0 ml-3 text-muted">${atdExcp.atdInTime}</div>
			                       			</div>
			                       			<div class="col-md d-flex align-items-center pl-0">
			                       				<h6 class="ml-5 mb-0 text-primary font-weight-bold">${atdExcp.atdExcpInTime}</h6>
			                       			</div>
			                       		</div>
		                       		</c:if>
		                       		<!-- 퇴근부분 -->
		                       		<c:if test="${!empty atdExcp.atdExcpOutTime}">
			                       		<div class="row px-5 py-2">
			                       			<div class="col-md">
			                       				<h4 class="mx-4 mb-0 text-primary font-weight-bold">퇴근</h4>
			                       			</div>
			                       			<div class="col-md d-flex align-items-center pr-0">
			                       				<div class="h5 mb-0 ml-3 text-muted">${atdExcp.atdOutTime}</div>
			                       			</div>
			                       			<div class="col-md d-flex align-items-center pl-0">
			                       				<h6 class="ml-5 mb-0 text-primary font-weight-bold">${atdExcp.atdExcpOutTime}</h6>
			                       			</div>
			                       		</div>
		                       		</c:if>
		                       		<!-- 사유 -->
		                      		<div class="row px-5 py-2 mt-3">
	                       				<div class="col-md">
		                       				<h4 class="mx-4 mb-0 font-weight-bold">사유</h4>
		                       			</div>
	                       			</div>
		                      		<div class="row px-5 mt-2 ml-1">
	                      				<div class="col-md">
	                      					<h6 class="ml-1 mb-0 text-primary font-weight-bold">${atdExcp.atdExcpReason}</h6>
		                      			</div>
		                      		</div>
		                        	<div class="row justify-content-center mt-3">
		                       			<div style="border-bottom: 2px solid #4B49AC; width:90%;"></div>
		                      		</div>
		                      		<!-- 반려사유 -->
		                      		<c:if test="${!empty atdExcp.atdExcpOpinion}">
			                      		<div class="row px-5 mt-3 justify-content-start">
		                      				<h4 class="mx-4 mb-0 font-weight-bold text-danger">반려 사유</h4>
			                      		</div>
			                      		<div class="row px-5 mt-3 ml-1">
		                      				<h6 class="ml-1 mb-0 text-danger">${atdExcp.atdExcpOpinion}</h6>
			                      		</div>
		                      		</c:if>
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
