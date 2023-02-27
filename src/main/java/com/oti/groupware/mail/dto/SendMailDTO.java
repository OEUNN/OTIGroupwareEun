package com.oti.groupware.mail.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SendMailDTO {

    private int sendMailId;
    private String empId;
    private String sendMailTitle;
    private String sendMailContent;
    private char sendMailImportanceYN;
    private Date sendMailDate;
    private char sendMailTempYN;
    private char sendMailDelYN;
    private char sendMailDelCompleteYN;
    private char sendSR;
}