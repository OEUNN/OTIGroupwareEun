let today = new Date();
let year = today.getFullYear();
let month = today.getMonth() + 1;
let date = today.getDate();
let now = year + '/' + month + '/' + date;

function getContextPath() {
   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

function initForm() {
	$("iframe").contents().find("body").find("#formDrafterDepName").text($("#drafterDepName").val());
	$("iframe").contents().find("body").find("#formDrafterPosName").text($("#drafterPosName").val());
	$("iframe").contents().find("body").find("#formDrafterName").text($("#drafterName").val());
	$("iframe").contents().find("body").find("#formReportDate").text(now);
	
	$($("iframe").contents().find(".positionText")[0]).text($("#drafterPosName").val());
	$($("iframe").contents().find(".stateText")[0]).text("승인");
	$($("iframe").contents().find(".nameText")[0]).text($("#drafterName").val());
	$($("iframe").contents().find(".dateText")[0]).text(now);
}

function addChangeLabelTextColorEvent(list, cachedElement, isEditorContentEmpty) {
	if (list != null) {
		
		if (list[0].className === 'form-check-label') {
			list.on('click', (e, isEditorContentEmpty) => {
				if (cachedElement != null) {
					if ($(e.target)[0].className === 'form-check-label') {
						cachedElement.css("color", "black");
						cachedElement.css("font-weight", "400");
					}
				}
				
				//label 클릭 이벤트 후에 input 태그에서 클릭 이벤트가 발생, 최종적으로 input 엘리먼트를 캐싱
				//위의 사태를 방지하고자 className으로 label인지 input인지 판별
				if ($(e.target)[0].className === 'form-check-label') {
					$(e.target).css("color", "#248AFD");
					$(e.target).css("font-weight", "700");
					cachedElement = $(e.target);
				}
			});
		}
		
		else if (list[0].className === 'form-check-input') {
			list.on('click', (e, isEditorContentEmpty) => {
				if (cachedElement != null) {
					cachedElement.css("color", "black");
					cachedElement.css("font-weight", "400");
				}
				
				//input 태그의 바로 부모 element인 label을 캐싱
				var label = $(e.target).parent();
				label.css("color", "#248AFD");
				label.css("font-weight", "700");
				cachedElement = label;
			});
		}
		
		else {
			alert("지원하지 않는 유형입니다.");
			return;
		}
	}
	
	else {
		alert("list is NULL");
	}
}

function addChangeStatusTextEvent(list, isEditorContentEmpty) {
	if (list != null) {
		
		if (list[0].className === 'form-check-label') {
			list.on('click', (e, isEditorContentEmpty) => {
				//label 클릭 이벤트 후에 input 태그에서 클릭 이벤트가 발생, input의 text(빈 문자열)을 가져옴
				//위의 사태를 방지하고자 className으로 label인지 input인지 판별
				if ($(e.target)[0].className === 'form-check-label') {
					$("#status").text($(e.target).text());
				}
				
			});
		}
		
		else if (list[0].className === 'form-check-input') {
			list.on('click', (e, isEditorContentEmpty) => {
				$("#status").text($(e.target).parent().text());
			});
		}
		
		else {
			alert("지원하지 않는 유형입니다.");
		}
	}
	
	else {
		alert("list is NULL");
	}
}

function addAjaxEvent(list, isEditorContentEmpty) {
	list.on('click', (e, isEditorContentEmpty) => {
		$("iframe").contents().find("#tinymce").attr('contenteditable', true);
		
		documentType = $(e.target).val();
		
		if (tinymce.get("document").getContent() === '') {
			$.ajax({
				url: getContextPath() + '/resources/html/' + documentType + 'form.html',
				success: function(data) {
					tinymce.get("document").setContent(data);
					initForm();
					$("iframe").contents().find("#tinymce").attr('contenteditable', false);
					isEditorContentEmpty = false;
				}
			});
		}
		else {
			alert('작성한 내용이 있습니다.');
			isEditorContentEmpty = true;
		}
	});
}

$(document).ready(function(){
	let inputList = $('.form-check-input');
	let labelList = $('.form-check-label');
	
	var cachedElement;
	var isEditorContentEmpty = true;
	
	addAjaxEvent(inputList, isEditorContentEmpty);
	
	addChangeLabelTextColorEvent(labelList, cachedElement, isEditorContentEmpty);
	addChangeStatusTextEvent(labelList, isEditorContentEmpty);

	addChangeLabelTextColorEvent(inputList, cachedElement, isEditorContentEmpty);
	addChangeStatusTextEvent(inputList, isEditorContentEmpty);
});