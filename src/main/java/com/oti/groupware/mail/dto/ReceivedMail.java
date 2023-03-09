package com.oti.groupware.mail.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReceivedMail {
    private int sendMailId;
    private String empIdEmployees;
    private String recdMailImportanceYN;
    private Date recdMailDate;
    private String recdMailReadReceiptYN;
    private Date recdMailDelDate;
    private String recdMailDelYN;
    private String recdMailDelCompleteYN;
}