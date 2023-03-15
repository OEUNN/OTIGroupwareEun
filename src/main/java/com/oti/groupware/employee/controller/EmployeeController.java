package com.oti.groupware.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
	
	//휴대전화 유효성 체크
	@RequestMapping(value="/phonecheck", method = RequestMethod.POST)
	@ResponseBody
	public String phoneCheck(String phoneNumber) {
		String result = employeeService.phoneCheck(phoneNumber);
		return result;
	}
	
	//이메일 유효성 체크
	@RequestMapping(value="/mailidcheck", method = RequestMethod.POST)
	@ResponseBody
	public String mailIdCheck(String mailId) {
		String result = employeeService.mailIdCheck(mailId);
		return result;
	}
	
	/**
	 * Join - 임직원 등록
	 * @param employee - DTO
	 * @param employeeDetail - DTO
	 * @param empBirthdayStr - 생년월일이 String이므로 따로 받아옴
	 * @param employmentDateStr - 입사일에 대한 String
	 * @return 성공시 redirect를 통해 인사관리의 메인인 select 페이지로 이동한다.
	 */
	@PostMapping(value = "/insertemployee")
	public String insertEmployee(Employee employee, EmployeeDetail employeeDetail) throws IOException{
		//파일 데이터
		MultipartFile employeeFile = employee.getEmpFileDataMulti();
		if(!employeeFile.isEmpty()) {
			String attachsname = new Date().getTime() +"-"+employee.getEmpId();
			employee.setEmpFileData(employeeFile.getBytes());
			employee.setEmpFileName(attachsname);
			//파일의 타입 설정
			employee.setEmpFileType(employeeFile.getContentType());
			//서버 파일 시스템에 파일로 저장
			File file = new File("C:/Temp/uploadFiles/"+attachsname);
			employeeFile.transferTo(file);
		}
		//insert를 위한 service
		employeeService.insertEmployee(employee, employeeDetail);
		return "redirect:/employee/selectemployee";
	}
	
	
	// 임직원 등록
	@GetMapping(value = "/insertemployee")
	public String insertEmployee() {
		return "employee/insertemployee";
	}
	
	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		Employee employee = (Employee)session.getAttribute("employee");
		employee = employeeService.getEmployee(employee.getEmpId());
		if(employee!=null) {
			Date now = new Date(System.currentTimeMillis());
			EmployeeDetail employeeDetail = employeeService.getEmployeeDetail(employee.getEmpId(), now);
			model.addAttribute("subEmployee", employee);
			model.addAttribute("employeeDetail", employeeDetail);
		}
		return "employee/mypage";
	}
	
	@RequestMapping(value = "/updateimg", method = RequestMethod.POST)
	@ResponseBody
	public void updateImg(HttpSession session, MultipartFile multi) throws IOException {
		Employee employee =(Employee)session.getAttribute("employee");
		MultipartFile imgFile = multi;
		if(!imgFile.isEmpty()) {
			String attachsname = new Date().getTime() +"-"+employee.getEmpId();
			employee.setEmpFileData(imgFile.getBytes());
			employee.setEmpFileName(attachsname);
			//파일의 타입 설정
			employee.setEmpFileType(imgFile.getContentType());
			//서버 파일 시스템에 파일로 저장
			File file = new File("C:/Temp/uploadFiles/"+attachsname);
			imgFile.transferTo(file);
		}
		employeeService.updateImg(employee);
	}
	
	@RequestMapping(value = "/password", method = RequestMethod.POST)
	@ResponseBody
	public void updatePassword(HttpSession session, String password) {
		log.info("실행");
		log.info(password);
		Employee employee =(Employee)session.getAttribute("employee");
		String empId = employee.getEmpId();
		if(password != null) {
			employeeService.updatePassword(empId, password);
		}
	}

	//임직원 조회
	@RequestMapping(value = "/selectemployee", method = RequestMethod.GET)
	public String selectEmployee(Model model) {
		log.info("실행");
		//전체 행수 갖고옴
		int totalRows = employeeService.employeeRowsCount();
		//페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		List<Employee> empList = employeeService.getEmployees(pager);
		if(empList != null) {
			Employee emp = employeeService.ceoInformation();
			EmployeeDetail empDetail = employeeService.detailEmployee(emp.getEmpId());
			model.addAttribute("empList", empList);
			model.addAttribute("pager", pager);
			model.addAttribute("emp", emp);
			model.addAttribute("empDetail", empDetail);
		}
		return "employee/selectemployee";
	}
	
	//임직원조회 디테일
	@RequestMapping(value = "/employeepager", method = RequestMethod.POST)
	public String employeePager(int page, Model model) {
		log.info("실행");
		//전체 행수 갖고옴
		int totalRows = employeeService.employeeRowsCount();
		//페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, page);
		List<Employee> empList = employeeService.getEmployees(pager);
		if(empList != null) {
			Employee emp = employeeService.ceoInformation();
			model.addAttribute("empList", empList);
			model.addAttribute("pager", pager);
			model.addAttribute("emp", emp);
		}
		return "employee/selectemployeeinfo";
	}
	
	@RequestMapping(value = "/selectemployee", method = RequestMethod.POST)
	public String selectEmployee(String empId, Model model) {
		log.info("실행");
		Employee emp = employeeService.getEmployee(empId);
		EmployeeDetail empDetail = employeeService.detailEmployee(empId);
		model.addAttribute("emp", emp);
		model.addAttribute("empDetail", empDetail);
		return "employee/detailemployee";
	}
	
	// 비밀번호 초기화popup
	@RequestMapping(value = "/resetpasswordpopup", method = RequestMethod.GET)
	public String resetPasswordPopup() {
		return "employee/resetpasswordpopup";
	}
		
	// 비밀번호 초기화popup
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	@ResponseBody
	public void resetPasswordPopup(String empId) {
		employeeService.resetPassword(empId);
	}
	
	// 임직원
	@RequestMapping(value = "/updateemployee/{empId}", method = RequestMethod.GET)
	public String updateEmployee(@PathVariable String empId) {
		return "employee/updateemployee";
	}


	// 조직도
	@RequestMapping(value = "/organizationchart", method = RequestMethod.GET)
	public String organizationChart() {
		return "employee/organizationchart";
	}
	
	// 조직도에서 각 부서에 해당하는 임직원 정보 목록 조각
	@RequestMapping(value = "/searchdepartment", method = RequestMethod.GET)
	public String searchDepartment(@RequestParam int depId, Model model) {
		log.info("실행");
		
		//임직원 이름, 부서이름 등의 정보가 담긴 목록을 가져옴
		List<Employee>  orgEmpList = employeeService.getOrganizationEmpList(depId);
		model.addAttribute("orgEmpList", orgEmpList);
		model.addAttribute("depId", depId);
		
		return "employee/organizationemplist";
	}
	
	//직원정보 디테일 popup
	@RequestMapping(value = "/detailpopup/{empId}", method = RequestMethod.GET)
	public String detailPopup(@PathVariable String empId, Model model) {
		Employee employee = employeeService.getEmployee(empId);
		model.addAttribute("emp", employee);
		return "employee/detailpopup";
	}
	
	//이미지
	@GetMapping("/file/{empId}")
	public ResponseEntity<byte[]> file(@PathVariable String empId) throws Exception {
		Employee employee = employeeService.getEmployee(empId);
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = employee.getEmpFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0],mtypes[1]));
		headers.setContentDispositionFormData("attachment",new String(employee.getEmpFileName().getBytes("UTF-8"), "ISO-8859-1") );
		return new ResponseEntity<byte[]>(employee.getEmpFileData(), headers, HttpStatus.OK);
	}	
	
	//접근권한 페이지
	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String errorEmployee() {
		return "employee/error";
	}
}
