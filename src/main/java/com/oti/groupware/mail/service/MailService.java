package com.oti.groupware.mail.service;

import java.util.List;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.mail.dto.MailFile;
import com.oti.groupware.mail.dto.ReceivedMail;
import com.oti.groupware.mail.dto.SendMail;

public interface MailService {
	List<Employee> getEmployee();
	void writeMail(SendMail sendMail, String[] arr);
	void writeFile(MailFile mailFile);
	void writeTempMail(SendMail sendMail);
	List<ReceivedMail> getReceivedMail(String empId, Pager pager);
	int mailRowsCount(String empId);
	void receivedMamilChangeImport(int mailId, String empId);
	int receivedMailSearchRowsCount(String empId, String search);
	List<ReceivedMail> getSearchReceivedMail(String empId, Pager pager, String search);
	int sendMailRowsCount(String empId);
	List<SendMail> getSendMail(String empId, Pager pager);
	void sendMailChangeImport(int mailId);
	int sendMailSearchRowsCount(String empId, String search);
	List<SendMail> getSearchSendMail(String empId, Pager pager, String search);
	int importMailRowsCount(String empId);
	List<SendMail> getImportMail(String empId, Pager pager);
	void importMailChangeImport(int mailId, String empId);
	int tempMailRowsCount(String empId);
	List<SendMail> getTempMail(String empId, Pager pager);
	int trashMailRowsCount(String empId);
	List<SendMail> getTrashMail(String empId, Pager pager);
	
}
