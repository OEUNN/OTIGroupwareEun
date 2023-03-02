/**일반전화 유효성 검사**/
function extensionCheck(){
	let tel_number = $('#empExtensionNumber').val();
	let regExp = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))(\d{3,4})(\d{4})$/;
    let result = regExp.test(tel_number);
    if(!result){
    	document.getElementById('empExtensionNumber').style.backgroundColor('red');
    	return false;
    }
}

/** 휴대전화 유효성 검사**/
function phoneCheck(){
	let phone_number = $('#empPhoneNumber').val();
	let regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    let result = regExp.test(phone_number);
    if(!result){
    	document.getElementById('empPhoneNumber').style.backgroundColor('red');
    }
}


function check(){
	var result = true;
	
	if($('#empName').val() == ''){
		$("#empNameMsg").text('이름이 입력되지 않았습니다.');
		result= false;
	}else{
		$("#empNameMsg").text('');
	}
	
	if($('#empMail').val() == ''){
		$("#empMailMsg").text('이메일 아이디를 입력해주세요.');
		result= false;
	}else{
		$("#empMailMsg").text('');
	}
	
	if($('#empBirthdayStr').val() == ''){
		$("#empBirthdayStrMsg").text('날짜를 선택해주세요.');
		result= false;
	}else{
		$("#empBirthdayStrMsg").text('');
	}
	
	if($('#empDetailMajor').val() == ''){
		$("#empDetailMajorMsg").text('전공을 선택해주세요.');
		result= false;
	}else{
		$("#empDetailMajorMsg").text('');
	}
	
	if($('#empDetailEducation').val() == ''){
		$("#empDetailEducationMsg").text('최종 학력을 선택해주세요.');
		result= false;
	}else{
		$("#empDetailEducationMsg").text('');
	}
	
	if($('#employmentDateStr').val() == ''){
		$("#employmentDateStrMsg").text('날짜를 선택해주세요.');
		result= false;
	}else{
		$("#employmentDateStrMSg").text('');
	}
	
	if($('#depId').val() == ''){
		$("#depIdMsg").text('부서를 선택해주세요.');
		result= false;
	}else{
		$("#depIdMsg").text('');
	}
	
	return result;
}

