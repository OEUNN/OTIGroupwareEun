package com.oti.groupware.employee.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeDetail {

    private String empId; //사번
    private char empDetailGender; //성별
    private Date empDetailBirthday; //생일
    private String empDetailWorkplace; //근무지
    private char empDetailMarriedYN; //결현여부
    private Date empDetailEmploymentDate; //입사날짜
    private String empDetailEducation; //최종학력
    private int empDetailSeniority; //근속년수
    private String empDetailEmploymentState; //재직상태
    private char empDetailMilitaryServiceYN; //병역여부
    private String empDetailMajor; //전공
    private Date empDetailQuitDate; //퇴사날짜
    private int posId; //직급
    private int depId; //부서
    private String empMail; //메일
    private String empName; //이름
    private String empExtensionNumber; //사내전화번호
    private String empPhoneNumber; //개인전화번호
    private MultipartFile empFileData;
    private String empFileType;
}