package com.oti.groupware.hr.service;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dao.AttendanceDAO;
import com.oti.groupware.hr.dao.AttendanceExceptionDAO;
import com.oti.groupware.hr.dao.LeaveApplicationDAO;
import com.oti.groupware.hr.dto.Attendance;
import com.oti.groupware.hr.dto.AttendanceException;
import com.oti.groupware.hr.dto.LeaveApplication;

import lombok.extern.log4j.Log4j2;

/**
 * 
 * @author 한송민
 *
 */
@Service
@Log4j2
public class HrServiceImpl implements HrService {
	
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	@Autowired
	private AttendanceExceptionDAO attendanceExceptionDAO;
	
	@Autowired
	private LeaveApplicationDAO leaveApplicationDAO;
	
	/** 오늘의 출퇴근 기록 가져오기 **/
	@Override
	public Attendance attendanceToday(String empId) {
		return attendanceDAO.getAttendanceToday(empId);
	}
	
	/** 나의 근무 통계 가져오기 **/
	@Override
	public HashMap<String, Integer> attendanceStats(String empId) {
		return attendanceDAO.getAttendanceStats(empId);
	}
	
	/** 나의근무 - 달력 - 출퇴근 기록 이벤트 가져오기 **/
	@Override
	public JSONArray attendanceCalendarList(String empId) {
		//근무현황목록을 갖고옴
		List<Attendance> atdList = attendanceDAO.getAttendanceList(empId);
		
		//날짜와 시간 포맷 변경
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//캘린더에 넣을 출퇴근 JSON을 JSON 배열에 넣기
		JSONArray jsonArr = new JSONArray();
		
		for(Attendance atd : atdList) {
			JSONObject  jsonObj = new JSONObject();
			//과거 근무목록
			if(atd.getAtdState() != null && !atd.getAtdState().contains("반차")) {
				if(atd.getAtdState().equals("정상출근")) { //정상출근한 경우
					//출근
					jsonObj.put("title", "출근");
					jsonObj.put("start", formatDate.format(atd.getAtdInTime()));
					jsonArr.put(jsonObj);
					//퇴근
					jsonObj = new JSONObject();
					jsonObj.put("title", "퇴근");
					jsonObj.put("start", formatDate.format(atd.getAtdOutTime()));
				
				} else if(atd.getAtdState().equals("결근")) { //무단결근한 경우
					jsonObj.put("title", "결근");
					jsonObj.put("start",  formatDate.format(atd.getAtdInTime()));
					
				} else if(atd.getAtdState().equals("연차") || atd.getAtdState().equals("대체휴무")) { //연차이거나 대체휴무인 경우
					jsonObj.put("title", "휴가");
					jsonObj.put("start",  formatDate.format(atd.getAtdInTime()));
					
				} else if(atd.getAtdState().equals("추가근무")) { //추가근무인 경우
					//출근
					jsonObj.put("title", "출근");
					jsonObj.put("start", formatDate.format(atd.getAtdInTime()));
					jsonArr.put(jsonObj);
					//추가근무
					jsonObj = new JSONObject();
					jsonObj.put("title", "추가근무");
					jsonObj.put("start", formatDate.format(atd.getAtdOutTime()));
				}
				jsonArr.put(jsonObj);
				
			} else if(atd.getAtdState() != null && atd.getAtdState().contains("반차")) {
				//오전반차인 경우
				if(atd.getAtdState().equals("오전반차")) {
					jsonObj.put("title", atd.getAtdState());
					jsonObj.put("start",  formatDate.format(atd.getAtdInTime()));
					jsonArr.put(jsonObj);
					//퇴근 시간만 보내기
					if(atd.getAtdOutTime() != null) {
						jsonObj = new JSONObject();
						jsonObj.put("title", "퇴근");
						jsonObj.put("start", formatDate.format(atd.getAtdOutTime()));
						jsonArr.put(jsonObj);
					}
				//오후반차인 경우
				} else if(atd.getAtdState().equals("오후반차")) {
					jsonObj.put("title", atd.getAtdState());
					jsonObj.put("start",  formatDate.format(atd.getAtdOutTime()));
					jsonArr.put(jsonObj);
					//출근시간만 보내기
					if(atd.getAtdInTime() != null) {
						jsonObj = new JSONObject();
						jsonObj.put("title", "출근");
						jsonObj.put("start", formatDate.format(atd.getAtdInTime()));
						jsonArr.put(jsonObj);
					}
				}
				
			//오늘 근무목록 or 과거에 지각/조퇴한경우
			} else if(atd.getAtdState() == null && atd.getAtdInTime() != null) {
				//출근
				jsonObj.put("title", "출근");
				jsonObj.put("start", formatDate.format(atd.getAtdInTime()));
				jsonArr.put(jsonObj);
				if(atd.getAtdOutTime() != null) {
					jsonObj = new JSONObject();
					jsonObj.put("title", "퇴근");
					jsonObj.put("start", formatDate.format(atd.getAtdOutTime()));
					jsonArr.put(jsonObj);
				}
			}
		}
		return jsonArr;
	}

