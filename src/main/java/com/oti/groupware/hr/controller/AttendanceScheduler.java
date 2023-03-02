package com.oti.groupware.hr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.oti.groupware.hr.service.HrService;

/**
 * 
 * @author 한송민
 *
 */
@Component
public class AttendanceScheduler {
	@Autowired
	private HrService hrService;
	
	/**
	 * 매일 새벽6시에 자동으로 근무상태롤 지정해주는 스케줄러
	 */
	@Scheduled(cron = "0 0 6 * * ?")
	public void updateAttendanceStatus() {
		 hrService.attendanceStateAll();
	}
}
