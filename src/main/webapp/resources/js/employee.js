//전화번호
function  phoneCheck(){
	//중복이라면
	if($("#userPhone").val() != ''){
		$.ajax({
			type: 'post',
			url : 'CheckController',
			data : {check : "phone" , value : $("#userPhone").val()},
			success : function(data){
				let result = data.result;
				if(result == false){
					
				}else{
					$("#phoneMessage").text('이미 사용중인 전화번호 입니다.');
				}
			}
		});
	}else{
		console.log("입력 없음");
	}
};

//이메일
function emailCheck(){
	//중복이라면
	if($("#userEmail").val() != ''){
		$.ajax({
			type: 'post',
			url : 'CheckController',
			data : {check : "email" ,value : $("#userEmail").val()},
			success : function(data){
				let result = data.result;
				if(result == false){
					
				}else{
					$("#emailMessage").text('이미 사용중인  이메일 입니다.');
				}
			}
		});
	}else{
		console.log("입력 없음");
	}
};