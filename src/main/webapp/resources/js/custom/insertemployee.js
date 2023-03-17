function check(){
	var result = true;
	//empId
	let empId = $('#empDetailEmploymentDate').val();
	$('#empId').val(empId);

	//empName
	if ($('#empName').val() == '') {
		$('#nameResult').attr('style','color:red');
		$('#nameResult').html('이름을 입력해주세요.');
		result = false;
	}else if($('#nameInput').val()=='false'){
		result = false;
	}else {
		$('#nameResult').attr('style','color:green');
		$('#nameResult').html('success');
	}
	
	//메일
	if ($('#empMail').val() == '') {
		$('#mailResult').attr('style','color:red');
		$('#mailResult').html('메일 아이디를 입력해주세요.');
		result = false;
	}else if($('#mailInput').val()=='false'){
		result = false;
	}else {
		$('#mailResult').attr('style','color:green');
		$('#mailResult').html('success');
	}
	
	//empDetailBirthday
	if ($('#empDetailBirthday').val() == '') {
		$('#birthdayResult').attr('style','color:red');
		$('#birthdayResult').html('생년월일을 선택해주세요.');
		result = false;
	} else {
		$('#birthdayResult').attr('style','color:green');
		$('#birthdayResult').html('success');
	}

	//성별
	
	/**empFileData**/
	if($('#empFileDataMulti').val() == ''){
		$('#fileResult').attr('style','color:red');
		$('#fileResult').html('파일업로드 부탁드립니다.');
		result = false;
	}else if($('#fileInput').val() == 'false'){
		result = false;
	}else{
		$('#fileResult').attr('style','color:green');
		$('#fileResult').html('success');
	}

	//병역
	
	//empPhoneNumber
	if ($('#empPhoneNumber').val() == '') {
		$('#phoneResult').attr('style','color:red');
		$('#phoneResult').html('개인전화번호 입력해주세요.');
		result = false;
	}else if($('#phoneInput').val() == 'false'){
		result = false;
	}else{
		$('#phoneResult').attr('style','color:green');
		$('#phoneResult').html('success');
	}
	
	//결혼여부
	
	//empDetailMajor
	if ($('#empDetailMajor').val() == '') {
		$('#majorResult').attr('style','color:red');
		$('#majorResult').html('전공을 입력해주세요.');
		result = false;
	}else if($('#majorInput').val()=='false'){
		result = false;
	}else {
		$('#majorResult').attr('style','color:green');
		$('#majorResult').html('success');
	}

	//empDetailEducation
	if ($('#empDetailEducation').val() == '') {
		$('#educationResult').attr('style','color:red');
		$('#educationResult').html('학력을 선택해주세요.');
		result = false;
	} else {
		$('#educationResult').attr('style','color:green');
		$('#educationResult').html('success');
	}

	//empDetailEmploymentDate
	if ($('#empDetailEmploymentDate').val() == '') {
		$('#inResult').attr('style','color:red');
		$('#inResult').html('입사일을 선택해주세요.');
		result = false;
	} else {
		$('#inResult').attr('style','color:green');
		$('#inResult').html('success');
		
	}

	//depId
	if ($('#depId').val() == '') {
		$('#depIdResult').attr('style','color:red');
		$('#depIdResult').html('부서를 선택해주세요.');
		result = false;
	} else {
		$('#depIdResult').attr('style','color:green');
		$('#depIdResult').html('success');
		if ($('#depId').val() == '공공사업1DIV') {
			$("#depId").val(1);
		} else if ($('#depId').val() == '공공사업2DIV') {
			$("#depId").val(2);
		} else if ($('#depId').val() == '공공사업3DIV') {
			$("#depId").val(3);
		} else if ($('#depId').val() == '경영지원부') {
			$("#depId").val(4);
		} else if ($('#depId').val() == '임원') {
			$("#depId").val(5);
		}
	}

	//empDetailWorkplace
	if ($('#empDetailWorkplace').val() == '') {
		$('#depResult').attr('style','color:red');
		$('#depResult').html('근무지를 입력해주세요.');
		result = false;
	}else if($('#depInput').val()=='false'){
		result = false;
	}else {
		$('#depResult').attr('style','color:green');
		$('#depResult').html('success');
	}
	
	//posId
	if ($('#posId').val() == '') {
		$('#posResult').attr('style','color:red');
		$('#posResult').html('직급을 선택해주세요.');
		result = false;
	} else {
		$('#posResult').attr('style','color:green');
		$('#posResult').html('success');
		if ($('#posId').val() == '사원') {
			$("#posId").val(1);
		} else if ($('#posId').val() == '대리') {
			$("#posId").val(2);
		} else if ($('#posId').val() == '과장') {
			$("#posId").val(3);
		} else if ($('#posId').val() == '차장') {
			$("#posId").val(4);
		} else if ($('#posId').val() == '부장') {
			$("#posId").val(5);
		} else if ($('#posId').val() == '이사') {
			$("#posId").val(6);
		} else if ($('#posId').val() == '대표이사') {
			$("#posId").val(7);
		}
	}

	//empExtensionNumber
	if ($('#empExtensionNumber').val() == '') {
		$('#extensionResult').attr('style','color:red');
		$('#extensionResult').html('사내 전화번호를 입력해주세요.');
		result = false;
	}else if($('#extensionInput').val()=='false'){
		result = false;
	}else {
		$('#extensionResult').attr('style','color:green');
		$('#extensionResult').html('success');
	}
	
	return result;
}

