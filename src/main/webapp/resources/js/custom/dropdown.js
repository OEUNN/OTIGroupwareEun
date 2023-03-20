let today = new Date();
let year = today.getFullYear();
let month = today.getMonth() + 1;
let date = today.getDate();
let now = year + '/' + month + '/' + date;
let alertResult;
let cachedElement;

$(() => {
	let inputList = $('.form-check-input');
	addAjaxEvent(inputList);
});

function addAjaxEvent(list) {
	list.on('click', (event) => {
		console.log($(event.target));
		tinymce.activeEditor.dom.setAttrib(tinymce.id, 'contenteditable', true);
		documentType = $(event.target).attr("id");

		//에디터가 초기상태가 아님
		if (tinymce.get("document").getContent() !== "" && tinymce.get("document").getContent() !== "<p>양식을 선택해주세요</p>") {
			checkAlertResult(documentType, $(event.target));
		}
		//에디터가 초기상태임
		else{
			getFormAjax(documentType, $(event.target));
		}
	});
}

const checkAlertResult = (documentType, element) => {
	return Swal.fire({
		title: "주의!",
		html: "<p>현재 작성중인 내용을 잃게 됩니다.</p><p>새로운 양식을 불러오시겠습니까?</p>",
		width: 500,
		icon: 'warning',
		showCancelButton: true
	}).then((result) => {
		if (result.isConfirmed) {
			getFormAjax(documentType, element);
		}
		else {
			
		}
	});
}

const getFormAjax = (documentType, element) => {
	$.ajax({
		url: getContextPath() + '/resources/html/' + documentType + 'form.html',
		success: function(data) {
			tinymce.get("document").setContent(data);
			initForm.NoArgs();
		},
		complete : function() {
			tinymce.activeEditor.dom.setAttrib(tinymce.id, 'contenteditable', false);
		}
	})
	.done(() => {
		changeLabelTextColor(element);
		changeStatusTextEvent(element)
	});
}

function changeLabelTextColor(element) {
	if (cachedElement != null) {
		cachedElement.css("color", "black");
		cachedElement.css("font-weight", "400");
	}
	//input 태그의 바로 부모 element인 label을 캐싱
	
	var label = $(element).parent();
	label.css("color", "#248AFD");
	label.css("font-weight", "700");
	cachedElement = label;
}

function changeStatusTextEvent(element) {
	$("#status").text($(element).parent().text());
}
