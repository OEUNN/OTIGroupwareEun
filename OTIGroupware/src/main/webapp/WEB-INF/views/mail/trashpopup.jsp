<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mailpopup.css"/>
		<script>
        function trash(){
        	window.opener.top.location.href="<c:url value='/mail'/>";
            window.close();
        }
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row mt-5 p-2">
				<img class="col-2" src="${pageContext.request.contextPath}/resources/images/warning.png" style="width:50px; height:50px;"></img>
				<div class="col">
					<p>휴지통의 메일을 지우면 지워진 메일들은 복구할 수 없습니다.</p>
					<p>메일을 삭제하시겠습니까?</p>
				</div>
			</div>
			<div class="row mb-3" >
				<div class="col"></div>
				<button class="col mt-1 mx-3" onclick="trash()" style="background-color:#ffc107; color:white;">확인</button>
				<button class="col mt-1 mx-3" onclick="window.close()">취소</button>
				<div class="col"></div>
			</div>
			
		</div>
	</body>
</html>