package com.oti.groupware.employee.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeAll {
    private String empId;
    private int posId;
    private String posName;
    private int depId;
    private String depName;
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
    private char empDetailGender; //성별
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date empDetailBirthday; //생일
    private String empDetailWorkplace; //근무지
    private char empDetailMarriedYN; //결현여부
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date empDetailEmploymentDate; //입사날짜
    private String empDetailEducation; //최종학력
    private int empDetailSeniority; //근속년수
    private String empDetailEmploymentState; //재직상태
    private char empDetailMilitaryServiceYN; //병역여부
    private String empDetailMajor; //전공
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date empDetailQuitDate; //퇴사날짜
}