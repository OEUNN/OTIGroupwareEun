package com.oti.groupware.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.mail.dto.ReceivedMail;

public interface ReceivedMailDAO {
	public void insertReceivedMail(@Param("sendMailId")int sendMailId, @Param("empId")String empId);
	public List<ReceivedMail> getReceivedMailById(@Param("empId")String empId, @Param("pager")Pager pager);
//	public ReceivedMail getReceivedMailById(@Param("sendMailId") String sendMailId, @Param("empId") String empId);
	public void updateReceivedMail(ReceivedMail receivedMail);
	public void deleteReceivedMail(@Param("sendMailId") String sendMailId, @Param("empId") String empId);
	public int getMailTotalRow(String empId);
	public int mailSearchRowsCount(@Param("empId")String empId, @Param("search")String search);
	public List<ReceivedMail> getSearchReceivedMailById(@Param("empId")String empId,  @Param("pager")Pager pager, @Param("search")String search);
	public int getReceivedCount(int sendMailId);
	public List<String> getrecivedId(int sendMailId);
	public String receivedMamilGetImport(@Param("mailId")int mailId, @Param("empId")String empId);
	public void receivedMamilChangeImport(@Param("star")String star, @Param("mailId")int mailId, @Param("empId")String empId);
	
}