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
import com.oti.groupware.mail.dto.MailCount;
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
	
	//임시보관함인데 쓰기 했을때 
	@Override
	public void deleteTempMail(int temp) {
		sendMailDao.deleteMail(temp);
	}
	
	//임시보관함 메일 쓰기
	@Override
	public SendMail tempWriteMail(SendMail sendMail, String[] arr, String write) {
		sendMailDao.insertTempMail(sendMail,write);
		sendMail.setSendMailId(sendMailDao.getSEndMailId());
		for(int i=0;i<arr.length;i++) {
			receivedMailDao.insertReceivedMail(sendMail.getSendMailId(),arr[i]);
		}
		return sendMail;
	}

	//메일쓰기
	@Override
	public SendMail writeMail(SendMail sendMail, String[] arr, String write) {
		sendMailDao.insertSendMail(sendMail,write);
		sendMail.setSendMailId(sendMailDao.getSEndMailId());
		for(int i=0;i<arr.length;i++) {
			receivedMailDao.insertReceivedMail(sendMail.getSendMailId(),arr[i]);
		}
		return sendMail;
	}
	
	//메일 답장
	@Override
	public void replyMail(int sendMailId, int reply) {
		receivedMailDao.updateParentMail(sendMailId, reply);
	}
	
	//메일 임시저장
	@Override
	public SendMail writeTempMail(SendMail sendMail, String write) {
		sendMailDao.insertTempMail(sendMail, write);
		sendMail.setSendMailId(sendMailDao.getSEndMailId());
		return sendMail;
	}
	//파일 저장하기
	@Override
	public void writeFile(MailFile mailFile) {
		mailFileDao.insertMailFile(mailFile);
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
		String star = receivedMailDao.receivedMailGetImport(mailId, empId);
		receivedMailDao.receivedMailChangeImport(star, mailId, empId);
		
	}
	
	//받은메일 휴지통 보내기
	@Override
	public void receivedMailSearchDelete(List<Integer> mailId, String empId) {
		receivedMailDao.receivedMailSearchDelete(mailId, empId);
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
			SendMail sendMail = (sendMailDao.getEmpIdById(list.getSendMailId()));
			list.setEmpId(sendMail.getEmpId());
			list.setSendMailTitle(sendMail.getSendMailTitle());
			EmployeeInfo empInfo=employeeDao.mailInfo(list.getEmpId());
			list.setEmpName(empInfo.getEmpName());
			list.setDepName(empInfo.getDepName());
			list.setPosName(empInfo.getPosName());
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
	public void sendMailChangeImport(int mailId) {
		String star = sendMailDao.sendMailGetImport(mailId);
		sendMailDao.sendMailChangeImport(star, mailId);
	}
	
	//보낸 메일 체크된 리스트 휴지통 보내기
	@Override
	public void sendMailSearchDelete(List<Integer> mailId) {
		log.info(mailId);
		sendMailDao.sendMailSearchDelete(mailId);
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
			SendMail send = sendMailDao.getMailInformation(list.getSendMailId());
//			log.info("mail id에 따른 내용 :" +send);
			list.setSendMailTitle(send.getSendMailTitle());
			list.setSendMailContent(send.getSendMailContent());
			list.setSendMailDate(send.getSendMailDate());
			list.setSendMailImportanceYN(send.getSendMailImportanceYN());
			List<EmployeeInfo> emp = new ArrayList<>();
			EmployeeInfo empInfo =employeeDao.mailInfo(send.getEmpId());
			list.setPosName(empInfo.getPosName());
			list.setDepName(empInfo.getDepName());
			list.setEmpName(empInfo.getEmpName());
			List<ReceivedMail> received = receivedMailDao.getMailInformation(list.getSendMailId());
			list.setReceivedCount(receivedMailDao.getReceivedCount(list.getSendMailId()));
//				log.info("메일 아이디에 따른 보낸사람에대한 정보 :" +received);
			for(ReceivedMail rcd : received) {
				empInfo =employeeDao.mailInfo(rcd.getEmpIdEmployees());
				empInfo.setReadYN(receivedMailDao.readYN(list.getSendMailId(),rcd.getEmpIdEmployees())); //상대방이 읽었는지 안읽었는지
				emp.add(empInfo);
			}
			list.setEmpList(emp);
			int file = mailFileDao.getFileYN(list.getSendMailId());
			if(file != 0) {
				list.setFileYN("Y");
			}else {
				list.setFileYN("N");
			}
		}
		return sendMail;
	}

	@Override
	public int importMailRowsCount(String empId) {
		log.info("실행");
		return sendMailDao.getImportRowCount(empId);
	}

	//중요메일 데이터 얻어오기
	@Override
	public List<SendMail> getImportMail(String empId, Pager pager ) {
		log.info("실행");
		List<SendMail> sendMail = sendMailDao.getImportMail(empId, pager);
//		log.info("union 메일  :"+sendMail);
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}

	//중요메일  중요도 체인지
	@Override
	public void importMailChangeImport(int mailId, String empId) {
		List<String> tbName = sendMailDao.getWhereTable(mailId, empId);
		for(String table : tbName) {
			if(table.equals("received")) {
				receivedMailDao.importReceivedMailChangeImport(mailId, empId);
				break;
			}else {
				sendMailDao.importMailChangeImport(mailId);
				break;
			}
		}
	}
	
	//중요메일 휴지통 보내기
	@Override
	public void importMailSearchDelete(List<Integer> mailId,String empId) {
		log.info("실행");
		List<Integer> sendMail = new ArrayList<>();
		List<Integer> receivedMail = new ArrayList<>();
		for(Integer id : mailId) {
			List<String> tbName = sendMailDao.getWhereTable(id, empId);
			for(String table: tbName) {
				if(table.equals("received")) {
					receivedMail.add(id);
					break;
				}else {
					sendMail.add(id);
					break;
				}
			}
		}
		receivedMailDao.receivedMailSearchDelete(receivedMail, empId);
		sendMailDao.sendMailSearchDelete(sendMail);
	}

	//임시보관함 get count
	@Override
	public int tempMailRowsCount(String empId) {
		return sendMailDao.tempMailRowsCount(empId);
	}
	
	//임시 보관함 삭제하기
	@Override
	public void tempMailDelete(List<Integer> list) {
		sendMailDao.deleteTempMail(list);
		
	}

	@Override
	public List<SendMail> getTempMail(String empId, Pager pager) {
		List<SendMail> tempMail = sendMailDao.getTempMail(empId, pager);
		tempMail = getSendDetail(tempMail);
		return tempMail;
	}

	@Override
	public int trashMailRowsCount(String empId) {
		return sendMailDao.getTrashRowCount(empId);
	}

	//휴지통 데이터 얻어오기
	@Override
	public List<SendMail> getTrashMail(String empId, Pager pager) {
		log.info("실행");
		List<SendMail> sendMail = sendMailDao.getTrashMail(empId, pager); //send, received 테이블의 delete Y를 가져온다.
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}

	//휴지통 완전삭제 or 복구
	@Override
	public void trashMailDeleteRestore(List<Integer> mailId, String empId, String result) {
		log.info("실행");
		List<Integer> sendMail = new ArrayList<>();
		List<Integer> receivedMail = new ArrayList<>();
		for(Integer id : mailId) {
			List<String> tbName = sendMailDao.getWhereTable(id, empId);
			for(String table : tbName) {
				if(table.equals("received")) {
					receivedMail.add(id);
				}else {
					sendMail.add(id);
				}
			}
		}
		if(result.equals("delete")) {
			receivedMailDao.updateTrashMail(mailId, empId);
			sendMailDao.updateTrashMail(mailId);
		}else if(result.equals("restore")){
			receivedMailDao.updateReceivedRestore(mailId, empId);
			sendMailDao.updateSendRestore(mailId);
		}
	}

	//30일 지난 휴지통 메일 삭제
	@Override
	public void deleteTrashMail() {
		List<SendMail> trashMail = sendMailDao.getDeleteTrashMail();
		List<Integer> sendMail = new ArrayList<>();
		List<ReceivedMail> receivedMail = new ArrayList<>();
 		for(SendMail list : trashMail) {
			if(list.getTbName().equals("send")) {
				sendMail.add(list.getSendMailId());
			}else {
				ReceivedMail received = new ReceivedMail();
				received.setSendMailId(list.getSendMailId());
				received.setEmpIdEmployees(list.getEmpId());
				receivedMail.add(received);
			}
		}
		sendMailDao.updateCompleteSendMail(sendMail);
		receivedMailDao.updateCompleteReceivedMail(receivedMail); 
	}

	//매월 1일에 해당 메일이 모두 완전 삭제되었을때 해당 메일의 데이터를 삭제한다.
	@Override
	public void completeDelete() {
		List<Integer> trashMail = sendMailDao.getCompleteMail();
		for(Integer mailId : trashMail) {
			int allCount = receivedMailDao.getAllReceivedMail(mailId);
			int completeCount = receivedMailDao.getCompleteReceivedMail(mailId);
			if(allCount == completeCount) {
				sendMailDao.deleteSendMail(mailId);
			}
		}
	}

	//메일 detail을 위한 메소드
	@Override
	public SendMail getDetailSendMail(int mailid,String empId) {
		//category에 따라 읽음여부 바꿔줘야함
		List<EmployeeInfo> emp = new ArrayList<>();
		SendMail send = sendMailDao.getSendMailById(mailid);
		List<ReceivedMail> received = receivedMailDao.getMailInformation(mailid);
		send.setReceivedCount(receivedMailDao.getReceivedCount(mailid));
		EmployeeInfo empInfo =employeeDao.mailInfo(send.getEmpId());
		send.setPosName(empInfo.getPosName());
		send.setDepName(empInfo.getDepName());
		send.setEmpName(empInfo.getEmpName());
		for(ReceivedMail rcd : received) {
			empInfo =employeeDao.mailInfo(rcd.getEmpIdEmployees());
			empInfo.setReadYN(receivedMailDao.readYN(mailid,rcd.getEmpIdEmployees()));
			emp.add(empInfo);
		}
		send.setEmpList(emp);
		int file = mailFileDao.getFileYN(mailid);
		if(file != 0) {
			send.setFileYN("Y");
		}else {
			send.setFileYN("N");
		}
		return send;
		
	}
	
	@Override
	public ReceivedMail getDetailReceivedMail(int mailid, String empId) {
		receivedMailDao.changeReadYN(mailid, empId);
		ReceivedMail receivedMail = receivedMailDao.getDetailReceivedMail(empId, mailid);
		if(receivedMail.getParentSendMailId() != 0) {
			ReceivedMail parent = sendMailDao.getParentMail(receivedMail.getParentSendMailId());
			receivedMail.setParentSendMailTitle(parent.getParentSendMailTitle());
			receivedMail.setParentSendMailContent(parent.getParentSendMailContent());
			receivedMail.setParentEmployeeInfo(employeeDao.mailInfo(parent.getEmpId()));
		}
		SendMail sendMail = (sendMailDao.getEmpIdById(mailid));
		receivedMail.setEmpId(sendMail.getEmpId());
		receivedMail.setSendMailTitle(sendMail.getSendMailTitle());
		receivedMail.setSendMailContent(sendMail.getSendMailContent());
		EmployeeInfo empInfo=employeeDao.mailInfo(receivedMail.getEmpId());
		receivedMail.setEmpName(empInfo.getEmpName());
		receivedMail.setDepName(empInfo.getDepName());
		receivedMail.setPosName(empInfo.getPosName());
		receivedMail.setMailId(empInfo.getMailId());
		int file = mailFileDao.getFileYN(mailid);
		if(file != 0) {
			receivedMail.setFileYN("Y");
		}else {
			receivedMail.setFileYN("N");
		}
		return receivedMail;
	}

	//해당 메일의 파일 얻기
	@Override
	public List<MailFile> getMailFile(int mailid) {
		return mailFileDao.getMailFile(mailid);
	}

	//파일 한개 얻어오기
	@Override
	public MailFile getMailFileById(int mfile) {
		return mailFileDao.getMailFileById(mfile);
	}
	
	//메인 메일 통계
	@Override
	public MailCount mailHomeCount(String empId) {
		MailCount mailCount = new MailCount();
		mailCount.setTempCount(sendMailDao.getTempCount(empId));
		mailCount.setReceivedCount(receivedMailDao.getReceivedMailCount(empId));
		mailCount.setNotReadCount(receivedMailDao.getNotReadCount(empId));
		mailCount.setImportCount(receivedMailDao.getImportCount(empId));
		return mailCount;
	}

	//받은 메일 title row
	@Override
	public List<Integer> titleCount(String title) {
		title = "%"+title+"%";
		return sendMailDao.getTitleCount(title);
	}

	//받은 메일 제목 검색
	@Override
	public List<ReceivedMail> searchTitleReceivedMail(List<Integer> titleMail, String empId, Pager pager) {
		List<ReceivedMail> receivedMail = receivedMailDao.getTitleReceivedMail(empId, pager, titleMail);
		receivedMail = getReceivedDetail(receivedMail);
		return receivedMail;
	}

	//보낸 메일 제목 검색
	@Override
	public List<SendMail> searchTitleSendMail(List<Integer> titleMail, String empId, Pager pager) {
		List<SendMail> sendMail = sendMailDao.getTitleSendMail(empId, pager, titleMail);
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}

	@Override
	public List<SendMail> searchTitleTempMail(List<Integer> titleMail, String empId, Pager pager) {
		List<SendMail> sendMail = sendMailDao.getTitleTempMail(empId, pager, titleMail);
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}

	@Override
	public List<SendMail> searchTitleImportMail(List<Integer> titleMail, String empId, Pager pager) {
		List<SendMail> sendMail = sendMailDao.getTitleImportMail(empId, pager, titleMail);
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}

	@Override
	public List<SendMail> searchTitleTrashMail(List<Integer> titleMail, String empId, Pager pager) {
		List<SendMail> sendMail = sendMailDao.getTitleTrashMail(empId, pager, titleMail);
		sendMail = getSendDetail(sendMail);
		return sendMail;
	}

	//휴지통 보내기 - 자세히 보기
	@Override
	public void trashMail(int mailId, String option, String empId) {
		if(option.equals("send")) {
			sendMailDao.updateTrash(mailId);
		}else {
			receivedMailDao.updateTrash(mailId, empId);
		}
	}

	//완전삭제로 상태 변경 - 자세히 보기
	@Override
	public void completetrashMail(int mailId, String empId, String option) {
		if(option.equals("send")) {
			sendMailDao.updateCompleteTrash(mailId);
		}else {
			receivedMailDao.updateCompleteTrash(mailId, empId);
		}
		
	}





}
