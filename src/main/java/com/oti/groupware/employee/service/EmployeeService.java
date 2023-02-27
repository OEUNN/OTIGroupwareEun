package com.oti.groupware.employee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;
/**
 * 
 * @author 장영은
 *
 */
@Service
@Log4j2
public class EmployeeService {
	
	public enum LoginResult{
		SUCCESS, WRONE_ID, WRONG_PASSWPRD 
	}
	
	
}
