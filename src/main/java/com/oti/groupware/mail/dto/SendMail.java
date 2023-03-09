package com.oti.groupware.mail.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SendMail {
    private int sendMailId;
    private String empId;
    private String sendMailTitle;
    private String sendMailContent;
    private String sendMailImportanceYN;
    private Date sendMailDate;
    private String sendMailTempYN;
    private String sendMailDelYN;
    private String sendMailDelCompleteYN;
    private List<MultipartFile> fileList;
}