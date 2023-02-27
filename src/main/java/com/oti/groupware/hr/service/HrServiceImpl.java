package com.oti.groupware.hr.service;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class HrServiceImpl implements HrService {
	
	//출근시간 등록
	@Override
	public int inTime() {
		//일단 먼저 DB로 부터 당일의 출근시간이 있는지 SELECT 해옴
		//출근시간이 있을 경우 0을 리턴
		//출근시간이 없을 경우 1을 리턴
		
		//출근시간이 없을 경우, DB에 현재 출근한 시간을 DB에 INSERT함
		//INSERT가 성공적으로 완료했을 경우 1을 리턴
		//INSERT가 실패했을 경우, 0을 리턴
		
		return 0;
	}
	
	//퇴근시간 등록
	@Override
	public int outTime() {
		//
		
		return 0;
	}


	
}
