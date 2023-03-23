package com.oti.groupware.approval.component;

public enum ApprovalEnum {
	APPROVE("승인"),
	DENY("반려"),
	RETRIEVE("회수"),
	OPEN("열람"),
	DELETE("삭제");
	
	private String state;
	
	ApprovalEnum(String state) {
		this.state = state;
	}
	
	public String getValue() {
		return state;
	}
}
