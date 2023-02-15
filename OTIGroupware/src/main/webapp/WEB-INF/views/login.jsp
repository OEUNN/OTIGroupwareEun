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
            var url = "popup.html";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
		</script>
	</head>
	<body>
		<div class="container-fluid" style="background-color:#2C3639; ">
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
							<div class="col container-fluid loginForm p-3">
								<div class="row mt-3 logoForm">
									<div class="col-3">
										<img src="${pageContext.request.contextPath}/resources/images/otiColor.png"></img>
									</div>
									<div class="col-3">
										<img src="${pageContext.request.contextPath}/resources/images/exicolor.png"></img>
									</div>
									<div class="col-12 com-sm-12 col-lg-6">
										<p class="logo">GROUPWARE</p>
									</div>
								</div>
								
								<div class="row my-4 loginLine"></div>
								
								<!-- 로그인 form -->
								<div class="row mt-4"  style="height:80%;">
									<div class="container-fluid">
										<div class="row mt-3 mb-1 px-3">
											<p class="subLogo">LOGIN</p>
										</div>
										<div class="row loginText" style="height:60%;">
											<form action="<c:url value='/home'/>" method="post" class="signin-form container-fluid">
												<div class="form-group row" style="height:70%;">
													<div class="container-fluid idnpw" style="height:100%;">
														<div class="idform row" style="height:35%;">
															<img class="col-2" src="${pageContext.request.contextPath}/resources/images/person.png" ></img>
															<input class="col" type="text" name="stdId" required>
														</div>
														<div class="pwform row" style="height:35%;">
															<img class="col-2" src="${pageContext.request.contextPath}/resources/images/lockoutline.png"></img>
															<input class="col" type="password" name="password" required>
														</div>
													</div>	
												</div>
												<div class="form-group row" style="height:20%;" >
													<button type="submit" class="btn submit loginLogo" style="background-color:f2cd5c; border-radius:30px;">로그인</button>
												</div>
											</form>
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
