<%@ page contentType="text/html; charset=UTF-8"%>

<div id="main_menu_logo">
   <a class="text-white" href="${pageContext.request.contextPath}/board/list">
      <div>
         <img src="${pageContext.request.contextPath}/resources/images/oti.png" width="75">
      </div>
      <div>
         <img src="${pageContext.request.contextPath}/resources/images/EXI.png" width="60">
      </div>
   </a>
   <hr width="60" color="white" class="mt-3 mb-1"/>
   <hr width="60" color="white" class="my-1"/>
</div>

<div id="main_menu_list">
	<ul class="nav flex-column">
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/home.png" 
						 width="30" height="30" class="d-inline-block align-top">
				</div>
				<div class="font-weight-bold">HOME</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/email.png" 
						 width="30" height="30" class="d-inline-block align-top">
				</div>
				<div id="sidebar_font" class="font-weight-bold">메일</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/list.png" 
						 width="30" height="30" class="d-inline-block align-top">
				</div>
				<div id="sidebar_font" class="font-weight-bold">게시판</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/file.png" 
						 width="30" height="30" class="d-inline-block align-top">
				</div>
				<div id="sidebar_font" class="font-weight-bold">전자결재</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/hr.png" 
						 width="30" height="30" class="d-inline-block align-top">
				</div>
				<div id="sidebar_font" class="font-weight-bold">HR</div>
			</a>
		</li>	
		<li class="nav-item">
			<a class="text-white" href="${pageContext.request.contextPath}/board/list">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/people.png" 
						 width="30" height="30" class="d-inline-block align-top">
				</div>
				<div id="sidebar_font" class="font-weight-bold">조직도</div>
			</a>
		</li>	
	</ul>
</div>