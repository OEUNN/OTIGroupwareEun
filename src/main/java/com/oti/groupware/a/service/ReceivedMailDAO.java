package com.oti.groupware.a.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.mail.dto.ReceivedMail;
import com.oti.groupware.mail.dto.SendMail;

public interface ReceivedMailDAO {
	public void insertReceivedMail(@Param("sendMailId")int sendMailId, @Param("empId")String empId);
	public List<ReceivedMail> getReceivedMailById(@Param("empId")String empId, @Param("pager")Pager pager);
//	public ReceivedMail getReceivedMailById(@Param("sendMailId") String sendMailId, @Param("empId") String empId);
	public void updateReceivedMail(ReceivedMail receivedMail);
	public int getMailTotalRow(String empId);
	public int mailSearchRowsCount(@Param("empId")String empId, @Param("search")String search);
	public List<ReceivedMail> getSearchReceivedMailById(@Param("empId")String empId,  @Param("pager")Pager pager, @Param("search")String search);
	public int getReceivedCount(int sendMailId);
	public String receivedMailGetImport(@Param("mailId")int mailId, @Param("empId")String empId);
	public void receivedMailChangeImport(@Param("star")String star, @Param("mailId")int mailId, @Param("empId")String empId);
	public List<String> getReceivedEmpId(int sendMailId);
	public String readYN(@Param("sendMailId")int sendMailId, @Param("empId")String empId);
	public List<ReceivedMail> getMailInformation(int sendMailId);
	public void importReceivedMailChangeImport(@Param("mailId")int mailId, @Param("empId")String empId);
	public void receivedMailSearchDelete(@Param("arr")List<Integer> mailId, @Param("empId")String empId);
	public void updateTrashMail(@Param("arr")List<Integer> mailId, @Param("empId")String empId); //send테이블 완전 삭제
	public void updateReceivedRestore(@Param("arr")List<Integer> mailId, @Param("empId")String empId); //받은메일에 대한 복귀
	public void updateCompleteReceivedMail(@Param("receivedMail")List<ReceivedMail> receivedMail); //휴지통에 들어온지 30일이 지난 메일의 complete를 update해준다.
	public int getAllReceivedMail(Integer mailId);
	public int getCompleteReceivedMail(Integer mailId);
	public void deleteReceivedMail(@Param("mailId") int mailId);
	public int getReceivedMailCount(String empId);
	public int getNotReadCount(String empId);
	public int getImportCount(String empId);
	
	
}