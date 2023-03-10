package com.oti.groupware.mail.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReceivedMail {
    private int sendMailId; //부모 메일 id
    private String empIdEmployees; //받는사람
    private String recdMailImportanceYN; //중요도
    private Date recdMailDate; //받은날
    private String recdMailReadReceiptYN; //읽음 여부
    private Date recdMailDelDate; //휴지통에 넣은 시간
    private String recdMailDelYN; //휴지통에 넣었는지 여부
    private String recdMailDelCompleteYN; //완전삭제
    private String empId;
    private String empName;
    private String posName;
    private String depName;
    private String sendMailTitle;
    private String fileYN; //파일 유무
}