	/** 출근시간 등록 **/
	@Override
	public void inTime(String empId) {
		attendanceDAO.insertAttendance(empId);
	}
	
	/** 퇴근시간 등록 **/
	@Override
	public void outTime(String empId) {
		attendanceDAO.updateAttendance(empId);
	}
	
	/** 일정시간이 되면 모든 임직원의 근무상태를 자동지정해주는 스케줄러 **/
	@Override
	public void attendanceStateAll() {
		//모든 임직원ID 갖고오기(나중에 EmployeeService에서 로직 갖고오기)
		List<Employee> empList = attendanceDAO.getEmployeeList();
		
		for(Employee emp : empList) {
			//근무상태가 null인 근무목록을 갖고온다(스케줄러에 의해 null인 경우는 당일(오늘)인 경우 밖에 없다)
			List<Attendance> atdNullList = attendanceDAO.getAttendanceNullList(emp.getEmpId());
			
			if( atdNullList != null) {
				for(Attendance attendance : atdNullList) {
					//오늘 출퇴근했을 경우
					if(attendance.getAtdInTime() != null && attendance.getAtdOutTime() != null) {  
						//시간포맷 변환
						SimpleDateFormat formatTime = new SimpleDateFormat("HH");
						int inTimeHour = Integer.parseInt(formatTime.format(attendance.getAtdInTime())); //출석 시간
						int outTimeHour = Integer.parseInt( formatTime.format(attendance.getAtdOutTime())); //퇴근시간
						
						if(inTimeHour<9 && outTimeHour>=18) { //지각과 조퇴가 아닌경우
							attendance.setAtdState("정상출근");
							attendanceDAO.updateAttendanceState(attendance);
						}
						
					//오늘 출근하지 않았을 경우	
					} else if(attendance.getAtdInTime() == null) {
						attendance.setAtdState("결근");
						attendanceDAO.updateAttendanceState(attendance);
					}
				}
			}
		}
	}

	/** 나의 근무신청내역 통계 **/
	@Override
	public HashMap<String, Integer> attendanceExceptionStats(String empId) {
		return attendanceExceptionDAO.getAttendanceExceptionStats(empId);
	}
	
	/** 나의 근무신청내역 목록의 전체 행의 수 가져오기 **/
	@Override
	public int attendanceExceptionRowsCount(String startDate, String endDate, String empId) {
		return attendanceExceptionDAO.getAttendanceExceptionRowsCount(startDate, endDate, empId);
	}
	
	/** 나의 근무신청내역 페이징 목록 가져오기 **/
	@Override
	public List<AttendanceException> attendanceExceptionList(String startDate, String endDate, String empId, Pager pager) {
		return attendanceExceptionDAO.getAttendanceExceptionList(startDate, endDate, empId, pager);
	}
	
	/** 나의 근무신청내역 상세내용 가져오기 **/
	@Override
	public AttendanceException attendanceExceptionDetail(int atdExcpId) {
		return attendanceExceptionDAO.getAttendanceExceptionDetail(atdExcpId);
	}
	
