<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addresspopup.css"/>
		<script>
        function address(){
        	window.opener.top.location.href="<c:url value='/mail'/>";
            window.close();
        }
		</script>
	</head>
	<body>
		<form class="container-fluid" action="address()">
			<div class="row mt-5" style="border-bottom:2px solid #d9d9d9">
				<p>주소록</p>
			</div>
			<!-- 드롭다운을 이용해서 부에 따라 사람 불러오기 -->
			<div class="row mt-3" style="border:1px solid #d9d9d9; height:40%; ">
				
			</div>
			<div class="row mt-3" >
				<div class="col"></div>
				<button class="col-1 img">
					<img class="img" src="${pageContext.request.contextPath}/resources/images/pngwing.png"style=" width:30px; height:30px;"></img>
				</button>
				<button class="col-1 img">
					<img class="img" src="${pageContext.request.contextPath}/resources/images/화살표.png"style=" width:30px; height:30px;"></img>
				</button>
			</div>
			<div class="row mt-3" style="border:1px solid #d9d9d9; height:20%;">
			
			</div>
			<div class="row mt-5">
				<div class="col"></div>
				<input type="submit" class="btn col mx-3 submit-btn" value="확인" >
				<button class="cancle-btn col mx-3" onclick="window.close()">취소</button>
				<div class="col"></div>
			</div>
			
		</form>
	</body>
</html>