package com.oti.groupware.approval.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Document {
    private String docId;
    private String empId;
    private String docType;
    private String docTitle;
    private String docContent;
    private String docRetentionPeriod;
    private Date docWriteDate;
    private Date docReportDate;
    private Date docCompleteDate;
    private int docImportance;
    private String docState;
    private char docReadYn;
    private char docTempYn;
    private int docAprvStep;
}