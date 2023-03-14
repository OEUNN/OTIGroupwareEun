package com.oti.groupware.approval.dto;

import lombok.Data;

@Data
public class SearchQuery {
	int pageNo;
	String docId;
	String docTitle;
	String docState;
	String empName;
	String docReportStartDate;
	String docReportEndDate;
	String docCompleteStartDate;
	String docCompleteEndDate;
	String docWriteStartDate;
	String docWriteEndDate;
}
