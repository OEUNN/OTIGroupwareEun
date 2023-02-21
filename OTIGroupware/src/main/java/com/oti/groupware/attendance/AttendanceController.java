package com.oti.groupware.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oti.groupware.approval.ApprovalController;

import lombok.extern.log4j.Log4j2;

/**
 * 
 * @author 한송민
 *
 */
@Controller
@Log4j2
@RequestMapping(value="/hr")
public class AttendanceController {
	
	/**
	 * 
	 * @return 나의근무 페이지
	 */
	@RequestMapping(value = "/attendance")
	public String main() {
		log.info("정보 로그");
		return "hr/attendance";
	}
	
	/**
	 * 
	 * @return 근무시간수정 팝업창
	 */
	@RequestMapping(value = "/popup/updatetime")
	public String updateTimePopup() {
		log.info("정보 로그");
		return "hr/updatetimepopup";
	}

}
