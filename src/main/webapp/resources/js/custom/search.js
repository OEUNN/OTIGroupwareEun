$(function(){
	$('.datepicker').datepicker({
	});	
});

function searchState(value) {
	if ($('.docState').length === 0) {
		$("#searchBar").append('<div id="' + value + '" class="badge badge-warning font-weight-bold docState"><input type="hidden" name="docState" value="' + value + '"></input>결재상태: ' + value + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
	else {
		$("#searchBar").find('.docState');
		$("#searchBar").find('.docState').replaceWith('<div id="' + value + '" class="badge badge-warning font-weight-bold docState"><input type="hidden" name="docState" value="' + value + '"></input>결재상태: ' + value + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
}

function searchDocId(value) {
	let documentId = $("#searchDocId").val();
	if ($('#' + value).length === 0) {
		$("#searchBar").append('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docId" value=""></input>문서번호<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
	else {
		$("#searchBar").find('#' + value).replaceWith('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docId" value=""></input>문서번호<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
}

function searchDocTitle(value) {
	let documentTitle = $("#searchDocTitle").val();
	if ($('#' + value).length === 0) {
		$("#searchBar").append('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docTitle" value=""></input>제목<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
	else {
		$("#searchBar").find('#' + value).replaceWith('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docTitle" value=""></input>제목<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
}

function searchEmpName(value) {
	let empName = $("#searchEmpName").val();
	if ($('#' + value).length === 0) {
		$("#searchBar").append('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="empName" value=""></input>기안자<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
	else {
		$("#searchBar").find('#' + value).replaceWith('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="empName" value=""></input>기안자<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
	}
}

function searchReportDate(value) {
	let startDate = $('#startReportDate').val();
	let endDate = $('#endReportDate').val();
	
	if (startDate !== null && endDate !== null) {
		if ($('#' + value).length === 0) {
			$("#searchBar").append('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docReportStartDate" value="' + startDate + '"></input><input type="hidden" name="docReportEndDate" value="' + endDate + '"></input>상신날짜: ' + startDate + ' ~ ' + endDate + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
		}
		else {
			$("#searchBar").find('#' + value).replaceWith('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docReportStartDate" value="' + startDate + '"></input><input type="hidden" name="docReportEndDate" value="' + endDate + '"></input>상신날짜: ' + startDate + ' ~ ' + endDate + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
		}
	}
}

function searchCompleteDate(value) {
	let startDate = $('#startCompleteDate').val();
	let endDate = $('#endCompleteDate').val();
	
	if (startDate !== null && endDate !== null) {
		if ($('#' + value).length === 0) {
			$("#searchBar").append('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docCompleteStartDate" value="' + startDate + '"></input><input type="hidden" name="docCompleteEndDate" value="' + endDate + '"></input>종료날짜: ' + startDate + ' ~ ' + endDate + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
		}
		else {
			$("#searchBar").find('#' + value).replaceWith('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docCompleteStartDate" value="' + startDate + '"></input><input type="hidden" name="docCompleteEndDate" value="' + endDate + '"></input>종료날짜: ' + startDate + ' ~ ' + endDate + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
		}
	}
}
function searchWriteDate(value) {
	let startDate = $('#startWriteDate').val();
	let endDate = $('#endWriteDate').val();
	
	if (startDate !== null && endDate !== null) {
		if ($('#' + value).length === 0) {
			$("#searchBar").append('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docWriteStartDate" value="' + startDate + '"></input><input type="hidden" name="docWriteEndDate" value="' + endDate + '"></input>작성날짜: ' + startDate + ' ~ ' + endDate + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
		}
		else {
			$("#searchBar").find('#' + value).replaceWith('<div id="' + value + '" class="badge badge-warning font-weight-bold"><input type="hidden" name="docWriteStartDate" value="' + startDate + '"></input><input type="hidden" name="docWriteEndDate" value="' + endDate + '"></input>작성날짜: ' + startDate + ' ~ ' + endDate + '<span class="mx-1"><i class="mdi mdi-close" onclick="removeItem('+value+')"></i></span></div>');
		}
	}
}

function removeItem(value) {
	$(value).remove();
}

function submitForm() {
	let value = $("#navbar-search-input").val();
	if (value !== null && value !== '') {
		value = value.trim();
		$('input[name="docTitle"]').val(value);
	}
}