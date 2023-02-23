<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<!-- CSS, JS 관련 파일 -->
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- Custom js for this page-->
	<style>
	#overflow {
		overflow:auto;
	}
	
	.highlight:hover {
		font-weight: bold;
		color: #4747A1;
	}
	.container-fluid{
			padding:0px;
			margin:0px;
		}
	.main-panel-popup {
	  transition: width 0.25s ease, margin 0.25s ease;
	  width: 100%;
	  min-height: 100vh;
	  display: -webkit-flex;
	  display: flex;
	  -webkit-flex-direction: column;
	  flex-direction: column;
	}
	</style>
	<script>
	 function setParentText(){
     	opener.document.getElementById("pInput").value = document.getElementById("cInput").innerText;
     	window.close();
     }
	</script>
</head>

<body>
	<div class="main-panel-popup">
			<div class="content-wrapper">
				<!-- Start information -->
				<div class="row">
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<form class="card-body row m-0">
								<div class="container-fluid">
									<div class="card-title row mx-1 my-3">
										주소록
									</div>
									<!-- 드롭다운을 이용해서 부에 따라 사람 불러오기 -->
									<div class="row m-1 mt-3 form-group d-flex flex-column" style="height: 300px; border: 1px solid #ced4da;">
										<div id="overflow">
											<div class="highlight row m-1"><span class="mdi mdi-account-star d-flex align-self-center mx-1"></span>최전무 대표이사<span class="ml-2">[daepyoesa@oti.com]</span></div>
											<div class="highlight row m-1" data-toggle="collapse" data-target="#DIV1"><span class="mdi mdi-folder-account d-flex align-self-center mx-1"></span>공공사업1DIV</div>
											<div id="DIV1" class="row m-1 collapse">
												<div class="d-flex flex-column">
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account-check d-flex align-self-center mx-1"></i>김부련 부장<span class="ml-2">[kimbujang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>오상식 차장<span class="ml-2">[ocharjang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>장그래 사원<span class="ml-2">[jangyes@oti.com]</span></div>
												</div>
											</div>
											<div class="highlight row m-1" data-toggle="collapse" data-target="#DIV2"><span class="mdi mdi-folder-account d-flex align-self-center mx-1"></span>공공사업2DIV</div>
											<div id="DIV2" class="row m-1 collapse">
												<div class="d-flex flex-column p-0">
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account-check d-flex align-self-center mx-1"></i>김부련 부장<span class="ml-2">[kimbujang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>오상식 차장<span class="ml-2">[ocharjang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>장그래 사원<span class="ml-2">[jangyes@oti.com]</span></div>
												</div>
											</div>
											<div class="highlight row m-1" data-toggle="collapse" data-target="#DIV3"><span class="mdi mdi-folder-account d-flex align-self-center mx-1"></span>공공사업3DIV</div>
											<div id="DIV3" class="row m-1 collapse">
												<div class="d-flex flex-column p-0">
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account-check d-flex align-self-center mx-1"></i>김부련 부장<span class="ml-2">[kimbujang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>오상식 차장<span class="ml-2">[ocharjang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>장그래 사원<span class="ml-2">[jangyes@oti.com]</span></div>
												</div>
											</div>
											<div class="highlight row m-1" data-toggle="collapse" data-target="#DIV4"><span class="mdi mdi-folder-lock d-flex align-self-center mx-1"></span>경영지원</div>
											<div id="DIV4" class="row m-1 collapse">
												<div class="d-flex flex-column p-0">
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account-check d-flex align-self-center mx-1"></i>김부련 부장<span class="ml-2">[kimbujang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>오상식 차장<span class="ml-2">[ocharjang@oti.com]</span></div>
													<div class="highlight row my-1 ml-3"><i class="mdi mdi mdi-account d-flex align-self-center mx-1"></i>장그래 사원<span class="ml-2">[jangyes@oti.com]</span></div>
												</div>
											</div>
										</div>
									</div>
									<div class="row m-1 mt-3 mb-5 form-group d-flex flex-column" style="height: 150px; border:1px solid #ced4da;">
										<div id="overflow">
											<div class="highlight row m-1" id="cInput"><i class="mdi mdi mdi-minus d-flex align-self-center mx-1"></i>김부련 부장<span class="ml-2">[kimbujang@oti.com]</span></div>
											<div class="highlight row m-1" id="cInput"><i class="mdi mdi mdi-minus d-flex align-self-center mx-1"></i>오상식 차장<span class="ml-2">[ocharjang@oti.com]</span></div>
											<div class="highlight row m-1" id="cInput"><i class="mdi mdi mdi-minus d-flex align-self-center mx-1"></i>장그래 사원<span class="ml-2">[jangyes@oti.com]</span></div>
										</div>
									</div>
									<div class="row mb-3" >
										<div class="col"></div>
										<button class="col btn btn-primary btn-md mt-1 mx-3" onclick="setParentText()">확인</button>
										<button class="col btn btn-outline-primary btn-md mt-1 mx-3" onclick="window.close()">취소</button>
										<div class="col"></div>
									</div>
															
								</div>
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
</body>

</html>