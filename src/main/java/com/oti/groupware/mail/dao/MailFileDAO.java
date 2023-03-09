package com.oti.groupware.mail.dao;

import com.oti.groupware.mail.dto.MailFile;

public interface MailFileDAO {
	public MailFile getMailFileById(int mailFileId);
    public void updateMailFile(MailFile mailsFile);
    public void deleteMailFile(int mailFileId);
	public void insertMailFile(MailFile mailFile);
}