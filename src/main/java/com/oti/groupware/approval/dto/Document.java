package com.oti.groupware.approval.dto;

import java.sql.Timestamp;
import java.util.List;

import com.oti.groupware.employee.dto.Employee;

import lombok.Data;

@Data
public class Document {
    private String docId;
    private String empId;
    private String docType;
    private String docTitle;
    private String docContent;
    private String docRetentionPeriod;
    private Timestamp docWriteDate;
    private Timestamp docReportDate;
    private Timestamp docCompleteDate;
    private String docState;
    private String docReadYn;
    private String docTempYn;
    private int docAprvStep;
    private int docMaxStep;
    
    private Employee employee;
    private List<DocumentFile> documentFiles;

	@Override
	public String toString() {
		return "Document [docId=" + docId + ", empId=" + empId + ", docType=" + docType + ", docTitle=" + docTitle
				+ ", docRetentionPeriod=" + docRetentionPeriod + ", docWriteDate=" + docWriteDate + ", docReportDate="
				+ docReportDate + ", docCompleteDate=" + docCompleteDate + ", docState=" + docState + ", docReadYn="
				+ docReadYn + ", docTempYn=" + docTempYn + ", docAprvStep=" + docAprvStep + ", docMaxStep=" + docMaxStep
				+ ", employee=" + employee + "]";
	}
}