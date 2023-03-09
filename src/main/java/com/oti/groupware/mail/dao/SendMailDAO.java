package com.oti.groupware.mail.dao;

import com.oti.groupware.mail.dto.SendMail;

public interface SendMailDAO {
	public void insertTempMail(SendMail sendMail);
	public void insertSendMail(SendMail sendMail);
	public String getEmpIdById(int sendMailId);
	public String getTitleById(int sendMailId);
	
	public SendMail getSendMailById(int sendMailId);
    public void updateSendMail(SendMail sendMail);
    public void deleteSendMail(int sendMailId);
	
	
}