$(() => {
	addRemoveEventListener();
});

function initDocument() {
	callDocument();
	callApprovalLine();
}

function isContentExist(docTempYn) {
	if ($("iframe").contents().find("body").find("#A4") === null) {
		swal({
			title: "내용이 없습니다.",
			icon: "warning",
			button: "닫기"
		});
	}
	else if ($("iframe").contents().find("body").find("#documentTitle").text() === null || $("iframe").contents().find("body").find("#documentTitle").text() === '') {
		swal({
			title: "제목은 필수입니다.",
			icon: "warning",
			button: "닫기"
		});
	}
	else {
		$('input[name="docTitle"]').val($("iframe").contents().find("body").find("#documentTitle").text());
		$('input[name="docTempYn"]').val(docTempYn);
				
		if (docTempYn === 'N' || (docTempYn === 'Y' && $("#documentId").length === 0)) {
			if (docTempYn === 'N' && $(".approvalLineItems").length < 1) {
				swal({
					title: "자신을 제외한 적어도 한명 이상의 결재자를 지정해주세요.",
					icon: "warning",
					button: "닫기"
				});
			}
			else {
				$('input[name="docState"]').val('진행');
				$("#approvalForm").attr('action', getContextPath() + '/approval/documentwrite');
				$("#approvalForm").submit();
			}
		}
		else if (docTempYn === 'Y' && $("#isDocumentExist").length !== 0){
			$('input[name="docState"]').val('임시');
			$("#approvalForm").attr('action', getContextPath() + '/approval/update');
			$("#approvalForm").submit();
		}
	}
}

//재기안 시 문서 내용을 가져와서 반영
function callDocument() {
	if ($("#isDocumentExist").length > 0) {
		if ($("#isDocumentExist").val() !== '' && $("#isDocumentExist").val() !== null) {
			$(".remove-flag").remove();
			let docId = $("#isDocumentExist").val();
			$.ajax({
				url: getContextPath() + '/approval/viewdetail/' + docId + '/documentdetail',
				success: function(data) {
					tinymce.get("document").setContent(data.docContent);
					tinymce.activeEditor.dom.setAttrib(tinymce.id, 'contenteditable', false);
				} 
			});
		}
	}
}

//재기안 시 결재선 요청
function callApprovalLine() {
	let result = false;
	if ($("#isDocumentExist").length > 0) {
		if ($("#isDocumentExist").val() !== '' && $("#isDocumentExist").val() !== null) {
			$(".remove-flag").remove();
			let docId = $("#isDocumentExist").val();
			$.ajax({
				url: getContextPath() + '/approval/viewdetail/' + docId + '/approvallinedetail',
				success: function(data) {
					initApprovalLine(data);
					initForm(data);
				},
				complete: function(data) {
					result = true;
					addMessageEventListener();
					addRemoveEventListener();
				}
			});
		}
	}
}

function initApprovalLine(receivedApprovalLines) {
	receivedApprovalLines.forEach((receivedData, index) => {
		appendApprovalLineToList(index, receivedData);
	});
}

function initForm(receivedApprovalLines) {
	receivedApprovalLines.forEach((receivedData, index) => {
		appendApprovalLineToForm(index, receivedData);
	});
}

initForm.NoArgs = () => {
	$(".remove-flag").remove();

	$("iframe").contents().find("body").find("#formDrafterDepName").text($("#drafterDepName").val());
	$("iframe").contents().find("body").find("#formDrafterPosName").text($("#drafterPosName").val());
	$("iframe").contents().find("body").find("#formDrafterName").text($("#drafterName").val());
	$("iframe").contents().find("body").find("#formReportDate").text(now);
	
	$($("iframe").contents().find(".positionText")[0]).text($("#drafterPosName").val());
	$($("iframe").contents().find(".stateText")[0]).text("승인");
	$($("iframe").contents().find(".nameText")[0]).text($("#drafterName").val());
	$($("iframe").contents().find(".dateText")[0]).text(now);
	
	let positionList = $("iframe").contents().find(".positionText");
	let stateList = $("iframe").contents().find(".stateText");
	let nameList = $("iframe").contents().find(".nameText");
	let dateList = $("iframe").contents().find(".dateText");
	
	positionList.each((index, item) => {
		if (index > 0) {
			$(item).text("공란");
		}
	});
	stateList.each((index, item) => {
		if (index > 0) {
			$(item).text("공란");
		}
	});
	nameList.each((index, item) => {
		if (index > 0) {
			$(item).text("공란");
		}
	});
	dateList.each((index, item) => {
		if (index > 0) {
			$(item).text("공란");
		}
	});
	
}

