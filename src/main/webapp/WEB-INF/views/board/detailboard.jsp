<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function popup(){
          var url = "deleteboard";
          var name = "delete board";
          var option = "width = 500, height =250, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
          window.open(url, name, option);
      }
</script>

<div class="card-body">
	<!-- main title and submit button -->
	<div class="d-flex justify-content-between align-items-center mb-4">
		<div class="card-title mb-0">2023년 새해복 많이 받으세요!</div>
	</div>
	<!-- end main title and submit button -->
	<!-- mail data -->
	<div class="forms-sample">
		<div class="row">
			<div class="col-md-12">
				<div class="form-group row align-items-center">
					<div class="col-sm-2 text-primary">
						<div class="d-flex align-items-center m-1">
							<i class="h3 my-auto mdi mdi-calendar "></i> 
							<span class="font-weight-bold">날짜</span>
						</div>
					</div>
					<div class="col-sm-9" style="border-bottom:1px solid #ced4da;">
						<div class="from-control" style="font-weight:bold; border:none;">2023년 2월 24일</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group row align-items-center ">
					<div class="col-sm-3 text-primary">
						<div class="d-flex align-items-center m-1">
							<i class="h3 my-auto mdi mdi-dns"></i> 
							<span class="ml-2 font-weight-bold">카테고리</span>
						</div>
					</div>
					<div class="col-sm-3" style="border-bottom:1px solid #ced4da;">
						<div class="from-control" style="font-weight:bold; border:none;">경조사</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group row">
					<textarea class="form-control" id="write" readonly></textarea>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group row">
					<div class="col-sm-3 text-primary">
						<div class="row d-flex align-items-center m-1">
							<i class="h3 my-auto mdi mdi-cloud-download"></i> 
							<span class="ml-2 font-weight-bold">파일 다운로드</span>
						</div>
					</div>
					<div class="col-sm-8 p-0"> 
						<div class="h3 form-control" style="font-weight:bold; height:120px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
