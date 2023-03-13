package com.oti.groupware.approval.dto;

import lombok.Data;

@Data
public class SearchQuery {
	String docId;
	String docTitle;
	String docState;
	String docReportStartDate;
	String docReportEndDate;
	String docCompleteStartDate;
	String docCompleteEndDate;
	int pageNo;
}