function appendApprovalLineToList(index, receivedData) {
	if (receivedData.aprvLineRole !== "기안") {
		let removeId = 'r' + receivedData.empId;

		$("#approvalLine").append(
			'<div class="' + removeId + ' d-flex align-items-stretch justify-content-center mb-0 remove-flag">' +
				'<h1 class="mdi mdi-menu-down mt-1 mb-0"></h1>' +
			'</div>' +
			'<div class="' + removeId + ' card card-dark-blue grid-margin shadow-2 mb-0 remove-flag approvalLineItems">' +
				'<div class="card-body">' +
					'<div class="row">' +
						'<div id=' + receivedData.empId + ' class="empId col-10 init-flag">' +
							'<p class="text-white font-weight-bold">' +
							receivedData.employee.empName +
							'</p>' +
							'<p>' +
							receivedData.department.depName + ' ' + receivedData.position.posName +
							'</p>' +
						'</div>' +
						'<div class="col-2">' +
							'<i id=' + removeId + ' class="' + index + ' mdi mdi-close"></i>' +
						'</div>' +
					'</div>' +
				'</div>' +
			'</div>'
		);
	}
}

function appendApprovalLineToForm(index, receivedData) {
	let removeId = 'r' + receivedData.empId;
	
	let positionList = $("iframe").contents().find(".positionText");
	let stateList = $("iframe").contents().find(".stateText");
	let nameList = $("iframe").contents().find(".nameText");
	let dateList = $("iframe").contents().find(".dateText");
	
	if (receivedData.aprvLineRole === '기안') {
		$("iframe").contents().find("body").find("#formDrafterDepName").text($("#drafterDepName").val());
		$("iframe").contents().find("body").find("#formDrafterPosName").text($("#drafterPosName").val());
		$("iframe").contents().find("body").find("#formDrafterName").text($("#drafterName").val());
		$("iframe").contents().find("body").find("#formReportDate").text(now);
		
		$($("iframe").contents().find(".positionText")[index]).text($("#drafterPosName").val());
		$($("iframe").contents().find(".stateText")[index]).text("승인");
		$($("iframe").contents().find(".nameText")[index]).text($("#drafterName").val());
		$($("iframe").contents().find(".dateText")[index]).text(now);
	}
	
	else {
		//문서 내부 결재선에 데이터 설정
		$(positionList[index]).text(receivedData.position.posName);
		$(stateList[index]).text("공란");
		$(nameList[index]).text(receivedData.employee.empName);
		$(dateList[index]).text("공란");
		
		$(positionList[index]).addClass(removeId);
		$(stateList[index]).addClass(removeId);
		$(nameList[index]).addClass(removeId);
		$(dateList[index]).addClass(removeId);

		//form 양식에 추가하기
		$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="empId" value="' + receivedData.empId + '">');
		$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="aprvLineOrder" value="' + receivedData.aprvLineOrder + '">');
		$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="aprvLineState" value="미결">');
		$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="aprvLineRole" value="결재">');

	}
}

