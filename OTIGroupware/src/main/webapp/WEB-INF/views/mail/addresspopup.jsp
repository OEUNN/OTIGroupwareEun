<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<script>
        function address(){
        	window.opener.top.location.href="<c:url value='/mail'/>";
            window.close();
        }
		</script>
	</head>

	<body>
		<form class="container-fluid  forms-sample p-3" action="address()">
			<div class="row mx-1 my-3">
				<h3>주소록</h3>
			</div>
			<!-- 드롭다운을 이용해서 부에 따라 사람 불러오기 -->
			<div class="row m-1 mt-3 form-group" style="height:300px;border:1px solid #ced4da;">
				
			</div>
			<div class="row m-1 mt-3 mb-5 form-group" style="height:150px;border:1px solid #ced4da;">
			
			</div>
			<div class="row mb-3" >
				<div class="col"></div>
				<button class="col btn btn-primary btn-sm mt-1 mx-3" onclick="trash()">확인</button>
				<button class="col btn btn-outline-info btn-sm mt-1 mx-3" onclick="window.close()">취소</button>
				<div class="col"></div>
			</div>
			
		</form>
	</body>

</html>
