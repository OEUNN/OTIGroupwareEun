package com.oti.groupware.hr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.groupware.component.Today;
import com.oti.groupware.hr.dao.AttendanceDAO;
import com.oti.groupware.hr.dto.Attendance;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class HrServiceImpl implements HrService {
	//Field
	private String now = Today.TodayDate(); //오늘날짜
	
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	//오늘의 출퇴근 기록 체크
	@Override
	public int attendanceToday(String empId) {
		Attendance atdToday = attendanceDAO.getAttendanceToday(empId, now);
		
		if (atdToday == null) {
			return 0; //출퇴근한 기록이 없을 경우
		} else {
			return 1; // 출퇴근한 기록이 있을 경우
		}
	}

	//출근시간 등록
	@Override
	public void inTime(String empId) {
		attendanceDAO.insertAttendance(empId, now);
	}
	
	//퇴근시간 등록
	@Override
	public void outTime(String empId) {
		
	}




	
}
