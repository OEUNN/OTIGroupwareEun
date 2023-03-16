package com.oti.groupware.a.dto;

import lombok.Data;

@Data
public class Organization {
	String empId;
	int posId;
	int depId;
	String empMail;
	String empName;
	String depName;
	String depPhoneNumber;
	String posName;
}