/** 이름 유효성 검사**/
function nameCheck(){
	let empName = $('#empName').val();
	let checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
	let checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	let nameResult1 = checkSpc.test(empName);
	let nameResult2 = checkKor.test(empName);
	if(!nameResult1){
		if(nameResult2){
			$('#nameInput').val('true');
		}else{
			$('#nameResult').attr('style','color:red');
			$('#nameInput').val('false');
			$('#nameResult').html('한글 입력 부탁드립니다.');
		}
	}else{
		$('#nameResult').attr('style','color:red');
		$('#nameInput').val('false');
		$('#nameResult').html('특수기호가 포함되어 있습니다.');
	}
}

/** 메일ID 유효성 검사**/
function mailIdCheck() {
	let mail_id =  $('#empMail').val();
	let checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
	let mailResult = checkSpc.test(mail_id);
	if(!mailResult){
		$.ajax({
			type : 'post',
			url : '../employee/mailidcheck',
			data : {
				mailId : mail_id
			},
			success : function(data) {
				if (data == 'false') {
					$('#mailResult').html('존재하는 ID입니다.');
					$('#mailResult').attr('style','color:red');
					$('#mailInput').val("false");
				} else {
					$('#mailInput').val("true");
				}
			}
		});
	}else{
		$('#mailResult').attr('style','color:red');
		$('#mailResult').html('메일 아이디에 특수 기호가 포함되어 있습니다.');
		$('#mailInput').val("false");
	}

}

/** 이미지 파일 유효성 검사 **/
(function($) {
	  'use strict';
	  $(function() {
	    $('.file-upload-default').on('change', function() {
	    	var imgFile = $("#empFileDataMulti").val();
	    	var fileForm = /(.*?)|.(jpg|jpeg|png|gif|bmplpdf)$/;
	    	var maxSize = 5 * 1024 * 1024; // 5MB in bytes
	    	var fileSize;
	    	if(imgFile != '' && imgFile != null){
	    		fileSize = document.getElementById("empFileDataMulti").files[0].size;
	    		if(!imgFile.match(fileForm)){
	    			$('#fileResult').attr('style','color:red');
	    			$('#fileResult').html('이미지 파일만 업로드 가능합니다.');
	    			$('#fileInput').val('false');
	    		}else if(fileSize = maxSize){
	    			$('#fileResult').attr('style','color:red');
	    			$('#fileResult').html('파일사이즈가 5MB가 넘습니다.');
	    			$('#fileInput').val('false');
	    		}
	    	}else{
	    		$('#fileInput').val('true');
	    	}
	    });
	  });
})(jQuery);

/** 휴대전화 유효성 검사**/
function phoneCheck(){
	let phone_number = $('#empPhoneNumber').val();
	var phoneNumber = document.getElementById("empPhoneNumber");
	let regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	let phoneresult = regExp.test(phone_number);
	if (!phoneresult) {
		$('#phoneResult').attr('style','color:red');
		$('#phoneResult').html('유형에 맞게 입력해주세요.');
		$('#phoneInput').val("false");
	} else {
		phoneNumber.setAttribute("style", "border:1px solid none;");
		$.ajax({
			type : 'post',
			url : '../employee/phonecheck',
			data : {
				phoneNumber : phone_number
			},
			success : function(data) {
				console.log(data)
				if (data == 'false') {
					$('#phoneResult').attr('style','color:red');
					$('#phoneResult').html('존재하는 휴대폰번호 입니다.');
					$('#phoneInput').val("false");
				} else {
					$('#phoneInput').val("true");
				}
			}
		});
	}
}

/** 전공 유효성 검사**/
function major(){
	let checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
	var major = $('#empDetailMajor').val();
	let majorResult = checkSpc.test(major);
	if(!majorResult){
		$('#majorInput').val('true');
	}else{
		$('#majorInput').val('false');
		$('#majorResult').attr('style','color:red');
		$('#majorResult').html('특수기호가 포함되어 있습니다.');
	}
}

/** 근무지 유효성 검사**/
function dep(){
	let checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
	var dep = $('#empDetailWorkplace').val();
	let depResult = checkSpc.test(dep);
	if(!depResult){
			$('#depInput').val('true');
	}else{
		$('#depInput').val('false');
		$('#depResult').html('특수기호가 포함되어 있습니다.');
	}
}

/** 사내 전화번호 유효성 검사**/
function extension(){
	let checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
	let checkNum = /^\d{2,3}-\d{3,4}-\d{4}$/; // 일반 전화 번호
	var extension = $('#empExtensionNumber').val();
	let extensionResult1 = checkSpc.test(extension);
	let extensionResult2 = checkNum.test(extension);
	if(!extensionResult1){
		if(extensionResult2){
			$('#extensionInput').val('true');
		}else{
			$('#extensionInput').val('false');
			$('#extensionResult').attr('style','color:red');
			$('#extensionResult').html('지역번호-000-000로 입력해주세요.');
		}
	}else{
		$('#extensionInput').val('false');
		$('#extensionResult').attr('style','color:red');
		$('#extensionResult').html('특수기호가 포함되어 있습니다.');
	}
}

function popup() {
	console.log($('#pw').val()); 
	var url = "../employee/passwordpopup";
    var name = "password popup";
    var option = "width = 500, height =250, top = 50, left = 200, location = no, resizable=no, scrollbars=no "
    window.open(url, name, option);
}