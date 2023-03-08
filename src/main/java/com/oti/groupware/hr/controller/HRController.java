package com.oti.groupware.hr.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dto.Attendance;
import com.oti.groupware.hr.dto.AttendanceException;
import com.oti.groupware.hr.dto.LeaveApplication;
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
	 * 나의 근무페이지로 이동
	 * @author 한송민
	 * @return 나의근무 페이지
	 */
	@RequestMapping(value = "/myattendance")
	public String attendance(HttpSession session, Model model) {
		log.info("정보 로그");
		//세션에 저장된 직원ID 갖고옴
		Employee employee = (Employee) session.getAttribute("employee");
		String empId = employee.getEmpId();
		
		//오늘 출퇴근 시간을 갖고옴
		Attendance attendance = hrService.attendanceToday(empId); 
		model.addAttribute("attendance", attendance);
		
		//근무통계 갖고옴
		HashMap<String, Integer> stateCount = hrService.attendanceStats(empId); 
		model.addAttribute("stateCount", stateCount);
		
		return "hr/myattendance";
	}
	
	/**
	 *  AJAX통신으로 달력의 출퇴근 목록을 갖고옴
	 * @author 한송민
	 * @return 달력 출퇴근 목록
	 */
	@GetMapping(value = "/calendar",  produces="application/json; charset=UTF-8")
	@ResponseBody
	public String attendanceCalendar(HttpSession session) {
		Employee employee = (Employee) session.getAttribute("employee");
		String empId = employee.getEmpId();
		
		JSONArray atdCalList = hrService.attendanceCalendarList(empId);
		return atdCalList.toString();
	}

	/**
	 * 출근시간 등록(출근버튼 click)
	 * @author 한송민
	 * @param nowJSP(현재 페이지 이름)
	 * @return 나의근무 페이지 or 홈페이지
	 */
	@RequestMapping(value = "/intime")
	public String inTime(String nowJsp, HttpSession session, Model model) {
		log.info("정보 로그");
		
		//출근시간을 등록함
		Employee employee = (Employee) session.getAttribute("employee");
		String empId = employee.getEmpId();
		hrService.inTime(empId);
		
		//만약 HR 페이지에서 출근을 등록했다면, HR페이지로 리다이렉트
		if(nowJsp.equals("hr")) {
			return "redirect:/hr/myattendance";
		}
		
		return "redirect:/home";
	}

	/**
	 * 퇴근시간 등록(퇴근버튼 click)
	 * @author 한송민
	 * @param nowJSP(현재 페이지 이름)
	 * @return 홈페이지 or 나의근무페이지
	 */
	@RequestMapping(value = "/outtime")
	public String outTime(String nowJsp, HttpSession session, Model model) {
		log.info("정보 로그");
		
		//퇴근시간 등록
		Employee employee = (Employee) session.getAttribute("employee");
		String empId = employee.getEmpId();
		hrService.outTime(empId);
		
		//만약 HR 페이지에서 출근을 등록했다면, HR페이지로 리다이렉트
		if(nowJsp.equals("hr")) {
			return "redirect:/hr/myattendance";
		}
		
		return "redirect:/home";
	}
	
	
	/**
	 * 나의 근무신청 페이지로 이동
	 * @author 한송민
	 * @param pageNo(시작페이지), startYear(시작월-필터링), endYear(종료월-필터링)
	 * @return 나의 근무신청 페이지
	 */
	@RequestMapping(value = "/myatdexception")
	public String myAttendanceApplication(Integer pageNo, String startDate, String endDate, HttpSession session, Model model) {
		log.info("정보 로그");
		
		Employee employee = (Employee) session.getAttribute("employee");
		String empId = employee.getEmpId();
		
		//pageNo에 값이 매핑이 안될 경우, 1을 넣어줌
		if(pageNo == null) {
			pageNo = 1;
		}

		//전체 행수 갖고옴
		int totalRows = hrService.attendanceExceptionRowsCount(startDate, endDate, empId);
		
		//페이저 객체 생성
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		
		//페이징된 목록
		List<AttendanceException> atdExcpList = hrService.attendanceExceptionList(startDate, endDate, empId, pager);
		
		if(!atdExcpList.isEmpty()) {
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("pager", pager);
			model.addAttribute("atdExcpList", atdExcpList);
		}
		
		//근무신청서 통계
		HashMap<String, Integer> atdExcpStats = hrService.attendanceExceptionStats(empId);
		model.addAttribute("atdExcpStats", atdExcpStats);
		
		return "hr/myatdexception";
	}
	
	/**
	 * AJAX 통신 - 근무신청 관련 작성폼을 띄워줌
	 * @author 한송민
	 * @param category(양식 종류)
	 * @return 근무시간수정 신청서 or 추가근무 보고서
	 */
	@RequestMapping(value = "/atdapplicationform", method=RequestMethod.GET)
	public String myAttendanceApplication(@RequestParam String category, HttpSession session, Model model) {
		log.info("정보 로그");
		
		Employee employee = (Employee) session.getAttribute("employee");
		String empId = employee.getEmpId();
		
		//작성자, 결재자 이름 가져오기
		HashMap<String, String> empFormInfo = hrService.empFormInfoMap(empId); //신청양식에 필요한 정보 갖고옴(나중에 employeeSerivce에 넣기)
		model.addAttribute("empFormInfo", empFormInfo);
		
		//오늘의 출퇴근 기록 가져오기
		Attendance attendance = hrService.attendanceToday(empId);
		model.addAttribute("attendance", attendance);
		
		if(category.equals("근무시간수정")) { //근무시간수정양식을 요청한 경우
			return "hr/updatetimeapp";
		} else { //추가근무신청양식을 요청한 경우
			return "hr/overtimeapp";
		}
	}
	
	/**
	 * (일반 임직원) 자신의 근무관련 신청서 상세내용 조회
	 * @author 한송민
	 * @param atdExcpId(근무신청서ID)
	 * @return 근무신청서(근무시간수정, 추가근무보고) 상세조회 팝업창
	 */
	@RequestMapping(value = "/popup/atdexcpapplicationdetail")
	public String attendanceExceptionApplicationDetail(int atdExcpId, Model model) {
		log.info("정보 로그");
		
		//신청서의 상세내용 가져오기
		AttendanceException atdExcp = hrService.attendanceExcptionDetail(atdExcpId);
		model.addAttribute("atdExcp", atdExcp);
		
		//유형에 따라 근무시간수정서 or 추가근무보고서 팝업을 리턴
		if(atdExcp.getAtdExcpCategory().equals("근무시간수정")) { //근무시간수정신청서일 경우
			return "hr/popup/updatetimedetail";
		} else { //추가근무보고서일 경우
			return "hr/popup/overtimedetail";
		}
	}

	/**
	 * (부서장) 부서원들의 근무결재관련 신청서 상세내용 조회 (AJAX)
	 * @author 한송민
	 * @param atdExcpId(근무신청서ID)
	 * @return 근무신청서(근무시간수정, 추가근무보고) 상세조회 팝업창
	 */
	@RequestMapping(value = "/atdexcpapprovaldetail")
	public String attendanceExceptionApprovalDetail(@RequestParam int atdExcpId, Model model) {
		log.info("정보 로그");
		//신청서의 상세내용 가져오기
		AttendanceException atdExcp = hrService.attendanceExcptionApprovalDetail(atdExcpId);
		model.addAttribute("atdExcp", atdExcp);
		
		//유형에 따라 근무시간수정서 or 추가근무보고서 팝업을 리턴
		if(atdExcp.getAtdExcpCategory().equals("근무시간수정")) { //근무시간수정신청서일 경우
			return "hr/updatetimedetail";
		} else { //추가근무보고서일 경우
			return "hr/overtimedetail";
		}
	}
	
	/**
	 * 근무신청 관련 작성폼에 작성한 내용을 등록
	 * @author 한송민
	 * @param AttendanceExcption
	 * @return redirect:/나의 근무신청 페이지
	 */
	@RequestMapping(value = "/atdapplicationform", method=RequestMethod.POST)
	public String myAttendanceApplication(AttendanceException attendanceException) {
		log.info("정보 로그");
		//작성내용 등록
		hrService.writeAttendanceExceptionApplication(attendanceException);
		return "redirect:/hr/myatdexception";
	}
	
	/**
	 * 나의 휴가 페이지로 이동
	 * @author 한송민
	 * @param pageNo
	 * @return 나의 휴가페이지
	 */
	@RequestMapping(value = "/myleave")
	public String leave(Integer pageNo, String startDate, String endDate, HttpSession session, Model model) {
		log.info("정보 로그");
		
		Employee employee = (Employee) session.getAttribute("employee"); //세션에 저장된 로그인유저 정보 가져옴
		String empId = employee.getEmpId();
		
		//pageNo에 값이 매핑이 안될 경우, 1을 넣어줌
		if(pageNo == null) {
			pageNo = 1;
		}

		//전체 행수 갖고옴
		int totalRows = hrService.leaveApplicationRowsCount(startDate, endDate, empId);
		
		//페이저 객체 생성
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		
		//페이징된 목록
		List<LeaveApplication> levAppList = hrService.leaveApplicationList(startDate, endDate, empId, pager);
		
		if(!levAppList.isEmpty()) {
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("pager", pager);
			model.addAttribute("levAppList", levAppList);
		}
		
		//근무신청서 통계
//		HashMap<String, Integer> atdExcpStats = hrService.attendanceExceptionStats(empId);
//		model.addAttribute("atdExcpStats", atdExcpStats);
		
		//잔여연차와 대체휴무일수(세션에서 가져오기)
		int leaveReserve = employee.getEmpLeaveReserve();
		int substitueReserve = employee.getEmpSubstitueReserve();
		model.addAttribute("leaveReserve", leaveReserve);
		model.addAttribute("substitueReserve", substitueReserve);
		
		//작성폼에 필요한 정보를 가져옴
		HashMap<String, String> empFormInfo = hrService.empFormInfoMap(empId); //신청양식에 필요한 정보 갖고옴(나중에 employeeSerivce에 넣기)
		model.addAttribute("empFormInfo", empFormInfo);
		
		return "hr/myleave";
	}

	/**
	 * 휴가 신청서 상세내용 조회
	 * @author 한송민
	 * @param atdExcpId(근무신청서ID)
	 * @return 휴가신청 상세조회 팝업창
	 */
	@RequestMapping(value = "/popup/leavedetail")
	public String leaveDetail(int levAppId, Model model) {
		log.info("정보 로그");
		//상세정보 가져오기
		LeaveApplication levApp = hrService.leaveApplicationDetail(levAppId);
		model.addAttribute("levApp", levApp);
		
		return "hr/popup/leavedetail";
	}
	
	/**
	 * (부서장) 부서원들의 휴가 신청서 상세내용 조회 (AJAX)
	 * @author 한송민
	 * @param levAppId(휴가신청서ID)
	 * @return 휴가신청서 상세조회 팝업창
	 */
	@RequestMapping(value = "/levappaprvdetail")
	public String LeaveApplicationApprovalDetail(@RequestParam int levAppId, Model model) {
		log.info("정보 로그");
		//신청서의 상세내용 가져오기
		LeaveApplication levApp = hrService.leaveApplicationApprovalDetail(levAppId);
		model.addAttribute("levApp", levApp);
		
		return "hr/leavedetail";
	}
	
	/**
	 * 휴가신청폼에 작성한 내용을 등록
	 * @author 한송민
	 * @param LeaveApplication
	 * @return redirect:/나의 휴가 페이지
	 */
	@RequestMapping(value = "/levapplicationform", method=RequestMethod.POST)
	public String myLeaveApplication(LeaveApplication leaveApplication) {
		log.info("정보 로그");
		hrService.writeleaveApplication(leaveApplication);
		return "redirect:/hr/myleave";
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
	 * 부서장만 볼 수 있는 HR 결재내역 페이지
	 * @author 한송민
	 * @param 
	 * @return hr 결재내역페이지
	 */
	@RequestMapping(value = "/hrapplication")
	public String hrApproval(HttpSession session, Model model) {
		log.info("정보 로그");
		//근무신청내역목록 가져오기
		hrAtdExcpApprovalList(1, null, null, session, model);
		//휴가신청내역목록 가져오기
		hrLevAppApprovalList(1, null, null, session, model);
		return "hr/hrapplication";
	}

	/**
	 * 결재내역 페이지 - 근무신청내역 목록 (AJAX)
	 * @author 한송민
	 * @param 
	 * @return 근무신청결재목록
	 */
	@RequestMapping(value = "/atdexcpaprvlist")
	public String hrAtdExcpApprovalList(int pageNo, String startDate, String endDate, HttpSession session, Model model) {
		log.info("정보 로그");
		
		Employee employee = (Employee) session.getAttribute("employee"); //세션에 저장된 로그인유저 정보 가져옴
		String empId = employee.getEmpId();
		
		//전체 행수 갖고옴
		int totalRows = hrService.attendanceExceptionApprovalRowsCount(startDate, endDate, empId);
		
		//페이저 객체 생성
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		
		//페이징된 목록
		List<AttendanceException> atdExcpList = hrService.attendanceExcptionApprovalList(startDate, endDate, empId, pager);
		
		if(!atdExcpList.isEmpty()) {
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("atdPager", pager);
			model.addAttribute("atdExcpList", atdExcpList);
		}
		
		return "hr/atdexcpaprvlist";
	}

	/**
	 * 결재내역 페이지 - 휴가신청내역 목록 (AJAX)
	 * @author 한송민
	 * @param 
	 * @return 휴가신청결재목록
	 */
	@RequestMapping(value = "/levappaprvlist")
	public String hrLevAppApprovalList(int pageNo, String startDate, String endDate, HttpSession session, Model model) {
		log.info("정보 로그");
		
		Employee employee = (Employee) session.getAttribute("employee"); //세션에 저장된 로그인유저 정보 가져옴
		String empId = employee.getEmpId();
		
		//전체 행수 갖고옴
		int totalRows = hrService.leaveApplicationApprovalRowsCount(startDate, endDate, empId);
		
		//페이저 객체 생성
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		
		//페이징된 목록
		List<AttendanceException> levAppList = hrService.leaveApplicationApprovalList(startDate, endDate, empId, pager);
		
		if(!levAppList.isEmpty()) {
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("levPager", pager);
			model.addAttribute("levAppList", levAppList);
		}
		
		return "hr/levappaprvlist";
	}
	
	/**
	 * 근무신청 승인/반려 완료 (AJAX)
	 * @author 한송민
	 * @param
	 * @return 근무신청결재 상세조회
	 */
	@RequestMapping(value = "/atdexcpaprvstatecomplete" , method=RequestMethod.POST)
	public String hrAtdExcpApprovalProcessStateComplete() {
		log.info("정보 로그");
		
		return "redirect:/hr/atdexcpaprvdetail";
	}

	/**
	 * 휴가신청 승인/반려 완려 (AJAX)
	 * @author 한송민
	 * @param
	 * @return 휴가신청결재 상세조회
	 */
	@RequestMapping(value = "/levappaprvstatecomplete")
	public String hrLevApplicationApprovalProcessComplete(@RequestParam String levAppProcessState, @RequestParam int levAppId ,Model model) {
		log.info("정보 로그");
		//leaveApplication 정보 가져오기
		LeaveApplication levApp = hrService.leaveApplicationApprovalDetail(levAppId);
		levApp.setLevAppProcessState(levAppProcessState);
		log.info("제바라ㅣ어ㅣㅁ" + levApp.toString());
		hrService.leaveApplicationApprovalProcessState(levApp);
		return LeaveApplicationApprovalDetail(levAppId, model);
	}
}
