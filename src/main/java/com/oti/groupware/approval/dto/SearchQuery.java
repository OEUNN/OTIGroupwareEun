package com.oti.groupware.approval.dto;

import lombok.Data;

@Data
public class SearchQuery {
	String docId;
	String docTitle;
	String docState;
	int pageNo;
}
