<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
<script src="${pageContext.request.contextPath}/resources/css/app.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#approvalStatus {
    font-size: 40px;
    font-weight: 700;
    line-height: 150%;
}

.notifySpecificStatus {
    font-size: 24px;
    font-weight: 700;
    line-height: 150%;
    text-align: center;
    margin-top: 10%;
}

.specificStatusData {
    font-size: 48px;
    font-weight: 700;
    line-height: 150%;
    text-align: center;
    margin-bottom: 10%;
}

.textForList * {
    font-size: 30px;
    font-weight: 700;
    line-height: 150%;
}

.customLine {
	background-color: #2C3639;
    height: 4px;
    border: 2px solid #2C3639;
    transform: rotate(0.42deg);
}

.listLine {
	background-color: #2C3639;
    height: 2px;
    border: 1px solid #2C3639;
    transform: rotate(0.42deg);
}

.verticalLine {
	background-color: #D9D9D9;
    width: 4px;
    border: 2px solid #D9D9D9;
    transform: rotate(0.42deg);
    margin-top: 20px;
    margin-bottom: 20px;
}

</style>


</head>
<body>
    
<div class="d-flex">
    <div class="d-flex flex-column" style="width: 100%;">
        <div class="container">
            <div class="row mb-1">
                <div id="approvalStatus" class="col te">이번 달 결재 현황</div>
            </div>
            <div class="customLine"></div>
            <div class="row">
                <div class="col">
                    <div class="notifySpecificStatus">
                        결재 대기 중
                    </div>
                    <div class="specificStatusData">
                        0
                    </div>
                </div>
                <div class="verticalLine"></div>
                <div class="col">
                    <div class="notifySpecificStatus">
                        기안한 문서
                    </div>
                    <div class="specificStatusData">
                        0
                    </div>
                </div>
                <div class="verticalLine"></div>
                <div class="col">
                    <div class="notifySpecificStatus">
                        반려된 문서
                    </div>
                    <div class="specificStatusData" style="color: #DD0000;">
                        0
                    </div>
                </div>
            </div>
        </div>
        <div class="container textForList">
            <div class="row mb-2">
                <div class="col">최근에 처리한 결재 문서</div>
            </div>
            <div class="row mb-1">
                <div class="col">문서 제목</div>
                <div class="col">결재 상태</div>
                <img class="align-items-right mr-4" src="${pageContext.request.contextPath}/resources/images/plus.png"/>
            </div>
            <div class="customLine"></div>
            <div class="row">
                <div class="col">1</div>
            </div>
            <div class="listLine"></div>
            <div class="row">
                <div class="col">2</div>
            </div>
            <div class="listLine"></div>
            <div class="row">
                <div class="col">3</div>
            </div>
            <div class="listLine"></div>
        </div>
    </div>
    <div class="d-flex flex-column p-3" style="width: 100%; background-color: #D9D9D9; border-radius: 20px;">
        <div class="container textForList" style="background-color: white; border-radius: 20px; height: 100%;">
            <div class="row mb-2">
                <div class="col">처리해야 할 결재 문서</div>	
                <img class="align-items-right mr-4" src="${pageContext.request.contextPath}/resources/images/plus.png"/>
            </div>
            <div class="row mb-1">
                <div class="col">문서 번호</div>
                <div class="col">문서 제목</div>
            </div>
            <div class="customLine"></div>
            <div class="row">
                <div class="col">1</div>
            </div>
            <div class="listLine"></div>
            <div class="row">
                <div class="col">2</div>
            </div>
            <div class="listLine"></div>
            <div class="row">
                <div class="col">3</div>
            </div>
            <div class="listLine"></div>
        </div>
    </div>
</div>

</body>
</html>