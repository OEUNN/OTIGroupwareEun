package com.oti.groupware.hr.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.oti.groupware.hr.service.HrService;

import lombok.extern.log4j.Log4j2;

/**
 * 근태 스케줄러
 * @author 한송민
 *
 */
@Component
@Log4j2
public class AttendanceScheduler {
	@Autowired
	private HrService hrService;
	
	/**
	 * 매일 새벽6시에 자동으로 근무상태롤 지정해주는 스케줄러
	 */
	@Scheduled(cron = "0 0 6 * * ?")
	public void updateAttendanceStatus() {
		log.info("근태-스케줄러 실행!"); 
		hrService.attendanceStateAll();
	}
}
