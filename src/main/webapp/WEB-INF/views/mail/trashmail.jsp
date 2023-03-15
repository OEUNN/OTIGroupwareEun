<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일  -->
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
        	//선택삭제
			var result;
			if(No == -2){
				result = 'delete';
				No = $('#pageBtn').val();
			}else if(No == -4){
				result = 'restore';
				No = $('#pageBtn').val();
			}
			var startRowNo = ${pager.startRowNo};
			var endRowNo =  ${pager.endRowNo};
			if(No < startRowNo ){
				No = 1;
			}else if (No > endRowNo){
				No = endRowNo;
			}
			//검색어
			var search = $('#searchBtn').val();
			//선택된 메일아이디와 메일의 테이블이름
			var mailArray = [];
			$('input[name="optradio"]:checked').each(function(i){//체크된 리스트 저장
				mailArray.push($(this).val());
	        });
			
			if(mailArray == ''){
				mailArray[0]='0';
			}
			if(result == null){
				result = 'stay';
			}
			var data = {mailList : mailArray, page : No, result : result};
			console.log(data);
			jQuery.ajax({
				type : 'post',
				url : '../mail/trashsearch',
				dataType : 'html',
				data : JSON.stringify(data),
				 contentType:"application/json;charset=UTF-8",
				success : function(data){
					$('#trash_container').html(data);
					$('#pageBtn').val(No);
				 }
			});
		}
        function search(str){
			var search = null;
			if(str == 1){
				search = 'read';
			}else if(str == 2){
				search = 'notread';
			}
			$('#searchBtn').val(search);
			onclick=pager(1);
		}
		function checkSelectAll()  {
			  // 전체 체크박스
			  const checkboxes 
			    = document.querySelectorAll('input[name="optradio"]');
			  // 선택된 체크박스
			  const checked 
			    = document.querySelectorAll('input[name="optradio"]:checked');
			  // select all 체크박스
			  const selectAll 
			    = document.querySelector('input[name="selectall"]');
			  
			  if(checkboxes.length === checked.length)  {
			    selectAll.checked = true;
			  }else {
			    selectAll.checked = false;
			  }

			}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('optradio');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
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
