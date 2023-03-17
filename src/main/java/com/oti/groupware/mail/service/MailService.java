package com.oti.groupware.mail.service;

import java.util.List;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.mail.dto.MailCount;
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
	int sendMailRowsCount(String empId); //보낸메일함 get 총 row 
	List<SendMail> getSendMail(String empId, Pager pager); //보낸메일함 get
	void sendMailChangeImport(int mailId); //보낸 메일함 중요도 바꾸기
	void sendMailSearchDelete(List<Integer> deleteMail); //보낸 메일함 선택 삭제
	int sendMailSearchRowsCount(String empId, String search); //보낸 메일함 필터링 후 rows
	List<SendMail> getSearchSendMail(String empId, Pager pager, String search); //보낸 메일함 필터링된 list
	int importMailRowsCount(String empId);
	void receivedMailSearchDelete(List<Integer> list, String empId);
	List<SendMail> getImportMail(String empId, Pager pager);
	void importMailChangeImport(int mailId, String empId);
	void importMailSearchDelete(List<Integer> list, String empId); //중요메일 휴지통  보내기
	int tempMailRowsCount(String empId);
	List<SendMail> getTempMail(String empId, Pager pager);
	int trashMailRowsCount(String empId);
	List<SendMail> getTrashMail(String empId, Pager pager);
	void tempMailDelete(List<Integer> list); //임시 보관함 완전 삭제
	void trashMailDeleteRestore(List<Integer> list, String empId, String result);
	void deleteTrashMail(); //30일이 지난 휴지통 메일 삭제
	void completeDelete();//한달에한번 삭제가 되었는지 확인
	SendMail getDetailSendMail(int mailid, String category); //메일 디테일을 확인하기 위해
	List<MailFile> getMailFile(int mailid);
	MailFile getMailFileById(int mfile);
	MailCount mailHomeCount(String empId); //메인 홈 통계
}
