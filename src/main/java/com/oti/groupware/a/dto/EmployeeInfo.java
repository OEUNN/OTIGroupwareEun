package com.oti.groupware.a.dto;

import lombok.Data;

@Data
public class EmployeeInfo {
	private String empId;
    private String empName;
    private String depName;
    private String posName;
    private String readYN;
}