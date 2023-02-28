/**일반전화 유효성 검사**/
function extensionCheck(){
	let tel_number = $('#empExtensionNumber').val();
	var telNumber = document.getElementById("empExtensionNumber");
	let regExp = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))(\d{3,4})(\d{4})$/;
    let result = regExp.test(tel_number);
    if(!result){
    	telNumber.setAttribute("style", "background-color:;");
    	return false;
    }else{
    	telNumber.setAttribute("style", "background-color: none;");
    }
}

/** 휴대전화 유효성 검사**/
function phoneCheck(){
	let phone_number = $('#empPhoneNumber').val();
	var phoneNumber = document.getElementById("empPhoneNumber");
	let regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    let result = regExp.test(phone_number);
    if(!result){
    	phoneNumber.setAttribute("style", "background-color:#;");
    	return false;
    }else{
    	phoneNumber.setAttribute("style", "background-color: none;");
    }
}


function check(){
	var result = true;
	
	var empName = document.getElementById("empName");
	var empMail = document.getElementById("empMail");
	var empBirthdayStr = document.getElementById("empBirthdayStr");
	var empDetailGender = document.getElementById("empDetailGender");
	var empFileData = document.getElementById("empFileData");
	var empDetailMilitaryServiceYN = document.getElementById("empDetailMilitaryServiceYN");
	var empPhoneNumber = document.getElementById("empPhoneNumber");
	var empDetailMarriedYN = document.getElementById("empDetailMarriedYN");
	var empDetailMajor = document.getElementById("empDetailMajor");
	var empDetailEducation = document.getElementById("empDetailEducation");
	var employmentDateStr = document.getElementById("employmentDateStr");
	var depId = document.getElementById("depId");
	var empExtensionNumber = document.getElementById("empExtensionNumber");
	
	//empName
	if($('#empName').val() == ''){
		empName.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empName.setAttribute("style", "background-color: none;");
	}
	
	//empMail
	if($('#empMail').val() == ''){
		empMail.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empMail.setAttribute("style", "background-color: none;");
	}
	
	//empBirthdayStr
	if($('#empBirthdayStr').val() == ''){
		empBirthdayStr.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empBirthdayStr.setAttribute("style", "background-color: none;");
	}
	
	//empDetailGender
	if($('#empDetailGender').val() == ''){
		empDetailGender.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empDetailGender.setAttribute("style", "background-color: none;");
	}
	
	//empFileData
	if($('#empFileData').val() == ''){
		empFileData.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empFileData.setAttribute("style", "background-color: none;");
	}
	
	//empDetailMilitaryServiceYN
	if($('#empDetailMilitaryServiceYN').val() == ''){
		empDetailMilitaryServiceYN.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empDetailMilitaryServiceYN.setAttribute("style", "background-color: none;");
	}
	
	//empPhoneNumber
	if($('#empPhoneNumber').val() == ''){
		empPhoneNumber.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empPhoneNumber.setAttribute("style", "background-color: none;");
	}
	
	//empDetailMarriedYN
	if($('#empDetailMarriedYN').val() == ''){
		empDetailMarriedYN.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empDetailMarriedYN.setAttribute("style", "background-color: none;");
	}
	
	//empDetailMajor
	if($('#empDetailMajor').val() == ''){
		empDetailMajor.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empDetailMajor.setAttribute("style", "background-color: none;");
	}
	
	//empDetailEducation
	if($('#empDetailEducation').val() == ''){
		empDetailEducation.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empDetailEducation.setAttribute("style", "background-color: none;");
	}
	
	//employmentDateStr
	if($('#employmentDateStr').val() == ''){
		employmentDateStr.setAttribute("style", "background-color:;");
		result= false;
	}else{
		employmentDateStr.setAttribute("style", "background-color: none;");
	}
	
	//depId
	if($('#depId').val() == ''){
		depId.setAttribute("style", "background-color:;");
		result= false;
	}else{
		depId.setAttribute("style", "background-color: none;");
	}
	
	//empExtensionNumber
	if($('#empExtensionNumber').val() == ''){
		empExtensionNumber.setAttribute("style", "background-color:;");
		result= false;
	}else{
		empExtensionNumber.setAttribute("style", "background-color: none;");
	}
	
	return result;
}

