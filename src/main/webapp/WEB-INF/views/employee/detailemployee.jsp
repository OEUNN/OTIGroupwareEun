<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
function popup(){
    var url = "deletepasswordpopup";
    var name = "delete password popup";
    var option = "width = 500, height =350, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
    window.open(url, name, option);
}
</script>
<div class="row">
	<div class="col-md-12 grid-margin">
		<div class="d-flex justify-content-between align-items-center">
			<div class="card-title mb-0">임직원 조회</div>
			<div class="d-flex">
				<a class="btn btn-md btn-primary mx-2" href="<c:url value='/updateemployee'/>">
					<span class="mdi mdi-lead-pencil align-middle"></span> 
					<span>수정</span>
				</a>
			</div>
		</div>
	</div>
</div>



<div class="row">
	<div class="col-3">
		<img src="${pageContext.request.contextPath}/resources/images/faces/face10.jpg" style="width:200px; height:240px;border-radius:20px;"/>
	</div> <!-- End image card -->
	<!-- start information -->
	<div class="col-9">
		<div class="form-sample">
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-account"></i> 
								<span class="ml-2 font-weight-bold">이름</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;text-align:left;">장영은</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<span class="h3 my-auto mdi mdi-clipboard-account"></span> 
								<span class="ml-2 font-weight-bold">사번</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">20230211</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-cake"></i> 
								<span class="ml-2 font-weight-bold">생년월일</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">1996/11/4</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-clipboard-check"></i> 
								<span class="ml-2 font-weight-bold">채용일</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">2023/2/11</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-human-male-female"></i> 
								<span class="ml-2 font-weight-bold">성별</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">FEMAILE</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-email"></i> 
								<span class="ml-2 font-weight-bold">메일ID</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">longzero1</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-heart"></i> 
								<span class="ml-2 font-weight-bold">결혼여부</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">미혼</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-incognito"></i> 
								<span class="ml-2 font-weight-bold">재직상태</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">재직중</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-pocket"></i> 
								<span class="ml-2 font-weight-bold">병역</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">N</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-flower"></i> 
								<span class="ml-2 font-weight-bold">근무년수</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">1년 미만</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-book-open-page-variant"></i> 
								<span class="ml-2 font-weight-bold">전공</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">정보통신공학과</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-cellphone"></i> 
								<span class="ml-2 font-weight-bold">개인TEL</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">010-0000-0000</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-md-6">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-school"></i> 
								<span class="ml-2 font-weight-bold">최종학력</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">학사</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 m-0">
					<div class="form-group row align-items-center">
						<div class="col-sm-6 text-primary">
							<div class="d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-phone-classic"></i> 
								<span class="ml-2 font-weight-bold">사내TEL</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="font-weight:bold;">02-000-0000</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height:70%;">
				<div class="col-12">
					<div class="form-group row align-items-center">
						<div class="col-sm-3 text-primary">
							<div class="d-flex align-items-center m-1">
								<span class="ml-2 font-weight-bold">비밀번호 초기화</span>
							</div>
						</div>
						<div class="col-sm-4">
							<button onclick="popup()"
								class="btn btn-md btn-inverse-primary btn-icon-text d-flex align-items-center m-1">
								<i class="h3 my-auto mdi mdi-key"></i> <span
									class="ml-2 font-weight-bold">초기화</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- End information box -->
</div>
<!-- 테이블 -->
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
				<td>2002년 2월 22일</td>
				<td>사원</td>
				<td>분당</td>
			</tr>
			<tr>
				<td>2005년 3월 1일</td>
				<td>공공사업2DIV</td>
				<td>분당</td>
			</tr>
			<tr>
				<td>2005년 3월 1일</td>
				<td>공공사업2DIV</td>
				<td>분당</td>
			</tr>
			<tr>
				<td>2005년 3월 1일</td>
				<td>공공사업2DIV</td>
				<td>분당</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- 테이블 끝 -->