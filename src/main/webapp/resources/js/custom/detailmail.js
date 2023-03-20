function getContextPath() {
   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

function sendtrash(i){
	var mailId= i;
	if($('#star').val == 'Y'){
		swal({
			  title: "중요메일",
			  text: "중요메일 입니다.휴지통으로 보내시겠습니까?",
			  icon: "warning",
			  buttons: {
			  confirm: {
			      text: "확인",
			      value: true,
			      visible: true,
			      className: "",
			      closeModal: true
			    },
			    cancel: {
			      text: "취소",
			      value: null,
			      visible: true,
			      className: "",
			      closeModal: true,
			    }
			  },
			})
			.then((value) => {
			  if (value) {
				  location.href= getContextPath() + "/mail/trash/send/"+mailId;
			  } else {
			     close();
			  }
		});			
	}else{
		swal({
			  title: "휴지통",
			  text: "휴지통으로 보내시겠습니까?",
			  icon: "warning",
			  buttons: {
			  confirm: {
			      text: "확인",
			      value: true,
			      visible: true,
			      className: "",
			      closeModal: true
			    },
			    cancel: {
			      text: "취소",
			      value: null,
			      visible: true,
			      className: "",
			      closeModal: true,
			    }
			  },
			})
			.then((value) => {
			  if (value) {
				  location.href= getContextPath() + "/mail/trash/send/"+mailId;
			  } else {
			     close();
			  }
		});
	}
}
function receivedtrash(i){
	var mailId= i;
	if($('#star').val == 'Y'){
		swal({
			  title: "중요메일",
			  text: "중요메일 입니다.휴지통으로 보내시겠습니까?",
			  icon: "warning",
			  buttons: {
			  confirm: {
			      text: "확인",
			      value: true,
			      visible: true,
			      className: "",
			      closeModal: true
			    },
			    cancel: {
			      text: "취소",
			      value: null,
			      visible: true,
			      className: "",
			      closeModal: true,
			    }
			  },
			})
			.then((value) => {
			  if (value) {
				  location.href= getContextPath() + "/mail/trash/received/"+mailId;
			  } else {
			     close();
			  }
		});
	}else{
		swal({
			title: "휴지통",
			text: "휴지통으로 보내시겠습니까?",
			icon: "warning",
			buttons: {
			confirm: {
			      text: "확인",
			      value: true,
			      visible: true,
			      className: "",
			      closeModal: true
			    },
			    cancel: {
			      text: "취소",
			      value: null,
			      visible: true,
			      className: "",
			      closeModal: true,
			    }
			},
		})
		.then((value) => {
			if (value) {
				location.href= getContextPath() + "/mail/trash/received/"+mailId;
			} else {
				close();
			}
		});
	}
}
function sendtrashdelete(i){
	console.log("3");
	var mailId= i;
	swal({
		  title: "메일 삭제",
		  text: "휴지통의 메일은 삭제시 복구할 수 없습니다.",
		  icon: "error",
		  buttons: {
		  confirm: {
		      text: "확인",
		      value: true,
		      visible: true,
		      className: "",
		      closeModal: true
		    },
		    cancel: {
		      text: "취소",
		      value: null,
		      visible: true,
		      className: "",
		      closeModal: true,
		    }
		  },
		})
		.then((value) => {
		  if (value) {
			  location.href= getContextPath() + "/mail/completetrash/send/"+mailId;
		  } else {
		     close();
		  }
	});
}
function receivedtrashdelete(i){
	console.log("4");
	var mailId= i;
	swal({
		  title: "메일 삭제",
		  text: "휴지통의 메일은 삭제시 복구할 수 없습니다.",
		  icon: "error",
		  buttons: {
		  confirm: {
		      text: "확인",
		      value: true,
		      visible: true,
		      className: "",
		      closeModal: true
		    },
		    cancel: {
		      text: "취소",
		      value: null,
		      visible: true,
		      className: "",
		      closeModal: true,
		    }
		  },
		})
		.then((value) => {
		  if (value) {
			  location.href= getContextPath() + "/mail/completetrash/received/"+mailId;
		  } else {
		     close();
		  }
	});
}