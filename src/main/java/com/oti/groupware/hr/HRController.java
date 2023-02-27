package com.oti.groupware.hr;

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
public class HRController {
	
	/**
	 * 
	 * @return 나의근무 페이지
	 */
	@RequestMapping(value = "/attendance")
	public String attendance() {
		log.info("정보 로그");
		return "hr/attendance";
	}

	/**
	 * 출근시간 등록
	 * @return 
	 */
	@RequestMapping(value = "/intime")
	public String inTime() {
		log.info("정보 로그");

		//서비스 로직
		
		
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
