package com.oti.groupware.mail.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.mail.dto.ReceivedMail;

public interface ReceivedMailDAO {
	public ReceivedMail getReceivedMailById(@Param("sendMailId") String sendMailId, @Param("empId") String empId);
	public void insertReceivedMail(ReceivedMail receivedMail);
	public void updateReceivedMail(ReceivedMail receivedMail);
	public void deleteReceivedMail(@Param("sendMailId") String sendMailId, @Param("empId") String empId);
}