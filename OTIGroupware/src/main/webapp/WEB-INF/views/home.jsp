<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
   <!-- inject css, js common file -->
   <%@ include file="/WEB-INF/views/common/head.jsp" %>
   <!-- endinject css, js common file -->

   <!-- Plugin css,js for this page -->
   <!-- End plugin css,js for this page -->
</head>

<body>
  <div class="container-scroller">
    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/_navbar.jsp" %>
    <div class="container-fluid page-body-wrapper">
      <!-- To_do_List/Chat -->
      <%@ include file="/WEB-INF/views/common/_settings-panel.jsp" %>
      <!-- Sidebar -->
      <%@ include file="/WEB-INF/views/common/_sidebar.jsp" %>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
         <!-- 사진 / 퀵메뉴 / 프로필 / 출퇴근 / 달력 -->
          <div class="row">
            <div class="col-md-3 grid-margin stretch-card flex-column">
              <div class="card pt-3 pb-4 px-3" style="background-color: #e7e7ff; box-shadow: 3px 3px 6px #cdd1e1;">
                 <!-- 사진 -->
                 <div class="row justify-content-center">
                   <img src="${pageContext.request.contextPath}/resources/images/faces/face10.jpg" style="width:75%; border-radius: 20px; box-shadow: 3px 3px 6px #4747A1;"/>
               	 </div>
               	 <!-- 프로필 -->
                 <div class="row mt-3 justify-content-center" style="font-family: LeferiPoint-WhiteObliqueA;">
                    <div class="ml-1 pt-1">
                      <span class="font-weight-bold text-primary h2">이춘향</span>
                      <span class="font-weight-bold h5">사원</span>
                      <div class="font-weight-bold text-muted h6 mt-2 text-center">공공사업1DIV</div>
                    </div>
                  </div>
               	 <!-- 잔여일수 -->
                 <div class="row mt-3" style="margin-left: 30px;">
                    <div class="col-md p-0">
	                    <div>
	                      <span class="font-weight-bold text-primary" style="font-family: LeferiPoint-WhiteObliqueA; font-size: 14px;">잔여휴가</span>
	                      <span class="font-weight-bold" >12</span>
	                    </div>
	                    <div>
	                      <span class="font-weight-bold text-primary" style="font-family: LeferiPoint-WhiteObliqueA; font-size: 14px;">잔여공가</span>
	                      <span class="font-weight-bold">0</span>
	                    </div>
                    </div>
                    <div class="col-md p-0">
	                    <div>
	                      <span class="font-weight-bold text-primary" style="font-family: LeferiPoint-WhiteObliqueA; font-size: 14px;">잔여대체휴무</span>
	                      <span class="font-weight-bold">0</span>
	                    </div>
	                    <div>
	                      <span class="font-weight-bold text-primary" style="font-family: LeferiPoint-WhiteObliqueA; font-size: 14px;">잔여경조휴가</span>
	                      <span class="font-weight-bold">0</span>
	                    </div>
                    </div>
                  </div>
                  <!-- 퀵메뉴 -->
                  <div class="row mt-2 justify-content-center">
	                  <div class="row mt-2">
	                       <button onclick="" class="btn btn-md btn-inverse-primary btn-icon-text d-flex align-items-center m-1">
	                          <i class="mdi mdi-lead-pencil"></i>
	                          <span class="ml-2 font-weight-bold">메일쓰기</span>
	                       </button>
	                       <button onclick="" class="btn btn-md btn-inverse-primary btn-icon-text d-flex align-items-center m-1">
	                          <i class="mdi mdi-file-document"></i>
	                          <span class="ml-2 font-weight-bold">결재신청</span>
	                       </button>
	                  </div>
	                  <div class="row mt-1">
	                       <button onclick="" class="btn btn-md btn-inverse-primary btn-icon-text d-flex align-items-center m-1">
	                          <i class="mdi mdi-wallet-travel"></i>
	                          <span class="ml-2 font-weight-bold">휴가신청</span>
	                       </button>
	                       <button onclick="" class="btn btn-md btn-inverse-primary btn-icon-text d-flex align-items-center m-1">
	                          <i class="mdi mdi-emoticon"></i>
	                          <span class="ml-1 font-weight-bold" style="font-size: 12px;">프로필수정</span>
	                       </button>
	                  </div>
                  </div>
              </div>
            </div>
            <!-- 출/퇴근 -->
            <div class="col-md-4 grid-margin stretch-card">
               <div class="card">
                  <div class="card-body">
                        <p class="card-title">오늘의 근무</p>
		               	<!-- 현재시간 -->
		                <div class="row justify-content-around align-items-center mt-4">
		                     <div id="now-date" class="font-weight-bold h6 text-muted"></div>
		                     <div id="now-time" class="font-weight-bold h1"></div>
		                     <script>
		                        $( document ).ready(function() {
		                           const clock1 = document.getElementById("now-date");
		                           const clock2 = document.getElementById("now-time");
		                  
		                           function getClock(){
		                             const d = new Date();
		                             const y = String(d.getFullYear()).padStart(4);
		                             const M = String(d.getMonth() + 1).padStart(2,"0");
		                             const da = String(d.getDate()).padStart(2,"0");
		                             const h = String(d.getHours()).padStart(2,"0");
		                             const m = String(d.getMinutes()).padStart(2,"0");
		                             const s = String(d.getSeconds()).padStart(2,"0");
		                             clock1.innerText = y + "년 " + M + "월 " + da + "일";
		                             clock2.innerText = h + ":" + m + ":" + s;
		                           }
		                        
		                           getClock(); //맨처음에 한번 실행
		                           setInterval(getClock, 1000); //1초 주기로 새로실행
		                        });
		                     </script>
		                </div>
                        <!-- 출퇴근 버튼 -->
                        <div class="row mt-3 justify-content-around">
                           <button class="btn btn-lg btn-outline-primary" style="font-family: LeferiBaseType-RegularA; font-weight: 700; font-size: 120%;">
                           		<h2 class="mdi mdi-alarm-check"></h2>
                           		출근
                      	   </button>
                      	   <div class="my-auto" style="border: 2px solid rgba(75, 73, 172, 0.2); height: 90px;"></div>
                           <button class="btn btn-lg btn-outline-danger" style="font-family: LeferiBaseType-RegularA; font-weight: 700; font-size: 120%;">
                           		<h2 class="mdi mdi-alarm-off"></h2>
                           		퇴근
                       	   </button>
                        </div>
                        <!-- 근무상태 -->
                        <div class="row mt-4 justify-content-center">
                           <button class="btn btn-lg btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" 
                                 aria-haspopup="true" aria-expanded="true" style="width: 87%; font-size: 130%; font-weight: bold;">
                           	    근무중
                           </button>
                           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="width: 85%;">
                             <h6 class="dropdown-header">근무중</h6>
                             <a class="dropdown-item" href="#">출장</a>
                             <a class="dropdown-item" href="#">외근</a>
                             <div class="dropdown-divider"></div>
                             <a class="dropdown-item" href="#">기타</a>
                           </div>
                        </div>
                        <!-- 출퇴근 시간출력 -->
                        <div class="row mt-4 justify-content-around">
                           <div class="card card-dark-blue">
			                  <div class="card-body">
			                      <p class="card-title text-white">출근</p>
                               	  <p class="fs-30 ml-1 px-2 py-4">08:45:00</p>
		                      </div>
		                   </div>
                           <div class="card card-light-danger">
			                  <div class="card-body">
			                      <p class="card-title text-white">퇴근</p>
                               	  <p class="fs-30 ml-1 px-2 py-4">18:15:00</p>
		                      </div>
		                   </div>
                      </div>
                  </div>
               </div>
            </div>
            <!-- 달력  -->
            <div class="col-md-5 grid-margin">
            <%@ include file="/WEB-INF/views/fullcalendar/home_calendar.jsp" %>
              </div>
          </div>
          <div class="row">
           <!-- 최근메일 -->
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">최근 받은메일</p>
                  <div class="card card-light-blue mb-4">
	                  <div class="card-body">
	                      <p class="card-title text-white">Mail</p>
	                      <div class="row">
	                         <div class="col-md">받은메일<span class="pl-2 h3 font-weight-bold">0</span></div>
	                         <div class="col-md">안읽음<span class="pl-2 h3 font-weight-bold">1</span></div>
	                         <div class="col-md">임시저장<span class="pl-2 h3 font-weight-bold">2</span></div>
	                         <div class="col-md">중요메일<span class="pl-2 h3 font-weight-bold">0</span></div>
	                      </div>
                      </div>
                 </div>
                  <div class="table-responsive">
                      <table class="table table-hover">
                           <thead>
                             <tr>
                               <th>문서번호</th>
                               <th>발신인</th>
                               <th>제목</th>
                               <th>날짜</th>
                             </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                              </tr>
                              <tr>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                              </tr>
                              <tr>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                              </tr>
                           </tbody>
                       </table>
                    </div>
                </div>
              </div>
            </div>
            <!-- 최근 결재내역-->
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">최근 결재내역</p>
                  <div class="card card-dark-blue mb-4">
                  <div class="card-body">
                      <p class="card-title text-white">Approval</p>
                       <div class="row">
                         <div class="col-md">기안<span class="pl-2 h3 font-weight-bold">0</span></div>
                         <div class="col-md">결재<span class="pl-2 h3 font-weight-bold">3</span></div>
                         <div class="col-md">승인<span class="pl-2 h3 font-weight-bold">0</span></div>
                         <div class="col-md">반려<span class="pl-2 h3 font-weight-bold">1</span></div>
                      </div>
                    </div>
                 </div>
                  <div class="table-responsive">
                      <table class="table table-hover">
                           <thead>
                             <tr>
                               <th>문서번호</th>
                               <th>발신인</th>
                               <th>제목</th>
                               <th>날짜</th>
                             </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                              </tr>
                              <tr>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                              </tr>
                              <tr>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                                 <td>gdgd</td>
                              </tr>
                           </tbody>
                       </table>
                    </div>
                </div>
              </div>
             </div>
          </div>
          <!-- 사내공지 / 인사발령 -->
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <div class="row">
                          <div class="col-md-12 col-xl-3 d-flex justify-content-start">
                            <div class="ml-xl-4 mt-3">
                              <h1 class="text-primary font-weight-bold">사내공지</h1>
                              <div class="d-flex justify-content-center text-primary mt-2"><h1 class="mdi mdi-comment-alert" style="font-size: 90px;"></h1></div>
                            </div>  
                          </div>
                          <div class="col-md-12 col-xl-9">
                            <div class="row">
                                <div>
                               <table class="table table-hover" style="width: 250%">
                                    <thead>
                                      <tr>
                                        <th>문서번호</th>
                                        <th>제목</th>
                                        <th>작성인</th>
                                        <th>날짜</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                       </tr>
                                       <tr>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                       </tr>
                                       <tr>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                       </tr>
                                    </tbody>
                                </table>
                             </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <div class="row">
                          <div class="col-md-12 col-xl-3 d-flex justify-content-start">
                            <div class="ml-xl-4 mt-3">
                              <h1 class="text-primary font-weight-bold">인사발령</h1>
                              <div class="d-flex justify-content-center text-primary mt-2"><h1 class="mdi mdi-human-greeting" style="font-size: 90px;"></h1></div>
                            </div>  
                          </div>
                          <div class="col-md-12 col-xl-9">
                            <div class="row">
                                <div>
                               <table class="table table-hover" style="width: 250%">
                                    <thead>
                                      <tr>
                                        <th>문서번호</th>
                                        <th>제목</th>
                                        <th>작성인</th>
                                        <th>날짜</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                       </tr>
                                       <tr>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                       </tr>
                                       <tr>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                          <td>gdgd</td>
                                       </tr>
                                    </tbody>
                                </table>
                             </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#detailedReports" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#detailedReports" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.jsp -->
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