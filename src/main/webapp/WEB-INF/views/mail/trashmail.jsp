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
            var url = "trashpopup";
            var name = "trash popup";
            var option = "width = 500, height = 300, top = 100, left = 200, location = no, resizable=no, scrollbars=no  "
            window.open(url, name, option);
        }
        function pager(No){
			if(No == 0){
				No = $('#pageBtn').val();
			}
			var startRowNo = ${pager.startRowNo};
			var endRowNo =  ${pager.endRowNo};
			if(No < startRowNo ){
				No = 1;
			}else if (No > endRowNo){
				No = endRowNo;
			}
			$('#pageBtn').val(No);
			var search = $('#searchBtn').val();
			var star = $('#star').val();
			if(star == ''){
				star = 0;
			}
			if(search == ''){
				search = 'all';
			}
			console.log(search);
			console.log(No);
			console.log(star);
			jQuery.ajax({
				type : 'post',
				url : '../mail/receivedsearch',
				dataType : 'html',
				data : {page : No, search : search, mailId : star},
				success : function(data){
					$('#trash_container').html(data);
				 }
			});
		}
		function search(str){
			var search = null;
			if(str == 1){
				search = 'read';
			}else if(str == 2){
				search = 'notread';
			}else if(str == 3){
				search = 'import';
			}else if(str == 4){
				search = 'notimport';
			}
			$('#searchBtn').val(search);
			onclick=pager(1);
		}
		function star(id){
			$('#star').val(id);
			onclick=pager(0);
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
					<div class="row">
						<!-- trash mail -->
						<div class="col-lg-12 grid-margin stretch-card" id="trash_container">
							<%@ include file="/WEB-INF/views/mail/trashmailinfo.jsp"%>
						</div><!-- end trash mail -->
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
