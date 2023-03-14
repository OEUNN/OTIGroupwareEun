<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<!-- CSS 관련 파일 -->
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mail.css"/>
		<script>
			function pager(No){
				//선택삭제
				var next = true;
				var result;
				var mailArray = [];
				var importance =[];
				if(No == -2){
					$('input[name="optradio"]:checked').each(function(i){//체크된 리스트 저장
						mailArray.push($(this).val());
	                });
					result = 'delete';
					No = $('#pageBtn').val();
				}else if(No == -3){
					No = $('#pageBtn').val();
				}else if(No == -5){
					$('input[name="optradio"]:checked').each(function(i){//체크된 리스트 저장
						mailArray.push($(this).val());
						importance.push($(this).parent().parent().find('#import').val());
	                });
					result = 'delete';
					No = $('#pageBtn').val();
					for(var i=0 ; i< importance.length ; i++){
						if(importance[i] == 'Y'){
							next = false;
							break;
						}
					}
				}
				if(next){
					//paging number 지정
					var startRowNo = ${pager.startRowNo};
					var endRowNo =  ${pager.endRowNo};
					if(No < startRowNo){
						No = 1;
					}else if (No > endRowNo){
						No = endRowNo;
					}
					var search = $('#searchBtn').val(); //필터링 단어
					var star = $('#star').val(); //중요도 표시할 메일 id
					if(mailArray == ''){
						mailArray[0]='0';
					}
					if(star == ''){
						star = '0';
					}
					if(search == ''){
						search = 'all';
					}
					if(result == null){
						result = 'stay';
					}
					 //현재 페이지를 계속 저장하기 위한 장치
					var data = {search : search, mailId : star, mailList : mailArray, page : No, result : result};
					console.log(data);
					jQuery.ajax({
						type : 'post',
						url : '../mail/sendsearch',
						dataType : 'html',
						data : JSON.stringify(data),
						 contentType:"application/json;charset=UTF-8",
						success : function(data){
							$('#msendail_container').html(data);
							$('#pageBtn').val(No);
						 }
					});
				}else{
					var url = "importpopup";
		            var name = "import popup";
		            var option = "width = 500, height = 250, top = 100, left = 200, location = no, resizable=no, scrollbars=no  "
		            window.open(url, name, option);
				}
			}
			function search(str){
				var search = null;
				if(str == 1){
					search = 'import';
				}else if(str == 2){
					search = 'notimport';
				}
				$('#searchBtn').val(search);
				onclick=pager(1);
			}
			function star(id){
				$('#star').val(id);
				onclick=pager(-3);
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
						<!-- 받은 메일 col -->
						<div class="col-lg-12 grid-margin stretch-card" id="msendail_container">
							<%@ include file="/WEB-INF/views/mail/sendmailinfo.jsp"%>
						</div><!-- end 받은 메일 -->
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.jsp -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>

</html>