	/** 나의 근무신청폼 등록하기 **/
	@Override
	public void writeAttendanceExceptionApplication(AttendanceException attendanceException) {
		//오늘의 출퇴근 기록 가져오기
		Attendance atd = attendanceDAO.getAttendanceToday(attendanceException.getEmpId());
		//출근시간 저장
		attendanceException.setAtdOriginInTime(atd.getAtdInTime());
		//퇴근시간 있을 경우에만 퇴근시간 넣기
		if(atd.getAtdOutTime() != null) { attendanceException.setAtdOriginOutTime(atd.getAtdOutTime()); }
		attendanceExceptionDAO.insertAttendanceException(attendanceException);
	}
	
	
	/** 나의 휴가내역 목록의 전체 행의 수 가져오기 **/
	@Override
	public int leaveApplicationRowsCount(String startDate, String endDate, String empId) {
		return leaveApplicationDAO.getLeaveApplicationRowsCount(startDate, endDate, empId);
	}
	
	/** 나의 휴가내역  페이징 목록 가져오기 **/
	@Override
	public List<LeaveApplication> leaveApplicationList(String startDate, String endDate, String empId, Pager pager) {
		return leaveApplicationDAO.getLeaveApplicationList(startDate, endDate, empId, pager);
	}
	
	/** 나의 휴가내역  상세내용 가져오기 **/
	@Override
	public LeaveApplication leaveApplicationDetail(int levAppId) {
		return leaveApplicationDAO.getLeaveApplicationDetail(levAppId);
	}

	/** 나의 휴가신청폼 등록하기 **/
	@Override
	public void writeleaveApplication(LeaveApplication leaveApplication) {
		//휴가신청테이블에 데이터 추가
		leaveApplicationDAO.insertLeaveApplication(leaveApplication);
	}
	
	/** (부서장) 근무신청결재내역 통계 **/
	@Override
	public HashMap<String, Integer> attendanceExceptionApprovalStats(String empId) {
		return attendanceExceptionDAO.getAttendanceExceptionApprovalStats(empId);
	}
	
	/** (부서장) 근무신청결재내역 목록의 전체 행의 수 가져오기 **/
	@Override
	public int attendanceExceptionApprovalRowsCount(String startDate, String endDate, String empId) {
		return attendanceExceptionDAO.getAttendanceExceptionApprovalRowsCount(startDate, endDate, empId);
	}

	/** (부서장) 근무신청결재내역 페이징 목록 가져오기 **/
	@Override
	public List<AttendanceException> attendanceExceptionApprovalList(String startDate, String endDate, String empId, Pager pager) {
		return attendanceExceptionDAO.getAttendanceExceptionApprovalList(startDate, endDate, empId, pager);
	}
	
	/** (부서장) 근무신청결재내역 상세내용 가져오기 **/
	@Override
	public AttendanceException attendanceExceptionApprovalDetail(int atdExcpId, String atdExcpCategory) {
		return attendanceExceptionDAO.getattendanceExceptionApprovalDetail(atdExcpId, atdExcpCategory);
	}
	
	/** (부서장) 근무신청서의 결재상태 수정하기<승인/반려> **/
	@Override
	@Transactional
	public int attendanceExceptionApprovalProcessState(AttendanceException attendanceException) {
		if(attendanceException.getAtdExcpCategory().contains("추가근무")) { //추가근무 보고서일 경우
			// DTO에서 시간값을 가져와 LocalTime 객체로 변환
			LocalTime startTime = LocalTime.parse(attendanceException.getAtdExcpInTime());
			LocalTime endTime = LocalTime.parse(attendanceException.getAtdExcpOutTime());
			
			LocalDateTime startDateTime = LocalDateTime.of(LocalDate.now(), startTime);
			LocalDateTime endDateTime = LocalDateTime.of(LocalDate.now(), endTime);
			// 종료시간이 시작시간보다 이전인 경우 종료시간을 하루 뒤로 변경
			if (endTime.isBefore(startTime)) {
				endDateTime = LocalDateTime.of(LocalDate.now().plusDays(1), endTime);
			}
			
			// Duration으로 시간 차이 구하기
			Duration duration = Duration.between(startDateTime, endDateTime);
			
			// 시간 차이를 시간 단위로 출력
			double overTimeHours = duration.toHours();
			
			//Attendances 테이블의 추가근무 여부 컬럼과 추가근무 시간을 넣어줌
			attendanceDAO.updateAttendanceOverTime(attendanceException.getEmpId(), overTimeHours);
		
		} else { //근무시간수정 신청서일 경우
			//기존날짜의 출,퇴근 시간을 수정
			log.info("날짜 확인!" + attendanceException.getAtdExcpDate());
			attendanceDAO.updateAttendanceUpdateTime(attendanceException);
		}
        
        //근무신청서의 결재상태를 수정
		return attendanceExceptionDAO.updateAttendanceExceptionProcessState(attendanceException);
	}
	