function addMessageEventListener() {
	$(window).on("message", (event) => {
		//팝업창에서 전송한 데이터 얻기(팝업창에서 postMessage() 사용해야 함)
		let receivedData = event.originalEvent.data;
		let receivedIndex = receivedData.index;
		
		let positionList = $("iframe").contents().find(".positionText");
		let stateList = $("iframe").contents().find(".stateText");
		let nameList = $("iframe").contents().find(".nameText");
		let dateList = $("iframe").contents().find(".dateText");
		
		let removeId = 'r' + receivedData.empId;
		
		//맨처음으로 들어오는 메시지 이벤트가 이전에 있던 결재선과 폼 안에 존재하는 결재선을 초기화
		if (receivedIndex === 0) {
			$(".remove-flag").remove();
			positionList.each((index, item) => {
				if (index > 0) {
					$(item).text("공란");
				}
			});
			stateList.each((index, item) => {
				if (index > 0) {
					$(item).text("공란");
				}
			});
			nameList.each((index, item) => {
				if (index > 0) {
					$(item).text("공란");
				}
			});
			dateList.each((index, item) => {
				if (index > 0) {
					$(item).text("공란");
				}
			});
		}
		
		//하나 이상의 데이터가 왔을 경우 
		if (receivedData.lastIndex >= 0) {
			
			//결재선에 추가
			appendApprovalLineToList(receivedIndex + 1, receivedData);

			//문서 내부 결재선에 데이터 설정
			$(positionList[receivedIndex + 1]).text(receivedData.position.posName);
			$(stateList[receivedIndex + 1]).text("공란");
			$(nameList[receivedIndex + 1]).text(receivedData.employee.empName);
			$(dateList[receivedIndex + 1]).text("공란");
			
			$(positionList[receivedIndex + 1]).addClass(removeId);
			$(stateList[receivedIndex + 1]).addClass(removeId);
			$(nameList[receivedIndex + 1]).addClass(removeId);
			$(dateList[receivedIndex + 1]).addClass(removeId);

			//form 양식에 추가하기
			$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="empId" value="' + receivedData.empId + '">');
			$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="aprvLineOrder" value="' + receivedData.aprvLineOrder + '">');
			$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="aprvLineState" value="미결">');
			$("#approvalForm").append('<input class="' + removeId + ' remove-flag" type="hidden" name="aprvLineRole" value="결재">');

			
			let remover = '#' + removeId;
			let removee = '.' + removeId;
			//x 아이콘에 클릭 시 삭제 이벤트 등록하기
			$(remover).on('click', (event) => {
				$(removee).remove();
				
				//결재선에서 삭제
				$("iframe").contents().find(removee).text("공란");
				$("iframe").contents().find(removee).removeClass(removeId);
				
				//결재선에서 삭제 후 앞으로 당기기
				for (i = 1; i < 5; i++) {
					if ($(positionList[i - 1]).text() === "공란" && $(positionList[i]).text !== "공란" && $(positionList[i]).attr("class").split(" ").length > 3) {
						let currentId = $(positionList[i]).attr("class").split(" ").slice(-1);
						
						$(positionList[i - 1]).text($(positionList[i]).text());
						$(stateList[i - 1]).text($(stateList[i]).text());
						$(nameList[i - 1]).text($(nameList[i]).text());
						$(dateList[i - 1]).text($(dateList[i]).text());
						
						$(positionList[i - 1]).addClass(currentId);
						$(stateList[i - 1]).addClass(currentId);
						$(nameList[i - 1]).addClass(currentId);
						$(dateList[i - 1]).addClass(currentId);
						
						$(positionList[i]).text("공란");
						$(stateList[i]).text("공란");
						$(nameList[i]).text("공란");
						$(dateList[i]).text("공란");
						
						$(positionList[i]).removeClass(currentId);
						$(stateList[i]).removeClass(currentId);
						$(nameList[i]).removeClass(currentId);
						$(dateList[i]).removeClass(currentId);
					}
				}
			});
		}
	});
}

function addRemoveEventListener() {
	$(".mdi-close").each((index, element) => {
		var id = $(element).attr("id");
		let removeId = 'r' + id;
		let remover = '#' + id;
		let removee = '.' + id;

		$(remover).on('click', (event) => {
			$(removee).remove();
			$("iframe").contents().find(removee).text("공란");
			$("iframe").contents().find(removee).removeClass(removeId);
		
			let positionList = $("iframe").contents().find(".positionText");
			let stateList = $("iframe").contents().find(".stateText");
			let nameList = $("iframe").contents().find(".nameText");
			let dateList = $("iframe").contents().find(".dateText");

			for (i = 1; i < 5; i++) {
				if ($(positionList[i - 1]).text() === "공란" && $(positionList[i]).text !== "공란" && $(positionList[i]).attr("class").split(" ").length > 3) {
					let currentId = $(positionList[i]).attr("class").split(" ").slice(-1);
					
					$(positionList[i - 1]).text($(positionList[i]).text());
					$(stateList[i - 1]).text($(stateList[i]).text());
					$(nameList[i - 1]).text($(nameList[i]).text());
					$(dateList[i - 1]).text($(dateList[i]).text());
					
					$(positionList[i - 1]).addClass(currentId);
					$(stateList[i - 1]).addClass(currentId);
					$(nameList[i - 1]).addClass(currentId);
					$(dateList[i - 1]).addClass(currentId);
					
					$(positionList[i]).text("공란");
					$(stateList[i]).text("공란");
					$(nameList[i]).text("공란");
					$(dateList[i]).text("공란");
					
					$(positionList[i]).removeClass(currentId);
					$(stateList[i]).removeClass(currentId);
					$(nameList[i]).removeClass(currentId);
					$(dateList[i]).removeClass(currentId);
				}
			}
		});
	});
}