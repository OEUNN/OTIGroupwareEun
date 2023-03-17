package com.oti.groupware.mail.controller;

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

	/**
	 * 30일이 지난 휴지통 완전 삭제로 상태 변경
	 * 매일 23시 59분에 실행
	 */
	@Scheduled(cron = "0 59 23 * * *")
	public void trashMailDelete() {
		mailService.deleteTrashMail();
	}
	
	/**
	 * 메일 ID가 모두 완전 삭제가 되면 해당 메일 ID 삭제
	 * 매달 1일 00시에 실행
	 */
	@Scheduled(cron = "0 0 0 1 * *")
	public void completeDelete() {
		mailService.completeDelete();
	}
}
