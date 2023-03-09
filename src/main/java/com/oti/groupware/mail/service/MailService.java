package com.oti.groupware.mail.service;

import java.util.List;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.mail.dto.MailFile;
import com.oti.groupware.mail.dto.ReceivedMail;
import com.oti.groupware.mail.dto.SendMail;

public interface MailService {
	List<Employee> getEmployee();
	void writeMail(SendMail sendMail, String[] arr);
	void writeFile(MailFile mailFile);
	void writeTempMail(SendMail sendMail);
	List<ReceivedMail> getReceivedMail(String empId);
	

}
