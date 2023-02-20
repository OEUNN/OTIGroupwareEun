<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<script>
        function trash(){
        	window.opener.top.location.href="<c:url value='/trashMail'/>";
            window.close();
        }
		</script>
	</head>

	<body>
		<div class="container-fluid ">
			<div class="row mt-5 p-2">
				<img class="col-2" src="${pageContext.request.contextPath}/resources/images/warning.png" style="width:50px; height:50px;"></img>
				<div class="col">
					<h4>중요메일입니다.</h4>
					<h4>휴지통 보내기 하시겠습니까?</h4>
				</div>
			</div>
			<div class="row mb-3" >
				<div class="col"></div>
				<button class="col btn btn-primary btn-sm mt-1 mx-3" onclick="trash()">확인</button>
				<button class="col btn btn-outline-info btn-sm mt-1 mx-3" onclick="window.close()">취소</button>
				<div class="col"></div>
			</div>
			
		</div>
	</body>

</html>
