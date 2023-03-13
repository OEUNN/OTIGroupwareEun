package com.oti.groupware.approval;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Component;

@Component
public class DocumentContentProvider {
	private String documentId;
	private String documentRetentionPeriod;
	private String today;
	
	public String getDocumentIdByDocumentType(String documentType) {
		today = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		switch (documentType) {
		
		case "휴일근무품의서":
			documentId = "01-" + today;
			break;
			
		case "출장품의서":
			documentId = "02-" + today;
			break;
			
		case "경조사품의서":
			documentId = "03-" + today;
			break;
			
		case "예비군공가품의서":
			documentId = "04-" + today;
			break;

		default:
			break;
		}
		
		return documentId; 
	}
	
	public String getDocumentRetentionPeriodByDocumentType(String documentType) {
		switch (documentType) {
		
		case "휴일근무품의서":
			documentRetentionPeriod = "5년";
			break;
			
		case "출장품의서":
			documentRetentionPeriod = "3년";
			break;
			
		case "경조사품의서":
			documentRetentionPeriod = "1년";
			break;
			
		case "예비군공가품의서":
			documentRetentionPeriod = "1년";
			break;
			
		default:
			break;
		}
		
		return documentRetentionPeriod; 
	}
}