<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
		<script src="${pageContext.request.contextPath}/resources/js/app.jsp"></script>
		<script>
        function popup(){
            var url = "loginReTry";
            var name = "login retry";
            var option = "width = 500, height = 100, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
            window.open(url, name, option);
        }
		</script>
	</head>
	<body>
		<div class="container-fluid" style="background-color:2C3639; ">
			<div class="row blackrow" style="height:5%;">
				<div class="col" ></div>
				<div class="col-2"style="background-color:white;"></div>
				<div class="col-1"></div>
			</div>
			<div class="row" style="height:90%;">
				<div class="col-1 blackrow"></div>
				<div class="col whiterow"style="background-color:white;">
					<div class="container-fluid">
						<div class="row" style="height:15%;"></div>
						<div class="row"style="height:70%;">
							<div class="col-3"></div>
							
							<!-- 로그인 메인 div -->
							<div class="col container-fluid errorloginForm p-3" style="background-color:#B3B3B3;">
								<div class="row mt-3 logoForm" >
									<div class="col-lg-2" style="padding-top:30px;padding-left:10px;">
										<img src="${pageContext.request.contextPath}/resources/images/otiColor.png" style="width:100px; height:100px"></img>
									</div>
									<div class="col-lg-2" style="padding-top:50px;padding-left:10px;">
										<img src="${pageContext.request.contextPath}/resources/images/exicolor.png" style="width:80px; height:70px"></img>
									</div>
									<div class="col com-sm-12 col-lg-8">
										<p class="logo">GROUPWARE</p>
									</div>
								</div>
								
								<div class="row my-4 loginLine"></div>
								
								<!-- 로그인 form -->
								<div class="row mt-4"  style="height:80%;">
									<div class="container-fluid">
										<div class="row loginText" style="height:60%;">
											<div  class="container-fluid">
												<div class="row" style="height:70%;">
													<div class="erroridnpw">
														로그인에 실패 하셨습니다.</br>
														로그인 초기화 요청 후 다시 시도 하십쇼.
													</div>
												</div>
												<div class="row" style="height:20%;" >
													<button class="loginLogo" style="background-color:#ffc107; border-radius:30px; border:none;" onclick="popup()">로그인시도</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-3"></div>
						</div>
						<div class="row" style="height:15%;"></div>
					</div>
				</div>
				<div class="col-1 blackrow"></div>
			</div>
			<div class="row blackrow"" style="height:5%;">
				<div class="col-1"></div>
				<div class="col-2"style="background-color:white;"></div>
				<div class="col"></div>
			</div>
		</div>
	</body>
</html>
