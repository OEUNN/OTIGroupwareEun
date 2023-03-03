package com.oti.groupware.employee.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Employee {

    private String empId;
    private int posId;
    private int depId;
    private String empMail;
    private String empName;
    private String empPassword;
    private String empExtensionNumber;
    private String empPhoneNumber;
    private int empLeaveReserve;
    private int empSubstitueReserve;
    private int empLoginFailuresCnt;
    private byte[] empFileData;
    private MultipartFile empFileDataMulti;
    private String empFileType;
    private String empFileName;
    private String roleName;
    private boolean empEnabled;
}