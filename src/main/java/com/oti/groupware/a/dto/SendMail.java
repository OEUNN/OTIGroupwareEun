package com.oti.groupware.a.dto;

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
    private int receivedCount;
    private List<EmployeeInfo> empList;
    private String fileYN; //파일 유무
    private String tbName;
    private String posName;
    private String depName;
    private String empName;
}