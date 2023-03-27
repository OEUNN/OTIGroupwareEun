<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.table th, .jsgrid .jsgrid-table th,
	.table td,
	.jsgrid .jsgrid-table td {
		padding: 0.825rem 2.375rem;
	}
</style>
<div class="row">
	<div class="col-md-12 grid-margin">
		<div class="d-flex justify-content-between align-items-center">
			<div class="card-title mb-0">임직원 조회</div>
			<div class="d-flex">
				<a class="btn btn-md btn-primary mx-2" href="<c:url value='/employee/updateemployee/${emp.empId}'/>">
					<span class="mdi mdi-lead-pencil align-middle"></span> 
					<span>수정</span>
				</a>
			</div>
		</div>
	</div>
</div>



<div class="row">
	<div class="col-3">
		<img src="<c:url value='/employee/file/${emp.empId}'/>" style="width:200px; height:240px;border-radius:20px;"/>
	</div> <!-- End image card -->
	<!-- start information -->
	<div class="col-9">
		<div class="form-sample">
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-account"></i> 
								<span class="ml-2 font-weight-bold">이름</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${emp.empName}</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<span class="h3 my-auto mdi mdi-clipboard-account"></span> 
								<span class="ml-2 font-weight-bold">사번</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${emp.empId}</div>
							<input type="hidden" id="id" value="${emp.empId}"/>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-cake"></i> 
								<span class="ml-2 font-weight-bold">생년월일</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${empDetail.empDetailBirthday}"/></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-clipboard-check"></i> 
								<span class="ml-2 font-weight-bold">입사일</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${empDetail.empDetailEmploymentDate}"/></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-human-male-female"></i> 
								<span class="ml-2 font-weight-bold">성별</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${empDetail.empDetailGender}</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-email"></i> 
								<span class="ml-2 font-weight-bold">메일ID</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${emp.empMail}</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-heart"></i> 
								<span class="ml-2 font-weight-bold">결혼여부</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${empDetail.empDetailMarriedYN}</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-incognito"></i> 
								<span class="ml-2 font-weight-bold">재직상태</span>
							</div>
						</div>
						<div class="col-sm-6">
							<c:if test="${empDetail.empDetailEmploymentState == 'work'}">
								<div>재직중</div>
							</c:if>
							<c:if test="${empDetail.empDetailEmploymentState == 'fire'}">
								<div>퇴사</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-pocket"></i> 
								<span class="ml-2 font-weight-bold">병역</span>
							</div>
						</div>
						<div class="col-sm-6">
							<c:if test = "${empDetail.empDetailMilitaryServiceYN == 'Y'}">
								<div>군필</div>
							</c:if>
							<c:if test = "${empDetail.empDetailMilitaryServiceYN == 'N'}">
								<div>미필</div>
							</c:if>
							<c:if test = "${empDetail.empDetailMilitaryServiceYN == 'X'}">
								<div>미해당</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-flower"></i> 
								<span class="ml-2 font-weight-bold">근무년수</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${empDetail.empDetailSeniority}년</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-book-open-page-variant"></i> 
								<span class="ml-2 font-weight-bold">전공</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${empDetail.empDetailMajor}</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-cellphone"></i> 
								<span class="ml-2 font-weight-bold">개인TEL</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${emp.empPhoneNumber }</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-school"></i> 
								<span class="ml-2 font-weight-bold">최종학력</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${empDetail.empDetailEducation}</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 m-0">
					<div class=" row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-phone-classic"></i> 
								<span class="ml-2 font-weight-bold">사내TEL</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div>${emp.empExtensionNumber}</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-2" style="height:70%;">
				<div class="col-12 ">
					<div class=" row align-items-center">
						<div class="col-sm-3 text-primary">
							<div class="d-flex align-items-center m-1">
								<span class="ml-2 font-weight-bold">비밀번호 초기화</span>
							</div>
						</div>
						<div class="col-sm-4">
							<button onclick="popup('${emp.empId}')"
								class="btn btn-md btn-inverse-primary btn-icon-text d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-key"></i> <span
									class="ml-2 font-weight-bold">초기화</span>
							</button>
						</div>
						<input type="hidden" id="id"/>
					</div>
				</div>
			</div>
		</div>
	</div><!-- End information box -->
</div>
<c:if test ="${emp.empId=='1402181'}">
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th class="text-primary col-2 h3">근무 기간</th>
					<th class="text-primary col-7 h3">프로젝트 명</th>
					<th class="text-primary col-3 h3">근무지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2002년 3월 1일</td>
					<td>대법원 공공사업 프로젝트</td>
					<td>분당</td>
				</tr>
				<tr>
					<td>2005년 3월 1일</td>
					<td>대법원 사내그룹웨어 1차시</td>
					<td>분당</td>
				</tr>
				<tr>
					<td>20010년 3월 1일</td>
					<td>대법원 사내그룹웨어 2차시</td>
					<td>분당</td>
				</tr>
				<tr>
					<td>2015년 3월 1일</td>
					<td>OTI회사 사내 그룹웨어 업데이트</td>
					<td>분당</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test ="${emp.empId !='1402181'}">
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th class="text-primary col-2 h3">근무 기간</th>
					<th class="text-primary col-7 h3">프로젝트 명</th>
					<th class="text-primary col-3 h3">근무지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2002년 3월 1일</td>
					<td>지역난방공사 업무표 1차시</td>
					<td>분당</td>
				</tr>
				<tr>
					<td>2007년 3월 1일</td>
					<td>지역난방공사 업무표 2차시</td>
					<td>분당</td>
				</tr>
				<tr>
					<td>20012년 3월 1일</td>
					<td>지역난방공사 업무표 3차시</td>
					<td>분당</td>
				</tr>
				<tr>
					<td>2020년 3월 1일</td>
					<td>OTI회사 사내 그룹웨어 업데이트</td>
					<td>분당</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
