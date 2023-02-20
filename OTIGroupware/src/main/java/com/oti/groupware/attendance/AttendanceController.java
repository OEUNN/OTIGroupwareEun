package com.oti.groupware.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oti.groupware.approval.ApprovalController;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping(value="/hr")
public class AttendanceController {
	
	@RequestMapping(value = "/attendance")
	public String main() {
		log.info("정보 로그");
		return "hr/attendance";
	}

}
