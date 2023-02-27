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
	
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	//오늘 근태 기록 갖고 오기
	@Override
	public int attendanceToday(String empId) {
		String now = Today.TodayDate();
		
		attendanceDAO.getAttendanceToday(empId, now);
		
		return 1;
	}

	//출근시간 등록
	@Override
	public int inTime(String empId, String now) {
		//오늘 날짜의 근태기록 가져오기
		Attendance today = attendanceDAO.getAttendanceToday(empId, now);
		
		if (today == null) {
			attendanceDAO.insertAttendance(empId, now);
		} else {
			// 출근한 기록이 있을경우
			return 0;
		}
		return 1;
	}
	
	//퇴근시간 등록
	@Override
	public int outTime() {
		//
		
		return 0;
	}




	
}
