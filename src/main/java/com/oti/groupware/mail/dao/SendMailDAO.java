package com.oti.groupware.mail.dao;

import com.oti.groupware.mail.dto.SendMail;

public interface SendMailDAO {
	public SendMail getSendMailById(int sendMailId);
    public void insertSendMail(SendMail sendMail);
    public void updateSendMail(SendMail sendMail);
    public void deleteSendMail(int sendMailId);
	public void insertTempMail(SendMail sendMail);
}