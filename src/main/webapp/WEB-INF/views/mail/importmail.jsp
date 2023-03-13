<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		<script>
        function popup(){
            var url = "importpopup";
            var name = "import popup";
            var option = "width = 500, height = 250, top = 100, left = 200, location = no, resizable=no, scrollbars=no  "
            window.open(url, name, option);
        }
        function pager(No){
			if(No == -1){
				No = $('#pageBtn').val();
			}
			var startRowNo = ${pager.startRowNo};
			var endRowNo =  ${pager.endRowNo};
			if(No <= startRowNo ){
				No = 1;
			}else if (No > endRowNo){
				No = endRowNo;
			}
			$('#pageBtn').val(No);
			var star = $('#star').val();
			if(star == ''){
				star = 0;
			}
			console.log(No);
			console.log(star);
			jQuery.ajax({
				type : 'post',
				url : '../mail/importsearch',
				dataType : 'html',
				data : {page : No, mailId : star},
				success : function(data){
					$('#import_container').html(data);
				 }
			});
		}
		function star(id){
			$('#star').val(id);
			onclick=pager(-1);
		}
		</script>
	</head>

<body>
	<div class="container-scroller">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/common/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- Sidebar -->
			<%@ include file="/WEB-INF/views/common/_sidebar.jsp"%>

			<!-- 메인 body -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- import and send mail -->
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card" id="import_container">
							<%@ include file="/WEB-INF/views/mail/importmailinfo.jsp"%>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
				<%@ include file="/WEB-INF/views/common/_footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>

</html>
