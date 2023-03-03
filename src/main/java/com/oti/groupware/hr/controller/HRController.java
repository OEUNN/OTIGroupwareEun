package com.oti.groupware.hr.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value = "/myattendance")
	public String attendance(HttpSession session, Model model) {
		log.info("정보 로그");
		//세션에 저장된 직원ID 갖고옴
//		String empId = (String) session.getAttribute("empId");
		String empId = "202302271";
		
		//오늘 출퇴근 시간을 갖고옴
		Attendance attendance = hrService.attendanceToday(empId); 
		model.addAttribute("attendance", attendance);
		
		//근무통계 갖고옴
		HashMap<String, Object> stateCount = hrService.attendanceState(empId); 
		model.addAttribute("stateCount", stateCount);
		
		return "hr/myattendance";
	}
	
	/**
	 *  AJAX통신으로 달력의 출퇴근 목록을 갖고옴
	 * @return 달력 출퇴근 목록
	 */
	@GetMapping(value = "/calendar",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public String attendanceCalendar() {
//		String empId = (String) session.getAttribute("empId");
		String empId = "202302271";
		JSONArray atdCalList = hrService.attendanceCalendarList(empId);
		return atdCalList.toString();
	}

	/**
	 * 출근시간 등록(출근버튼 click)
	 * @return 
	 */
	@RequestMapping(value = "/intime")
	public String inTime(String nowJsp, HttpSession session, Model model) {
		log.info("정보 로그");
		
		//출근시간을 등록함
//		String empId = (String) session.getAttribute("empId"); //세션에 저장된 임직원ID를 갖고옴
		String empId = "202302271"; //임시방편
		hrService.inTime(empId);
		
		//만약 HR 페이지에서 출근을 등록했다면, HR페이지로 리다이렉트
		if(nowJsp.equals("hr")) {
			return "redirect:/hr/myattendance";
		}
		
		return "redirect:/home";
	}

	/**
	 * 퇴근시간 등록(퇴근버튼 click)
	 * @return 
	 */
	@RequestMapping(value = "/outtime")
	public String outTime(String nowJsp, HttpSession session, Model model) {
		log.info("정보 로그");
		
		//퇴근시간 등록
//		String empId = (String) session.getAttribute("empId");
		String empId = "202302271";
		hrService.outTime(empId);
		
		//만약 HR 페이지에서 출근을 등록했다면, HR페이지로 리다이렉트
		if(nowJsp.equals("hr")) {
			return "redirect:/hr/myattendance";
		}
		
		return "redirect:/home";
	}
	
	
	/**
	 * 
	 * @return 나의 근무신청 페이지
	 */
	@RequestMapping(value = "/myatdapplication")
	public String myAttendanceApplication() {
		log.info("정보 로그");
		return "hr/myatdapplication";
	}
	
	/**
	 * @param category
	 * @return 근무신청 관련 작성폼(AJAX)
	 */
	@RequestMapping(value = "/applicatonform", method=RequestMethod.GET)
	public String myAttendanceApplication(@RequestParam String category, Model model) {
		log.info("정보 로그");
		
		if(category.equals("근무시간수정")) { //근무시간수정양식을 요청한 경우
			//작성자, 결재자 이름 갖고오기(나중에 employeeSerivce에 넣기)
//			String empId = (String) session.getAttribute("empId");
			String empId = "202302271";
			HashMap<String, String> empNames = hrService.empNamesMap(empId); //작성자이름과 결재자이름을 가져옴
		
			model.addAttribute("empNames", empNames);
			return "hr/updatetimeapp";
			
		} else { //추가근무신청양식을 요청한 경우
			return "hr/overtimeapp";
		}
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
	@RequestMapping(value = "/myleave")
	public String leave() {
		log.info("정보 로그");
		return "hr/myleave";
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
