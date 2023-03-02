package com.oti.groupware.hr.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.hr.dao.AttendanceDAO;
import com.oti.groupware.hr.dto.Attendance;

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
	
	//오늘의 출퇴근 기록 가져오기
	@Override
	public Attendance attendanceToday(String empId) {
		return attendanceDAO.getAttendanceToday(empId);
	}
	
	//ㅇ근무현황 목록 가져오기
	@Override
	public List<Attendance> attendanceList(String empId) {
		//근무현황목록을 갖고옴
		String choice = "paging";
		List<Attendance> atdList = attendanceDAO.getAttendanceList(empId, choice);
		
		
		return attendanceDAO.getAttendanceList(empId, choice);
	}
	
	//달력을 채울 출퇴근 기록 목록 가져오기(달력에 알맞게 값 가공)
	@Override
	public JSONArray attendanceCalendarList(String empId) {
		//근무현황목록을 갖고옴
		String choice = "calendar";
		List<Attendance> atdList = attendanceDAO.getAttendanceList(empId, choice);
		
		//날짜와 시간 포맷 변경
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//캘린더에 넣을 출퇴근 JSON을 JSON 배열에 넣기
		JSONArray jsonArr = new JSONArray();
		
		for(Attendance atd : atdList) {
			JSONObject  jsonObj = new JSONObject();
			//과거 근무목록
			if(atd.getAtdState() != null) {
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
					
				} else if(atd.getAtdState().equals("휴가")) { //휴가인 경우
					jsonObj.put("title", "휴가");
					jsonObj.put("start",  formatDate.format(atd.getAtdInTime()));
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
				}
			}
			jsonArr.put(jsonObj);
		}
		return jsonArr;
	}

	//출근시간 등록
	@Override
	public void inTime(String empId) {
		attendanceDAO.insertAttendance(empId);
	}
	
	//퇴근시간 등록
	@Override
	public void outTime(String empId) {
		attendanceDAO.updateAttendance(empId);
	}
	
	//전체 임직원의 근무상태를 일정시간에 자동지정해주는 스케줄러
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
	
}
