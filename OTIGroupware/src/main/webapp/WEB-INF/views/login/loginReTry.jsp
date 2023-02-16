<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginReTry.css"/>
		<script>
        function retry(){
        	window.opener.top.location.href="<c:url value='/'/>";
            window.close();
        }
		</script>
	</head>
	<body>
		<div class="container-fulid m-4" >
			<div class="row mt-5 mb-3" style="height:100px; ">
				<p>서면 요청하셨습니까?</p>
			</div>
			<div class="row mb-5 mt-3" >
				<div class="col"></div>
				<button class="col mr-2" onclick="retry()">확인</button>
				<button class="col" onclick="window.close()">취소</button>
				<div class="col"></div>
			</div>
			
		</div>
	</body>
</html>