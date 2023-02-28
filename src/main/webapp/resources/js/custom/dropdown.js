$(document).ready(function(){
	let inputList = $('.form-check-input');
	let labelList = $('.form-check-label');
	
	var cachedElement;
	var isEditorContentEmpty;
	
	addAjaxEvent(inputList, isEditorContentEmpty);
	
	addChangeLabelTextColorEvent(inputList, cachedElement, isEditorContentEmpty);
	addChangeStatusTextEvent(inputList, isEditorContentEmpty);
	
	addChangeLabelTextColorEvent(labelList, cachedElement, isEditorContentEmpty);
	addChangeStatusTextEvent(labelList, isEditorContentEmpty);
	
	$(inputList[0]).trigger('click');
});

function addChangeLabelTextColorEvent(list, cachedElement, isEditorContentEmpty) {
	if (list != null) {
		
		if (list[0].className === 'form-check-label') {
			list.on('click', (e) => {
				if (isEditorContentEmpty) {
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
				}
			});
		}
		
		else if (list[0].className === 'form-check-input') {
			list.on('click', (e) => {
				if (isEditorContentEmpty) {
					if (cachedElement != null) {
						cachedElement.css("color", "black");
						cachedElement.css("font-weight", "400");
					}
					
					//input 태그의 바로 부모 element인 label을 캐싱
					var label = $(e.target).parent();
					label.css("color", "#248AFD");
					label.css("font-weight", "700");
					cachedElement = label;
				}
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

function addChangeStatusTextEvent(list, isEditorContentEmpty) {
	if (list != null) {
		
		if (list[0].className === 'form-check-label') {
			list.on('click', (e) => {
				if (isEditorContentEmpty) {
					//label 클릭 이벤트 후에 input 태그에서 클릭 이벤트가 발생, input의 text(빈 문자열)을 가져옴
					//위의 사태를 방지하고자 className으로 label인지 input인지 판별
					if ($(e.target)[0].className === 'form-check-label') {
						$("#status").text($(e.target).text());
					}
				}
			});
		}
		
		else if (list[0].className === 'form-check-input') {
			list.on('click', (e) => {
				if (isEditorContentEmpty) {
					$("#status").text($(e.target).parent().text());
				}
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
	list.on('click', () => {
		if (tinymce.get("document").getContent() === '') {
			$.ajax({
				url : '../resources/html/approvalform.html',
				success: function(data) {
					tinymce.get("document").setContent(data);
				}
			});
			return isEditorContentEmpty = true;
		}
		else {
			alert('작성한 내용이 있습니다.');
			return isEditorContentEmpty = false;
		}
	});
}