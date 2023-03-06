<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#main-logo1 > img, #main-logo2 > img {
    	animation-name: fadeChange;
  	 	animation-duration: 10s;
   		animation-iteration-count: infinite;
  		animation-timing-function: linear;
	}
	
	@keyframes fadeChange {
	    0%   {opacity: 1;}
	    25%  {opacity: 0.5;}
	    50% {opacity: 0;}
	    75% {opacity: 0.5;}
	    100% {opacity: 1;}
	}
</style>

<script>
	$(function() {
		$( '#main-logo1' ).fadeToggle( 1000 );
		
		$( '#main-logo-btn' ).click( function() {
			 if ($('#main-logo2').css('display') == 'block') {
				$('#main-logo2').css('display', 'none');
				$( '#main-logo1' ).fadeIn( 1000 );
			 } else {
				$( '#main-logo2' ).fadeIn( 1000 );
				$('#main-logo2').css('display', 'block');
				$('#main-logo1').css('display', 'none');
			 }
		});
	});
</script>

<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-brand-wrapper d-flex align-items-center">
        <button id="main-logo-btn" class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
  	       <span class="icon-menu"></span>
        </button>
        <a id="main-logo1" class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/home" style="display:none;">
        	<img src="${pageContext.request.contextPath}/resources/images/oti-logo.png" alt="logo" style="width:90px; height:30px;"/>
        	<img src="${pageContext.request.contextPath}/resources/images/exa.png" alt="logo" style="width:70px; height:35px;"/>
       	</a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end pl-0">
        <a id="main-logo2" class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/home" style="display:none;">
        	<img src="${pageContext.request.contextPath}/resources/images/oti-logo.png" alt="logo" style="width:90px; height:30px;"/>
        	<img src="${pageContext.request.contextPath}/resources/images/exa.png" alt="logo" style="width:70px; height:35px;"/>
       	</a>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
          	<!-- 사원이름/부서 -->
          	<div class="mr-3" style="font-family: 'LeferiBaseType-RegularA'; font-weight: bold;">
          		<div>
	          		<span class="font-weight-bold text-primary h4 mb-0">${employee.empName}</span>
	                <span>${employee.posName}</span>
          		</div>
                <div class="text-muted h6 mb-0 text-center">${employee.depName}</div>
          	</div>
          	<!-- 마이페이지/로그아웃 -->
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src= "<c:url value='/login/filedownload'/>" alt="profile"/>
              <i class="icon-ellipsis ml-2" style="transform: rotate( 90deg );"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="<c:url value='/employee/mypage'/>" >
                <i class="mdi mdi-account-outline text-primary"></i>
                	마이페이지
              </a>
              <a class="dropdown-item" href="<c:url value='/login/logout'/>">
                <i class="ti-power-off text-primary"></i>
                	로그아웃
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>