package com.oti.groupware.mail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.groupware.employee.dao.DepartmentDAO;
import com.oti.groupware.employee.dao.EmployeeDAO;
import com.oti.groupware.employee.dao.PositionDAO;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.mail.dao.MailFileDAO;
import com.oti.groupware.mail.dao.ReceivedMailDAO;
import com.oti.groupware.mail.dao.SendMailDAO;
import com.oti.groupware.mail.dto.MailFile;
import com.oti.groupware.mail.dto.ReceivedMail;
import com.oti.groupware.mail.dto.SendMail;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MailServiceImpl implements MailService {

	@Autowired
	private EmployeeDAO employeeDao;
	@Autowired
	private PositionDAO positionDao;
	@Autowired
	private DepartmentDAO departmentDao;
	@Autowired
	private SendMailDAO sendMailDao;
	@Autowired
	private ReceivedMailDAO receivedMailDao;
	@Autowired
	private MailFileDAO mailFileDao;
	
	@Override
	public List<Employee> getEmployee() {
		List<Employee> list = employeeDao.getemp();
		for(Employee empList : list) {
			String depStr = departmentDao.getDepartmentById(empList.getDepId());
			String posStr = positionDao.getPositionById(empList.getPosId());
			empList.setDepName(depStr);
			empList.setPosName(posStr);
		}
		return list;
	}

	//메일쓰기
	@Override
	public void writeMail(SendMail sendMail, String[] arr) {
		sendMailDao.insertSendMail(sendMail);
		for(int i=0;i<arr.length;i++) {
			receivedMailDao.insertReceivedMail(sendMail.getSendMailId(),arr[i]);
		}
	}

	//파일 저장하기
	@Override
	public void writeFile(MailFile mailFile) {
		mailFileDao.insertMailFile(mailFile);
	}

	//메일 임시저장
	@Override
	public void writeTempMail(SendMail sendMail) {
		sendMailDao.insertTempMail(sendMail);
	}

	//받은 메일함
	@Override
	public List<ReceivedMail> getReceivedMail(String empId) {
		return receivedMailDao.getReceivedMailById(empId);
	}


	

}
