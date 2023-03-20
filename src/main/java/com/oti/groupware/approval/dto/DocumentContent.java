package com.oti.groupware.approval.dto;

import lombok.Data;

@Data
public class DocumentContent {
	private String docId;
	private String docTitle;
	private String docContent;
	private String docType;
	private String docState;
	private String docTempYn;
}