	/** (부서장) 휴가결재내역 통계 **/
	@Override
	public HashMap<String, Integer> leaveApplicationApprovalStats(String empId) {
		return leaveApplicationDAO.getLeaveApplicationApprovalStats(empId);
	}
	
	/** (부서장) 휴가결재내역 목록의 전체 행의 수 가져오기 **/
	@Override
	public int leaveApplicationApprovalRowsCount(String startDate, String endDate, String empId) {
		return leaveApplicationDAO.getLeaveApplicationApprovalRowsCount(startDate, endDate, empId);
	}
	
	/** (부서장) 휴가결재내역 페이징 목록 가져오기 **/
	@Override
	public List<AttendanceException> leaveApplicationApprovalList(String startDate, String endDate, String empId, Pager pager) {
		return leaveApplicationDAO.getLeaveApplicationApprovalList(startDate, endDate, empId, pager);
	}
	
	/** (부서장) 휴가결재내역 상세내용 가져오기 **/
	@Override
	public LeaveApplication leaveApplicationApprovalDetail(int levAppId) {
		return leaveApplicationDAO.getLeaveApplicationApprovalDetail(levAppId);
	}
	
	/** (부서장) 휴가신청서의 결재상태 수정하기<승인/반려> **/
	@Override
	@Transactional
	public int leaveApplicationApprovalProcessState(LeaveApplication leaveApplication) {
		//승인했을 경우에만 적용
		if(leaveApplication.getLevAppProcessState().equals("승인")) {
			//해당 직원의 잔여일수를 DB에서 가져온 후, 잔여일수 안에 휴가기간을 선택했는지 확인
			Employee emp = leaveApplicationDAO.getEmpReserveInfo(leaveApplication.getEmpId());
			if(leaveApplication.getLevAppCategory().equals("대체휴무") && (emp.getEmpSubstitueReserve() - leaveApplication.getLevPeriod() < 0 )) {
				//대체휴무이면서, 잔여일수 안에 신청하지 않은 경우
				return 0;
			} else if(leaveApplication.getLevAppCategory().contains("차") && (emp.getEmpLeaveReserve() - leaveApplication.getLevPeriod() < 0 )) { //나머지(연차, 반차)
				//연차 or 반차이면서, 잔여일수 안에 신청하지 않은 경우
				return 0;
			} else { //잔여 일수 안에 신청한 경우!
				//반차일 경우에는 카운팅되는 잔여일수가 다름
				if(leaveApplication.getLevAppCategory().contains("반차")) { 
					leaveApplication.setLevPeriod(leaveApplication.getLevPeriod()*0.5);
				}
				//기존에 있던 잔여일수 차감(카운팅)
				leaveApplicationDAO.updateEmployeeReserve(leaveApplication.getEmpId(), leaveApplication.getLevAppCategory(), leaveApplication.getLevPeriod());
				//신청날짜에 해당하는 Attendances 데이터를 미리 만든 후, 근무상태를 변경
				attendanceDAO.insertBeforehandAttendance(leaveApplication);
			}
		} 
		//결재상태를 승인, 반려로 수정해줌
		return leaveApplicationDAO.updateLeaveApplicationProcessState(leaveApplication);
	}
	
	/** 잔여 일수 가져오기 가져오기(Employee) **/
	@Override
	public Employee empReserveInfo(String empId) {
		return leaveApplicationDAO.getEmpReserveInfo(empId);
	}
	
	/** 신청폼에 필요한 정보 가져오기(Employee) **/
	@Override
	public HashMap<String, String> empFormInfoMap(String empId) {
		//작성자, 결재자 이름 갖고오기
		return attendanceDAO.getEmpNames(empId);
	}
	
}
