package com.oti.groupware.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.mail.dto.ReceivedMail;

public interface ReceivedMailDAO {
	public void insertReceivedMail(@Param("sendMailId")int sendMailId, @Param("empId")String empId);
	public List<ReceivedMail> getReceivedMailById(String empId);
//	public ReceivedMail getReceivedMailById(@Param("sendMailId") String sendMailId, @Param("empId") String empId);
	public void updateReceivedMail(ReceivedMail receivedMail);
	public void deleteReceivedMail(@Param("sendMailId") String sendMailId, @Param("empId") String empId);
	
}