package com.oti.groupware.hr.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oti.groupware.hr.dto.Attendance;
import com.oti.groupware.hr.service.HrService;

import lombok.extern.log4j.Log4j2;

/**
 * 
 * @author 한송민
 *
 */
@Controller
@Log4j2
@RequestMapping(value="/hr")
public class HRController {
	
	@Autowired
	private HrService hrService;
	
	/**
	 * 
	 * @return 나의근무 페이지
	 */
	@RequestMapping(value = "/attendance")
	public String attendance(HttpSession session, Model model) {
		log.info("정보 로그");
		
		//출퇴근 시간 갖고오기
		
		//달력기록 갖고오기
		
		return "hr/attendance";
	}

	/**
	 * 출근시간 등록(출근버튼 click)
	 * @return 
	 */
	@RequestMapping(value = "/intime")
	public String inTime(HttpSession session, Model model) {
		log.info("정보 로그");
//		String empId = (String) session.getAttribute("empId");
		String empId = "202302271";
		
		//오늘 출근여부 체킹
		int result = hrService.attendanceToday(empId);
		
		//오늘의 출근시간 기록이 없을 경우, 출근시간을 등록함
		if(result==0) {
			hrService.inTime(empId);
		}
		
		return "hr/attendance";
	}

	/**
	 * 퇴근시간 등록(퇴근버튼 click)
	 * @return 
	 */
	@RequestMapping(value = "/outtime")
	public String outTime(HttpSession session, Model model) {
		log.info("정보 로그");
		
//		String empId = (String) session.getAttribute("empId");
		String empId = "202302271";
		
		//오늘 출근여부 체킹
		int result = hrService.attendanceToday(empId);
		
		//오늘의 출근시간 기록이 있을 경우, 기존 출근시간 Row에 퇴근시간을 등록해줌
		if(result==1) {
			hrService.outTime(empId);
		}
		
		return "hr/attendance";
	}
	
	/**
	 * 
	 * @return 근무시간수정신청서 작성 팝업창
	 */
	@RequestMapping(value = "/popup/updatetimeapp")
	public String writeUpdateTime() {
		log.info("정보 로그");
		return "hr/popup/updatetimeapp";
	}

	/**
	 * 
	 * @return 추가근무보고서 작성 팝업창
	 */
	@RequestMapping(value = "/popup/overtimeapp")
	public String writeOverTime() {
		log.info("정보 로그");
		return "hr/popup/overtimeapp";
	}
	
	/**
	 * 
	 * @return 근무신청서 상세조회 팝업창
	 */
	@RequestMapping(value = "/popup/updatetimedetail")
	public String updateTimeDetail() {
		log.info("정보 로그");
		return "hr/popup/updatetimedetail";
	}

	/**
	 * 
	 * @return 추가근무보고서 상세조회 팝업창
	 */
	@RequestMapping(value = "/popup/overtimedetail")
	public String overTimeDetail() {
		log.info("정보 로그");
		return "hr/popup/overtimedetail";
	}
	
	/**
	 * 
	 * @return 나의 휴가페이지
	 */
	@RequestMapping(value = "/leave")
	public String leave() {
		log.info("정보 로그");
		return "hr/leave";
	}

	/**
	 * 
	 * @return 휴가신청 상세조회 팝업창
	 */
	@RequestMapping(value = "/popup/leavedetail")
	public String leaveDetail() {
		log.info("정보 로그");
		return "hr/popup/leavedetail";
	}

	/**
	 * 
	 * @return 부서 휴가페이지
	 */
	@RequestMapping(value = "/empleave")
	public String empLeave() {
		log.info("정보 로그");
		return "hr/empleave";
	}
	
	/**
	 * 
	 * @return hr 결재내역페이지
	 */
	@RequestMapping(value = "/hrapplication")
	public String hrApproval() {
		log.info("정보 로그");
		return "hr/hrapplication";
	}
	
	/**
	 * 
	 * @return 근무시간수정신청서 결재 팝업창
	 */
	@RequestMapping(value = "/popup/updatetimeaprv")
	public String updateTimeApproval() {
		log.info("정보 로그");
		return "hr/popup/updatetimeaprv";
	}

	/**
	 * 
	 * @return 추가근무보고서 결재 팝업창
	 */
	@RequestMapping(value = "/popup/overtimeaprv")
	public String overTimeApproval() {
		log.info("정보 로그");
		return "hr/popup/overtimeaprv";
	}
	
	/**
	 * 
	 * @return 추가근무보고서 결재 팝업창
	 */
	@RequestMapping(value = "/popup/leaveaprv")
	public String leaveApproval() {
		log.info("정보 로그");
		return "hr/popup/leaveaprv";
	}
	

}
