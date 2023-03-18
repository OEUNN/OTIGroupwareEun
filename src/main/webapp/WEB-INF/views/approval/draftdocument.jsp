<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	
	<!-- Custom js for this page-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/documentlist.css"/>
	<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom/search.js"></script>
	<script>
	$(function(){
		$('.datepicker').datepicker({
		});	
	});
	
	$(() => {
		const checkAll = $('#checkAll');
		const checklist = $('.checklist');
		
		checkAll.change(function() {
		  checklist.prop('checked', checkAll.prop('checked'));
		});
		
		checklist.change(function() {
		  const allChecked = checklist.filter(':checked').length === checklist.length;
		  checkAll.prop('checked', allChecked);
		});
	});
	
	$(() => {
		if ($("#resultCount").length !== 0) {
			let resultCount = $("#resultCount").val();
			
			if ($("#type").val() === 'delete') {
				alert(resultCount + "개가 삭제되었습니다.");
			}
			
			else if($("#type").val() === 'retrieve') {
				alert(resultCount + "개가 회수되었습니다.");
			}
		}
	});
	</script>
</head>

<body >
<div class="container-scroller">
	<c:if test="${result != null && result == 'changed'}">
	<input id="resultCount" type="hidden" value="${resultCount}"/>
	<input id="type" type="hidden" value="${type}"/>
	</c:if>
	<!-- partial:../../partials/_navbar.jsp -->
	<%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
	
	<!-- partial -->
	<div class="container-fluid page-body-wrapper">
	
	  	<!-- partial:../../partials/_settings-panel.jsp -->
		<!-- partial -->
		
		<!-- partial:../../partials/_sidebar.jsp -->
		<%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
		<!-- partial -->

		<!-- ***** content-start ***** -->
		<div class="main-panel">
	        <div class="content-wrapper">
	        	<div class="row">
            		<div class="col-md-12">
						<div class="card grid-margin">
							<div class="card-body">
								<p class="card-title mb-0">기안문서함</p>
			        			<div class="card gird-margin shadow-2 my-3" style="background-color: #e7e7ff;">
				        			<div class="card-body">
			        					<div class="row py-0" style="padding: 1.25rem;">
		        							<div class="d-flex">
		        								<form id="searchForm" class="d-flex" action="<c:url value="/approval/draftdocument/search"></c:url>" method="get">
		        								<div class="input-group w-75" style="border-radius: 18px; background-color: white;">
													<div class="input-group-prepend hover-cursor mx-3" id="navbar-search-icon">
														<span class="input-group-text" id="search" style="background: transparent; border: 0; color: #000; padding: 0;">
														<i class="icon-search" style="font-size: 1.25rem; color: #6C7383;"></i>
														</span>
													</div>
													<div id="searchBar" class="align-self-center">
														<c:if test="${searchQuery.docId != null}">
														<div id="문서번호" class="badge badge-warning font-weight-bold">
															<input type="hidden" name="docId" value="${searchQuery.docId}"></input>
															문서번호: ${searchQuery.docId}<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem(문서번호)"></i></span>
														</div>
														</c:if>
														<c:if test="${searchQuery.docState != null}">
														<div id="결재상태" class="badge badge-warning font-weight-bold docState">
															<input type="hidden" name="docState" value="${searchQuery.docState}"></input>
															결재상태: ${searchQuery.docState}<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem(결재상태)"></i></span>
														</div>
														</c:if>
														<c:if test="${searchQuery.docTitle != null}">
														<div id="제목" class="badge badge-warning font-weight-bold">
															<input type="hidden" name="docTitle" value="${searchQuery.docTitle}"></input>
															제목: ${searchQuery.docTitle}<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem(제목)"></i></span>
														</div>
														</c:if>
														<c:if test="${searchQuery.docReportStartDate != null && searchQuery.docReportEndDate != null}">
														<div id="상신날짜" class="badge badge-warning font-weight-bold">
															<input type="hidden" name="docReportStartDate" value="${searchQuery.docReportStartDate}"></input>
															<input type="hidden" name="docReportEndDate" value="${searchQuery.docReportEndDate}"></input>
															상신날짜: ${searchQuery.docReportStartDate} ~ ${searchQuery.docReportEndDate}
															<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem(상신날짜)"></i></span>
														</div>
														</c:if>
														<c:if test="${searchQuery.docCompleteStartDate != null && searchQuery.docCompleteEndDate != null}">
														<div id="완결날짜" class="badge badge-warning font-weight-bold">
															<input type="hidden" name="docReportStartDate" value="${searchQuery.docCompleteStartDate}"></input>
															<input type="hidden" name="docReportEndDate" value="${searchQuery.docCompleteEndDate}"></input>
															완결날짜: ${searchQuery.docCompleteStartDate} ~ ${searchQuery.docCompleteEndDate}
															 <span class="mx-1"><i class="mdi mdi-close" onclick="removeItem(완결날짜)"></i></span>
														</div>
														</c:if>
													</div>
													<input type="text" class="form-control mx-4" id="navbar-search-input" name="searchBar" placeholder="검색할 내용 입력" aria-label="search" aria-describedby="search" style="margin-left: .7rem; font-size: 1.25rem; color: #6C7383; border: 0; color: #000; padding: 0;">
													<input type="hidden" name="pageNo" value="${pager.pageNo}">
												</div>
												<button onclick="submitForm()" class="font-weight-bold btn btn-md btn-warning ml-2">검색</button>
			        							</form>
		        							</div>
			        					</div>
			        				</div>
			        			</div>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input id="checkAll" type="checkbox" class="form-check-input">
														</label>
													</div>
												</th>
												<th class="px-0 pb-2 border-bottom">문서번호<i class="icon-search" onclick="searchDocId('문서번호')"></i>
											    </th>
												<th class="px-0 border-bottom pb-2">결재상태
												<i class="mdi mdi-menu-down" data-toggle="dropdown"></i>
											    <div class="dropdown-menu mt-3" style="width: auto;">
													<a class="dropdown-item" onclick="searchState('진행')">진행</a>
													<a class="dropdown-item" onclick="searchState('반려')">반려</a>
													<a class="dropdown-item" onclick="searchState('회수')">회수</a>
											    </div>
												</th>
												<th class="border-bottom pb-2">제목<i class="icon-search" onclick="searchDocTitle('제목')"></i>
												</th>
												<th class="border-bottom pb-2">상신날짜
												<i class="mdi mdi-menu-down" data-toggle="dropdown"></i>
												<div class="dropdown-menu">
					        						<div class="datepicker dropdown-item input-daterange input-group">
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input id="startReportDate" type="text" class="input-sm form-control font-weight-bold" name="start" onchange="searchReportDate('상신날짜')" style="border:0px; text-align: right;"/>
													    <span class="input-group-addon text-primary font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input id="endReportDate" type="text" class="input-sm form-control font-weight-bold" name="end" onchange="searchReportDate('상신날짜')" style="border:0px; text-align: right;"/>
													</div>
												</div>
												</th>
												<th class="border-bottom pb-2">완결날짜
												<i class="mdi mdi-menu-down" data-toggle="dropdown"></i>
												<div class="dropdown-menu">
					        						<div class="datepicker dropdown-item input-daterange input-group">
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input id="startCompleteDate" type="text" class="input-sm form-control font-weight-bold" name="start" onchange="searchCompleteDate('완결날짜')" style="border:0px; text-align: right;"/>
													    <span class="input-group-addon text-primary font-weight-bold d-flex align-self-center mx-2 fs-30">~</span>
														<span class="mdi mdi-calendar-clock text-primary" style="position: relative; z-index: 1; top:15px; left: 15px;"></span>
													    <input id="endCompleteDate" type="text" class="input-sm form-control font-weight-bold" name="end" onchange="searchCompleteDate('완결날짜')" style="border:0px; text-align: right;"/>
													</div>
												</div>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${documents}" var="document" varStatus="status">
											<c:set value="${approvalLinesList[status.index]}" var="approvalLines"/>
											<tr>
												<td class="py-0 pl-1">
													<div class="form-check font-weight-bold text-info my-1">
														<label class="form-check-label">
															<input type="checkbox" class="checklist form-check-input" name="docId" form="checkedBox" value="${document.docId}">
														</label>
													</div>
												</td>
												<td class="px-0">${document.docId}</td>
												<td class="px-0">
													<c:choose>
													<c:when test="${document.docState == '진행'}">
													<div class="badge badge-warning font-weight-bold d-flex" style="width: fit-content;">
													<i class="mdi mdi-file-document d-flex align-self-center mr-1"></i><span>진행</span></div>
													</c:when>
													<c:when test="${document.docState == '열람'}">
													<div class="badge badge-warning font-weight-bold d-flex" style="width: fit-content;">
													<i class="mdi mdi-file-document d-flex align-self-center mr-1"></i><span>열람</span></div>
													</c:when>
													<c:when test="${document.docState == '승인'}">
													<div class="badge badge-success font-weight-bold d-flex" style="width: fit-content;">
													<i class="mdi mdi-check-circle-outline d-flex align-self-center mr-1"></i><span>승인</span></div>
													</c:when>
													<c:when test="${document.docState == '반려'}">
													<div class="badge badge-danger font-weight-bold d-flex" style="width: fit-content;">
													<i class="mdi mdi-block-helper d-flex align-self-center mr-1"></i><span>반려</span></div>
													</c:when>
													<c:when test="${document.docState == '회수'}">
													<div class="badge badge-secondary font-weight-bold d-flex" style="width: fit-content;">
													<i class="mdi mdi-replay d-flex align-self-center mr-1"></i><span>회수</span></div>
													</c:when>
													</c:choose>
												</td>
												<td>
													<div>
														<p class="mb-0"><a href="<c:url value='/approval/viewdetail/${document.docId}'/>"><span class="font-weight-bold mr-2">${document.docTitle}</span></a></p>
														<p class="mb-0">
															<c:forEach items="${approvalLines}" var="approvalLine" varStatus="i">
															<c:choose>
															<c:when test="${approvalLine.aprvLineState == '승인'}">
															<span class="font-weight-light text-success mr-2">
															</c:when>
															<c:when test="${approvalLine.aprvLineState == '반려'}">
															<span class="font-weight-light text-danger mr-2">
															</c:when>
															<c:when test="${approvalLine.aprvLineState == '열람'}">
															<span class="font-weight-light text-warning mr-2">
															</c:when>
															<c:when test="${approvalLine.aprvLineState == '미결'}">
															<span class="font-weight-light text-muted mr-2">
															</c:when>
															</c:choose>
															${approvalLine.employee.empName}</span>
															<c:if test="${i.last != true}">
															<span class="font-weight-light mr-2">>></span>
															</c:if>
															</c:forEach>
														</p>
													</div>
												</td>
												<td><fmt:formatDate value="${document.docReportDate}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
												<c:if test="${document.docCompleteDate != null}">
												<td><fmt:formatDate value="${document.docCompleteDate}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
												</c:if>
												<c:if test="${document.docCompleteDate == null}">
												<td>N/A</td>
												</c:if>
											</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="mt-2">
										<div class="d-flex justify-content-end">
											<form id="checkedBox" action="<c:url value='/approval/selected'></c:url>" method="post">
											<input type="hidden" name="docType" value="draft">
											</form>
											<button class="btn btn-danger btn-sm mx-1" type="submit" form="checkedBox" name="type" value="delete">선택 삭제</button>
											<button class="btn btn-secondary btn-sm mx-1" type="submit" form="checkedBox" name="type" value="retrieve">선택 회수</button>
										</div>	
										<ul class="pagination justify-content-center pb-0 mb-0">
										<c:if test="${pager.totalRows > 0}">
											<!-- 처음 -->
											<li class="page-item" onclick="submitFormWithPageNo(1)"><a class="page-link">처음</a></li>
											
											<!-- 이전 -->
											<c:if test = "${pager.groupNo > 1}">
											<li class="page-item" onclick="submitFormWithPageNo(${pager.startPageNo - 1})"><a class="page-link">이전</a></li>
											</c:if>
											
											<!-- 페이지그룹 -->
											<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo != i}">
											<li class="page-item" onclick="submitFormWithPageNo(${i})"><a class="page-link">${i}</a></li>
											</c:if>
											<c:if test="${pager.pageNo == i}">
											<li class="page-item active" onclick="submitFormWithPageNo(${i})"><a class="page-link">${i}</a></li>
											</c:if>
											</c:forEach>
											
											<!-- 다음 -->
											<c:if test = "${pager.groupNo < pager.totalGroupNo }">
											<li class="page-item" onclick="submitFormWithPageNo(${pager.endPageNo + 1})"><a class="page-link">다음</a></li>
											</c:if>
											
											<!-- 마지막 -->
											<li class="page-item" onclick="submitFormWithPageNo(${pager.totalPageNo})"><a class="page-link">마지막</a></li>
										</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- ***** content-end ***** -->
			
		<!-- partial:../../partials/_footer.jsp -->
		<%@ include file="/WEB-INF/views/common/_footer.jsp" %>
		<!-- partial -->
		
		</div>
		<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
</body>

</html>