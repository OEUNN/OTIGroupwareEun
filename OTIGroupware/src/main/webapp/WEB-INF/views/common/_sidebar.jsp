<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/home">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title" style="font-family: Nunito, sans-serif;">HOME</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="mdi mdi-email menu-icon"></i>
              <span class="menu-title">메일</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">메일쓰기</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/dropdowns.html">받은 메일</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">보낸 메일</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">중요 메일</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">임시 보관함</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">휴지통</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="mdi mdi-view-list menu-icon"></i>
              <span class="menu-title">게시판</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">사내 공지</a></li>
                <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">인사 발령</a></li>
                <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">경조사</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="mdi mdi-file-multiple menu-icon"></i>
              <span class="menu-title">전자결재</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">전체문서함</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">기안작성</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">기안함</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">임시저장함</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">반려/회수함</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">결재함</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="mdi mdi-account-card-details menu-icon"></i>
              <span class="menu-title" style="font-family: Nunito, sans-serif;">HR</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
				<!-- 공통 -->
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/hr/attendance">나의 근무</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/tables/basic-table.html">나의 휴가</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/tables/basic-table.html">부서휴가현황</a></li>
                <!-- 부서장 -->
                <li class="nav-item"> <a class="nav-link" href="pages/tables/basic-table.html">HR결재내역</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="mdi mdi-sitemap menu-icon"></i>
              <span class="menu-title">조직도</span>
            </a>
          </li>
        </ul>
      </nav>