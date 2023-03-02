/**일반전화 유효성 검사**/
		function extensionCheck(){
			let tel_number = $('#empExtensionNumber').val();
			var telNumber = document.getElementById("empExtensionNumber");
			let regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		    let telresult = regExp.test(tel_number);
		    if(!telresult){
		    	telNumber.setAttribute("style", "border:1px solid red;");
		    	return false;
		    }else{
		    	telNumber.setAttribute("style", "border:1px solid none;");
		    	$.ajax({
	    			type: 'post',
	    			url : '../employee/telcheck',
	    			data : {check : "tleNumber" , value : tel_number},
	    			success : function(data){
	    				let checkresult = data.result;
	    				if(checkresult == false){
	    					telNumber.setAttribute("style", "border:1px solid red;");
	    					$('input[name=empExtensionNumber]').attr('placeholder','존재하지 않는 부서 번호입니다.');
	    				}else{
	    					telNumber.setAttribute("style", "border:1px solid none;");
	    					return false;
	    				}
	    			}
	    		});
		    }
		}
		
		/** 휴대전화 유효성 검사**/
		function phoneCheck(){
			let phone_number = $('#empPhoneNumber').val();
			var phoneNumber = document.getElementById("empPhoneNumber");
			let regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		    let phoneresult = regExp.test(phone_number);
		    if(!phoneresult){
		    	phoneNumber.setAttribute("style", "border:1px solid red;");
		    	return false;
		    }else{
		    	phoneNumber.setAttribute("style", "border:1px solid none;");
	    		$.ajax({
	    			type: 'post',
	    			url : '../employee/phonecheck',
	    			data : {check : "phoneNumber" , value : phone_number},
	    			success : function(data){
	    				let checkresult = data.result;
	    				if(checkresult == false){
	    					phoneNumber.setAttribute("style", "border:1px solid red;");
	    					$('input[name=empPhoneNumber]').attr('placeholder','존재하는 번호입니다.');
	    				}else{
	    					phoneNumber.setAttribute("style", "border:1px solid none;");
	    					return false;
	    				}
	    			}
	    		});
		    	
		    }
		}
		
		/** 메일ID 유효성 검사**/
		function mailIdCheck(){
			if($('#empMail').val() == ''){
				mailId.setAttribute("style", "border:1px solid red;");
		    	return false;
			}else{
	    		$.ajax({
	    			type: 'post',
	    			url : '../employee/mailidcheck',
	    			data : {check : "mailId" , value : $('#empMail').val()},
	    			success : function(data){
	    				let checkresult = data.result;
	    				if(checkresult == false){
	    					mailId.setAttribute("style", "border:1px solid red;");
	    					$('input[name=empMail]').attr('placeholder','존재하는 ID입니다.');
	    				}else{
	    					mailId.setAttribute("style", "border:1px solid none;");
	    					return false;
	    				}
	    			}
	    		});
		    	
		    }
		}

		function check(){
			var result = true;
			
			var empName = document.getElementById("empName");
			var empMail = document.getElementById("empMail");
			var empBirthdayStr = document.getElementById("empBirthdayStr");
			var empDetailGender = document.getElementById("empDetailGender");
			var uploadInfo = document.getElementById("uploadInfo");
			var empDetailMilitaryServiceYN = document.getElementById("empDetailMilitaryServiceYN");
			var empPhoneNumber = document.getElementById("empPhoneNumber");
			var empDetailMarriedYN = document.getElementById("empDetailMarriedYN");
			var empDetailMajor = document.getElementById("empDetailMajor");
			var school = document.getElementById("school");
			var employmentDateStr = document.getElementById("employmentDateStr");
			var department = document.getElementById("department");
			var empExtensionNumber = document.getElementById("empExtensionNumber");
			var position = document.getElementById("position");
			var empDetailWorkplace = document.getElementById("empDetailWorkplace");
			
			
			//empName
			if($('#empName').val() == ''){
				empName.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empName.setAttribute("style", "border:1px solid none;");
			}
			
			//empMail
			if($('#empMail').val() == ''){
				empMail.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empMail.setAttribute("style", "border:1px solid none;");
			}
			
			//empBirthdayStr
			if($('#empBirthdayStr').val() == ''){
				empBirthdayStr.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empBirthdayStr.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailGender
			if($('#empDetailGender').val() == ''){
				empDetailGender.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailGender.setAttribute("style", "border:1px solid none;");
			}
			
			//empFileData
			if($('#empFileData').val() == ''){
				uploadInfo.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				uploadInfo.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailMilitaryServiceYN
			if($('#empDetailMilitaryServiceYN').val() == ''){
				empDetailMilitaryServiceYN.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailMilitaryServiceYN.setAttribute("style", "border:1px solid none;");
			}
			
			//empPhoneNumber
			if($('#empPhoneNumber').val() == ''){
				empPhoneNumber.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empPhoneNumber.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailMarriedYN
			if($('#empDetailMarriedYN').val() == ''){
				empDetailMarriedYN.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailMarriedYN.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailMajor
			if($('#empDetailMajor').val() == ''){
				empDetailMajor.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailMajor.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailEducation
			if($('#empDetailEducation').val() == ''){
				school.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				school.setAttribute("style", "border:1px solid none;");
			}
			
			//employmentDateStr
			if($('#employmentDateStr').val() == ''){
				employmentDateStr.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				employmentDateStr.setAttribute("style", "border:1px solid none;");
			}
			
			//depId
			if($('#depId').val() == ''){
				department.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				department.setAttribute("style", "border:1px solid none;");
			}
			
			//empExtensionNumber
			if($('#empExtensionNumber').val() == ''){
				empExtensionNumber.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empExtensionNumber.setAttribute("style", "border:1px solid none;");
			}
			
			//posId
			if($('#posId').val() == ''){
				position.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				position.setAttribute("style", "border:1px solid none;");
			}
			
			//empDetailWorkplace
			if($('#empDetailWorkplace').val() == ''){
				empDetailWorkplace.setAttribute("style", "border:1px solid red;");
				result= false;
			}else{
				empDetailWorkplace.setAttribute("style", "border:1px solid none;");
			}
			
			return result;
		}