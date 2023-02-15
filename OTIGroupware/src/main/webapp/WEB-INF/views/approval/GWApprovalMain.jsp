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

</head>
<body>
    
<div class="d-flex">
    <div class="d-flex flex-column">
        <div class="container">
            <div class="row">
                <div class="col">이번 달 결재 현황</div>
            </div>
            <hr/>
            <div class="row">
                <div class="col">
                    <div>
                        결재 대기 중
                    </div>
                    <div>
                        0
                    </div>
                </div>
                <div class="col">
                    <div>
                        기안한 문서
                    </div>
                    <div>
                        0
                    </div>
                </div>
                <div class="col">
                    <div>
                        반려된 문서
                    </div>
                    <div>
                        0
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">최근에 처리한 결재 문서</div>
            </div>
            <div class="row">
                <div class="col">문서 제목</div>
                <div class="col">결재 상태</div>
                <div class="col">+</div>
            </div>
            <hr/>
            <div class="row">
                <div class="col">1</div>
            </div>
            <div class="row">
                <div class="col">2</div>
            </div>
            <div class="row">
                <div class="col">3</div>
            </div>
        </div>
    </div>
    <div class="d-flex flex-column">
        <div class="container">
            <div class="row">
                <div class="col">처리해야 할 결재 문서</div>
                <div class="col">+</div>
            </div>
            <div class="row">
                <div class="col">문서 번호</div>
                <div class="col">문서 제목</div>
            </div>
            <hr/>
            <div class="row">
                <div class="col">1</div>
            </div>
            <div class="row">
                <div class="col">2</div>
            </div>
            <div class="row">
                <div class="col">3</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>