package com.oti.groupware.mail.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReceivedMail {
    private int sendMailId;
    private String empIdEmployees;
    private char recdMailImportanceYN;
    private Date recdMailDate;
    private char recdMailReadReceiptYN;
    private Date recdMailDelDate;
    private char recdMailDelYN;
    private char recdMailDelCompleteYN;
    private char recdSR;
}