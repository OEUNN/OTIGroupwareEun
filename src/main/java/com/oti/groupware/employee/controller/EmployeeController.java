package com.oti.groupware.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.employee.dto.EmployeeDetail;
import com.oti.groupware.employee.service.EmployeeService;
import com.oti.groupware.interceptor.Authorization;

import lombok.extern.log4j.Log4j2;

/**
 * 
 * @author 장영은
 *
 */
@Controller
@Log4j2
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	/**
	 * 휴대전화 유효성 체크(join) - 경영지원부
	 * @param phoneNumber
	 * @return
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/phonecheck", method = RequestMethod.POST)
	@ResponseBody
	public String phoneCheck(String phoneNumber) {
		String result = employeeService.phoneCheck(phoneNumber);
		return result;
	}

	/**
	 * 메일 유효성 체크(join) - 경영지원부
	 * @param mailId
	 * @return
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/mailidcheck", method = RequestMethod.POST)
	@ResponseBody
	public String mailIdCheck(String mailId) {
		String result = employeeService.mailIdCheck(mailId);
		return result;
	}

	/**
	 * 임직원등록(join) - 경영지원부
	 * @param employee          - DTO
	 * @param employeeDetail    - DTO
	 * @return 성공시 redirect를 통해 인사관리의 메인인 select 페이지로 이동한다.
	 */
	@Authorization("ROLE_HR")
	@PostMapping(value = "/insertemployee")
	public String insertEmployee(Employee employee, EmployeeDetail employeeDetail) throws IOException {
		MultipartFile employeeFile = employee.getEmpFileDataMulti();
		if (!employeeFile.isEmpty()) {
			String attachsname = new Date().getTime() + "-" + employee.getEmpId();
			employee.setEmpFileData(employeeFile.getBytes());
			employee.setEmpFileName(attachsname);
			employee.setEmpFileType(employeeFile.getContentType());
			File file = new File("C:/Temp/uploadFiles/" + attachsname);
			employeeFile.transferTo(file);
		}
		employeeService.insertEmployee(employee, employeeDetail);
		return "redirect:/employee/selectemployee";
	}

	/**
	 * 임직원 등록(employee join) - 경영지원부
	 * @return JSP
	 */
	@Authorization("ROLE_HR")
	@GetMapping(value = "/insertemployee")
	public String insertEmployee() {
		return "employee/insertemployee";
	}


	/**
	 * 임직원 조회 - 경영지원부
	 * @param model - empList(모든 직원), pager, emp(정렬순 첮번째 사람의 간략한 정보), empDetail(자세한 정보)
	 * @return JSP
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/selectemployee", method = RequestMethod.GET)
	public String selectEmployee(Model model) {
		log.info("실행");
		// 전체 행수 갖고옴
		int totalRows = employeeService.employeeRowsCount();
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		List<Employee> empList = employeeService.getEmployees(pager);
		if (empList != null) {
			Employee emp = employeeService.ceoInformation();
			EmployeeDetail empDetail = employeeService.detailEmployee(emp.getEmpId());
			model.addAttribute("empList", empList);
			model.addAttribute("pager", pager);
			model.addAttribute("emp", emp);
			model.addAttribute("empDetail", empDetail);
		}
		return "employee/selectemployee";
	}

	/**
	 * pager에 따른 직원 리스트 - 경영지원부
	 * @param page
	 * @param model - empList(해당 페이지의 직원 list), pager, emp(정렬된 모든 직원의 정보)
	 * @return JSP 조각
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/employeepager", method = RequestMethod.POST)
	public String employeePager(int page, Model model) {
		log.info("실행");
		int totalRows = employeeService.employeeRowsCount();
		Pager pager = new Pager(10, 5, totalRows, page);
		List<Employee> empList = employeeService.getEmployees(pager);
		if (empList != null) {
			Employee emp = employeeService.ceoInformation();
			model.addAttribute("empList", empList);
			model.addAttribute("pager", pager);
			model.addAttribute("emp", emp);
		}
		return "employee/selectemployeeinfo";
	}

	/**
	 * 요청한 직원의 상세정보 - 경영지원부
	 * @param empId - 요청한 직원의 id
	 * @param model - emp(간략한 정보), empDetail(자세한 정보)
	 * @return JSP 조각
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/selectemployee", method = RequestMethod.POST)
	public String selectEmployee(String empId, Model model) {
		Employee emp = employeeService.getEmployee(empId);
		EmployeeDetail empDetail = employeeService.detailEmployee(empId);
		model.addAttribute("emp", emp);
		model.addAttribute("empDetail", empDetail);
		return "employee/detailemployee";
	}

	/**
	 * 비밀번호 초기화시 팝업 창 - 경영지원부
	 * @return JSP
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/resetpasswordpopup/{empId}", method = RequestMethod.GET)
	public String resetPasswordPopup(@PathVariable String empId, Model model) {
		model.addAttribute("empId", empId);
		return "employee/resetpasswordpopup";
	}

	/**
	 * 비밀번호 초기화 - 경영지원부
	 * @param empId - 요청한 직원의 id
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	@ResponseBody
	public void resetPasswor(String empId) {
		employeeService.resetPassword(empId);
	}

	/**
	 * 수정(update) - 경영지원부
	 * @param empId
	 * @return JSP
	 */
	@Authorization("ROLE_HR")
	@RequestMapping(value = "/updateemployee/{empId}", method = RequestMethod.GET)
	public String updateEmployee(@PathVariable String empId) {
		return "employee/updateemployee";
	}

	/**
	 * 마이페이지
	 * @param session - 로그인 되어 있는 정보
	 * @param model   - employee(단락정보), employeeDetail(자세한 정보)
	 * @return JSP
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		Employee employee = (Employee) session.getAttribute("employee");
		employee = employeeService.getEmployee(employee.getEmpId());
		if (employee != null) {
			Date now = new Date(System.currentTimeMillis());
			EmployeeDetail employeeDetail = employeeService.getEmployeeDetail(employee.getEmpId(), now);
			model.addAttribute("subEmployee", employee);
			model.addAttribute("employeeDetail", employeeDetail);
		}
		return "employee/mypage";
	}
	
	/**
	 * 마이페이지의 이미지 변경
	 * @param session - 로그인 되어 있는 정보
	 * @param multi   - 변경할 이미지
	 * @throws IOException
	 */
	@RequestMapping(value = "/updateimg", method = RequestMethod.POST)
	@ResponseBody
	public void updateImg(HttpSession session, MultipartFile multi) throws IOException {
		Employee employee = (Employee) session.getAttribute("employee");
		MultipartFile imgFile = multi;
		if (!imgFile.isEmpty()) {
			String attachsname = new Date().getTime() + "-" + employee.getEmpId();
			employee.setEmpFileData(imgFile.getBytes());
			employee.setEmpFileName(attachsname);
			employee.setEmpFileType(imgFile.getContentType());
			File file = new File("C:/Temp/uploadFiles/" + attachsname);
			imgFile.transferTo(file);
		}
		employeeService.updateImg(employee);
	}

	/**
	 * 마이페이지 비밀번호 수정
	 * @param session  - 로그인 되어 있는 정보
	 * @param password - 변경할 비밀번호
	 */
	@RequestMapping(value = "/password", method = RequestMethod.POST)
	@ResponseBody
	public void updatePassword(HttpSession session, String password) {
		Employee employee = (Employee) session.getAttribute("employee");
		String empId = employee.getEmpId();
		if (password != null) {
			employeeService.updatePassword(empId, password);
		}
	}

	/**
	 * 마이페이지에서 비밀번호 수정시 나오는 팝업창
	 * @return JSP
	 */
	@RequestMapping(value = "/passwordpopup", method = RequestMethod.GET)
	public String passwordPopup() {
		return "employee/passwordpopup";
	}

	/**
	 * 조직도
	 * @return JSP
	 */
	@RequestMapping(value = "/organizationchart", method = RequestMethod.GET)
	public String organizationChart() {
		return "employee/organizationchart";
	}

	/**
	 * 조직도에서 각 부서에 해당하는 임직원 정보 목록 조각
	 * @param depId - 요청 부서 id
	 * @param model - orgEmpList(해당부서의 직원 정보)
	 * @return JSP 조각
	 */
	@RequestMapping(value = "/searchdepartment", method = RequestMethod.GET)
	public String searchDepartment(@RequestParam int depId, Model model) {
		log.info("실행");
		List<Employee> orgEmpList = employeeService.getOrganizationEmpList(depId);
		model.addAttribute("orgEmpList", orgEmpList);
		model.addAttribute("depId", depId);
		return "employee/organizationemplist";
	}

	/**
	 * 조직도에 해당 직원의 detail 정보
	 * @param empId - 요청한 직원 id
	 * @param model - employee(직원정보)
	 * @return
	 */
	@RequestMapping(value = "/detailpopup/{empId}", method = RequestMethod.GET)
	public String detailPopup(@PathVariable String empId, Model model) {
		Employee employee = employeeService.getEmployee(empId);
		model.addAttribute("emp", employee);
		return "employee/detailpopup";
	}

	/**
	 * 조직도에서 보여지는 사진
	 * @param empId - 요청한 직원 id
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/file/{empId}")
	public ResponseEntity<byte[]> file(@PathVariable String empId) throws Exception {
		Employee employee = employeeService.getEmployee(empId);
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = employee.getEmpFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentDispositionFormData("attachment",
				new String(employee.getEmpFileName().getBytes("UTF-8"), "ISO-8859-1"));
		return new ResponseEntity<byte[]>(employee.getEmpFileData(), headers, HttpStatus.OK);
	}

}
