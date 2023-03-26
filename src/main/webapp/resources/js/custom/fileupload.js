$(() => {
	const fileInput = $("#fileUploader");
	const MAX_FILE_SIZE = 1024 * 1024 * 50; // 50MB in bytes
	const ALLOWED_EXTENSIONS = ["jpg", "jpeg", "png", "gif", "pptx", "ppt", "pdf", "hwp", "docx", "xlsx", "xls", "csv"];
	let lastUploadedFiles = []; //가장 마지막으로 올린 파일
	
	fileInput.on("click", (event) => {
		fileInput.prop("disabled", true);
		if ($("iframe").contents().find("#A4").length === 0) {
			swal({
				title: "문서가 없습니다",
				text: "양식을 먼저 불러와 주세요.",
				icon: "warning",
				button: "닫기"
			});
		}
		else {
			fileInput.prop("disabled", false);
		}
	});

	fileInput.on("change", (event) => {
	
		//input 태그의 업로드목록
		const files = event.target.files;
		let discardFiles = [];
		
		for (let i = 0; i < files.length; i++) {
			const file = files[i];
			const fileSize = file.size;
			const fileExtension = file.name.split(".").pop().toLowerCase();
			
			//파일 크기가 제한보다 크면 제거하고 아니면  유지
			if (fileSize > MAX_FILE_SIZE) {
				swal({
					title: "용량 제한",
					text: "첨부파일 사이즈는 50MB 보다 작아야 합니다.",
					icon: "warning",
					button: "닫기"
				});
				discardFiles.push(file);
			} 
			else if(!ALLOWED_EXTENSIONS.includes(fileExtension)) {
				swal({
				    title: "혀용되지 않는 파일",
				    text: `${ALLOWED_EXTENSIONS.join(", ")} 확장자를 가진 파일만 가능합니다`,
					icon: "warning",
					button: "닫기"
				  });
				discardFiles.push(file);
			}
			else {
				lastUploadedFiles.push(file);
			  
				const listItem = $('<div class="d-flex justify-content-between font-weight-bold text-primary my-3"></div>');
				const deleteButton = $('<i class="mdi mdi-minus"></i>').on("click", () => {
					const index = lastUploadedFiles.indexOf(file);
					if (index > -1) {
						//원본배열을 제거하고 잘려진 배열을 반환 (index 위치에서 1개 제거)
						lastUploadedFiles.splice(index, 1);
					}
					listItem.remove();
				});
				
				if (file.name.length <= 15) {
					listItem.append(document.createTextNode(file.name));
				}
				else {
					listItem.append(document.createTextNode(file.name.substring(0, 12) + "..."));
				}
				listItem.append(deleteButton);
				$("#fileList").append(listItem);
			}
		}
		
		if (discardFiles.length > 0) {
			console.log("필터링!");
			//discarfiles에 들어있는 file과 겹치는 file을 필터링
			const remainingFiles = Array.from(fileInput[0].files).filter((file) => !(discardFiles.includes(file)));
			const dataTransfer = new DataTransfer();
			remainingFiles.forEach(files => dataTransfer.items.add(files));
			const tempFileList = dataTransfer.files;
			fileInput[0].files = tempFileList;
		}
		
	});
});