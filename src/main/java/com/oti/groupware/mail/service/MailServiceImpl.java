package com.oti.groupware.mail.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dao.DepartmentDAO;
import com.oti.groupware.employee.dao.EmployeeDAO;
import com.oti.groupware.employee.dao.PositionDAO;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.mail.dao.MailFileDAO;
import com.oti.groupware.mail.dao.ReceivedMailDAO;
import com.oti.groupware.mail.dao.SendMailDAO;
import com.oti.groupware.mail.dto.EmployeeInfo;
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
	
	//주소록에 해당 department의 직원들 가져오기
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

	//받은 메일함 첫 화면 
	@Override
	public List<ReceivedMail> getReceivedMail(String empId, Pager pager) {
		List<ReceivedMail> receivedMail = receivedMailDao.getReceivedMailById(empId, pager);
		receivedMail = getReceivedDetail(receivedMail);
		return receivedMail;
	}

	//받은메일함 카운트(휴지통은 제외)
	@Override
	public int mailRowsCount(String empId) {
		return receivedMailDao.getMailTotalRow(empId);
	}
	
	//받은메일함 중요 표시
	@Override
	public void receivedMamilChangeImport(int mailId, String empId) {
		String star = receivedMailDao.receivedMamilGetImport(mailId, empId);
		receivedMailDao.receivedMamilChangeImport(star, mailId, empId);
		
	}

	//받은메일 검색을 위한 rows
	@Override
	public int receivedMailSearchRowsCount(String empId, String search) {
		return receivedMailDao.mailSearchRowsCount(empId, search);
	}

	//받은메일 검색 필터
	@Override
	public List<ReceivedMail> getSearchReceivedMail(String empId, Pager pager, String search) {
		List<ReceivedMail> receivedMail = receivedMailDao.getSearchReceivedMailById(empId, pager, search);
		receivedMail = getReceivedDetail(receivedMail);
		return receivedMail;
	}

	//received mail detail information method
	private List<ReceivedMail> getReceivedDetail(List<ReceivedMail> receivedMail) {
		for(ReceivedMail list : receivedMail) {
			list.setEmpId(sendMailDao.getEmpIdById(list.getSendMailId()));
			list.setSendMailTitle(sendMailDao.getTitleById(list.getSendMailId()));
			Employee employee =employeeDao.getEmployeeById(list.getEmpId());
			list.setEmpName(employee.getEmpName());
			String depName = departmentDao.getDepartmentById(employee.getDepId());
			String posName = positionDao.getPositionById(employee.getPosId());
			list.setDepName(depName);
			list.setPosName(posName);
			int file = mailFileDao.getFileYN(list.getSendMailId());
			if(file != 0) {
				list.setFileYN("Y");
			}else {
				list.setFileYN("N");
			}
		}
		return receivedMail;
	}
	

	//보낸메일함 모든 row 카운드
	@Override
	public int sendMailRowsCount(String empId) {
		return sendMailDao.sendMailRowsCount(empId);
	}

	//보낸 메일 get 요청 첫화면
	@Override
	public List<SendMail> getSendMail(String empId, Pager pager) {
		List<SendMail> sendMail = sendMailDao.getSendMail(empId, pager);
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}

	//보낸 메일 중요표시
	@Override
	public void sendMamilChangeImport(int mailId) {
		String star = sendMailDao.sendMamilGetImport(mailId);
		sendMailDao.sendMamilChangeImport(star, mailId);
	}
	
	//보낸 메일함 검색필터를 위한 rows count
	@Override
	public int sendMailSearchRowsCount(String empId, String search) {
		return sendMailDao.mailSearchRowsCount(empId, search);
	}

	//보낸 메일함 검색 필터
	@Override
	public List<SendMail> getSearchSendMail(String empId, Pager pager, String search) {
		List<SendMail> sendMail = sendMailDao.getSearchSendMail(empId, pager,search);
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}
	
	//send mail detail information method
	private List<SendMail> getSendDetail(List<SendMail> sendMail){
		
		for(SendMail list : sendMail) {
			list.setReceivedCount(receivedMailDao.getReceivedCount(list.getSendMailId()));
				
				
				
			int file = mailFileDao.getFileYN(list.getSendMailId());
			if(file != 0) {
				list.setFileYN("Y");
			}else {
				list.setFileYN("N");
			}
		}
		return sendMail;
	}


	

}
