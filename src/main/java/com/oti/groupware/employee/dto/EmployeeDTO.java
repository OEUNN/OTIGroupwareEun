package com.oti.groupware.employee.dto;

import lombok.Data;

@Data
public class EmployeeDTO {

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
    private String empFileType;
}