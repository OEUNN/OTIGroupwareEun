package com.oti.groupware.mail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.oti.groupware.mail.service.MailService;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class MailScheduler {
	
	@Autowired
	private MailService mailService;

	// 24시 일때 학생 status추가
	@Scheduled(cron = "0 59 23 * * *")
	public void trashMailDelete() {
		mailService.deleteTrashMail();
//		select send_mail_id
//		from send_mails
//		where SEND_MAIL_DEL_YN ='Y' and 30 <
//		        (select TRUNC(SYSDATE) - TRUNC(SEND_MAIL_DATE)
//		        from send_mails) 
		
	}
}
