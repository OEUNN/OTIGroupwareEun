package com.oti.groupware.approval.dto;

import lombok.Data;

@Data
public class DocumentContent {
	private String drafterId;
	private String docReportDate;
	
	private String[] approvalId;
	private String[] approvalName;
	private String[] approvalState;
	private String[] approvalDate;
	private String[] depName;
	private String[] posName;
	private int[] approvalOrder;
}