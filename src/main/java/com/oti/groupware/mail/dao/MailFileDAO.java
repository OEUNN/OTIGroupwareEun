package com.oti.groupware.mail.dao;

import java.util.List;

import com.oti.groupware.mail.dto.MailFile;

public interface MailFileDAO {
	public List<MailFile> getMailFile(int mailFileId);
	public MailFile getMailFileById(int mailFileId);
    public void updateMailFile(MailFile mailsFile);
    public void deleteMailFile(int mailFileId);
	public void insertMailFile(MailFile mailFile);
	public int getFileYN(int sendMailId);
}