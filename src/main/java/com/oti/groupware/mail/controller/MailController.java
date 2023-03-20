package com.oti.groupware.mail.controller;

import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;
import com.oti.groupware.mail.dto.MailFile;
import com.oti.groupware.mail.dto.MailSearch;
import com.oti.groupware.mail.dto.ReceivedMail;
import com.oti.groupware.mail.dto.SendMail;
import com.oti.groupware.mail.service.MailService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private MailService mailService;
	
	/**
	 * 메일 쓰기
	 * @return JSP
	 */
	@RequestMapping(value = "/mailwrite", method = RequestMethod.GET)
	public String writeMail() {
		log.info("실행");
		return "mail/mailwrite";
	}

	/**
	 * 주소록 팝업창
	 * @param model - emp(모든 직원의 정보)
	 * @return JSP
	 */
	@RequestMapping(value = "/addresspopup", method = RequestMethod.GET)
	public String addressPopup(Model model) {
		List<Employee> employee = mailService.getEmployee();
		model.addAttribute("emp", employee);
		return "mail/addresspopup";
	}
	
	/**
	 * 메일 쓰기
	 * @param write - 에디터에 쓴 내용
	 * @param sendMail - 보낸 메일 데이터(수신인, 제목, 내용 등등)
	 * @param receive
	 * @param resultString - 임시보관인지 보내기 인지
	 * @return JSP
	 * @throws Exception
	 */
	@RequestMapping(value = "/sendmail", method = RequestMethod.POST)
	public String sendMail(@RequestParam("write") String write, SendMail sendMail, String receive, int temp,
			@RequestParam("resultString") String resultString, int reply) throws Exception {
		log.info("실행");
		if(temp != -3) {
			mailService.deleteTempMail(temp);
		}
		if(receive == null && resultString.equals("temp")) {
			mailService.writeTempMail(sendMail, write);
		}else if(receive != null && resultString.equals("temp")){
			String[] arr = receive.split(",");
			mailService.tempWriteMail(sendMail,arr,write);
		}else {
			String[] arr = receive.split(",");
			mailService.writeMail(sendMail, arr , write);
		}
		if(reply != -3) {
			mailService.replyMail(sendMail.getSendMailId(),reply);
		}
		List<MultipartFile> mFileList = sendMail.getFileList();
		if (mFileList != null && !mFileList.isEmpty()) {
			for (MultipartFile mFile : mFileList) {
				if (!mFile.getOriginalFilename().equals("")) {
					MailFile mailFile = new MailFile();
					mailFile.setSendMailId(sendMail.getSendMailId());
					mailFile.setMailFileName(mFile.getOriginalFilename());
					mailFile.setMailFileType(mFile.getContentType());
					mailFile.setMailFileLength(mFile.getSize());
					mailFile.setMailFileData(mFile.getBytes());
					mailService.writeFile(mailFile);
				} else {
					break;
				}
			}
		}
		if (resultString.equals("temp")) {
			return "redirect:/mail/tempmail";
		}
		return "redirect:/mail/sendmail";
	}
	
	//답장
	@RequestMapping(value = "/reply/{sendMailId}", method = RequestMethod.GET)
	public String replyMail(@PathVariable int sendMailId, HttpSession session, Model model) {
		Employee employee = (Employee)session.getAttribute("employee");
		ReceivedMail receivedMail = mailService.getDetailReceivedMail(sendMailId,employee.getEmpId());
		model.addAttribute("replyMail", receivedMail);
		return "mail/mailwrite";
	}
		
	@RequestMapping(value = "/tempdelete/{mailId}", method = RequestMethod.GET)
	public String CompleteTrash(@PathVariable int mailId) {
		log.info("실행");
		log.info(mailId);
		mailService.deleteTempMail(mailId);
		return "redirect:/mail/receivedmail";
	}
	

	/**
	 * 메일 write 보내기 팝업
	 * @return JSP
	 */
	@RequestMapping(value = "/mailwritepopup", method = RequestMethod.GET)
	public String mailWritePopup() {
		return "mail/mailwritepopup";
	}

	/**
	 * 받은 메일
	 * @param session - 로그인 되어 있는 정보
	 * @param model - receivedMail(받은 메일 정보), pager
	 * @return JSP
	 */
	@RequestMapping(value = "/receivedmail", method = RequestMethod.GET)
	public String receivedMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.mailRowsCount(employee.getEmpId());
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<ReceivedMail> receivedMail = mailService.getReceivedMail(employee.getEmpId(), pager);
			model.addAttribute("receivedmail", receivedMail);
			model.addAttribute("pager", pager);
		}
		return "mail/receivedmail";
	}

	/**
	 * 받은 메일 필터
	 * @param mailSearch - 필터에 대한 정보
	 * @param session - 로그인 되어 있는 정보 
	 * @param model - receivedMail(받은 메일 정보), pager
	 * @return JSP 조각
	 */
	@RequestMapping(value = "/receivedsearch", method = RequestMethod.POST)
	public String receivedSearch(@RequestBody MailSearch mailSearch, HttpSession session, Model model) {
		log.info("실행");
		List<Integer> list = mailSearch.getMailList();
		int mailId = mailSearch.getMailId();
		String search = mailSearch.getSearch();
		int page = mailSearch.getPage();
		String result = mailSearch.getResult();
		Employee employee = (Employee) session.getAttribute("employee");
		if (mailId != 0) {
			mailService.receivedMamilChangeImport(mailId, employee.getEmpId());
		}
		if(result.equals("delete")) {
			mailService.receivedMailSearchDelete(list, employee.getEmpId());
		}
		int totalRows = mailService.receivedMailSearchRowsCount(employee.getEmpId(), search);
		Pager pager = new Pager(10, 5, totalRows, page);
		if (totalRows != 0) {
			List<ReceivedMail> receivedMail = mailService.getSearchReceivedMail(employee.getEmpId(), pager, search);
			model.addAttribute("receivedmail", receivedMail);
			model.addAttribute("pager", pager);
		}
		return "mail/receivedmailinfo";
	}

	/**
	 * 보낸 메일
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(받은 메일 정보), pager
	 * @return JSP
	 */
	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public String sendMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.sendMailRowsCount(employee.getEmpId());
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getSendMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/sendmail";
	}

	/**
	 * 보낸 메일 필터
	 * @param mailSearch - 필터에 대한 정보
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(받은 메일 정보), pager
	 * @return
	 */
	@RequestMapping(value = "/sendsearch", method = RequestMethod.POST)
	public String sendSearch(@RequestBody MailSearch mailSearch, HttpSession session, Model model) {
		log.info("실행");
		List<Integer> list = mailSearch.getMailList();
		int mailId = mailSearch.getMailId();
		String search = mailSearch.getSearch();
		int page = mailSearch.getPage();
		String result = mailSearch.getResult();
		Employee employee = (Employee) session.getAttribute("employee");
		if (mailId !=0) {
			mailService.sendMailChangeImport(mailId);
		}
		if(result.equals("delete")) {
			mailService.sendMailSearchDelete(list); //휴지통 보내기
		}
		int totalRows = mailService.sendMailSearchRowsCount(employee.getEmpId(), search);
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, page);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getSearchSendMail(employee.getEmpId(), pager, search);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/sendmailinfo";
	}

	/**
	 * 중요 메일
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(보낸 메일, 받은 메일 정보), pager
	 * @return JSP
	 */
	// 중요메일
	@RequestMapping(value = "/importmail", method = RequestMethod.GET)
	public String importMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.importMailRowsCount(employee.getEmpId());
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getImportMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/importmail";
	}

	/**
	 * 중요 메일 필터
	 * @param mailSearch - 필터에 대한 정보
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(보낸 메일, 받은 메일 정보), pager
	 * @return JSP 좍
	 */
	@RequestMapping(value = "/importsearch", method = RequestMethod.POST)
	public String importSearch(@RequestBody MailSearch mailSearch, HttpSession session, Model model) {
		log.info("실행");
		List<Integer> list = mailSearch.getMailList();
		int mailId = mailSearch.getMailId();
		int page = mailSearch.getPage();
		String result = mailSearch.getResult();
		Employee employee = (Employee) session.getAttribute("employee");
		if (mailId != 0) {
			mailService.importMailChangeImport(mailId, employee.getEmpId());
		}
		if(result.equals("delete")) {
			mailService.importMailSearchDelete(list, employee.getEmpId());
		}
		int totalRows = mailService.importMailRowsCount(employee.getEmpId());
		Pager pager = new Pager(10, 5, totalRows, page);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getImportMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/importmailinfo";
	}

	/**
	 * 임시 보관함
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(보낸 메일, 받은 메일 정보), pager
	 * @return JSP
	 */
	@RequestMapping(value = "/tempmail", method = RequestMethod.GET)
	public String tempMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.tempMailRowsCount(employee.getEmpId());
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getTempMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/tempmail";
	}
	
	/**
	 * 임시 보관함 필터
	 * @param mailSearch - 필터에 대한 정보
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(보낸 메일, 받은 메일 정보), pager
	 * @return
	 */
	@RequestMapping(value = "/tempsearch", method = RequestMethod.POST)
	public String tempSearch(@RequestBody MailSearch mailSearch, HttpSession session, Model model) {
		log.info("실행");
		List<Integer> list = mailSearch.getMailList();
		int page = mailSearch.getPage();
		String result = mailSearch.getResult();
		Employee employee = (Employee) session.getAttribute("employee");
		if(result.equals("delete")) {
			mailService.tempMailDelete(list);
		}
		int totalRows = mailService.tempMailRowsCount(employee.getEmpId());
		Pager pager = new Pager(10, 5, totalRows, page);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getTempMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/tempmailinfo";
	}

	/**
	 * 휴지통
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(보낸 메일, 받은 메일 정보), pager
	 * @return JSP
	 */
	@RequestMapping(value = "/trashmail", method = RequestMethod.GET)
	public String trashMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.trashMailRowsCount(employee.getEmpId());
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getTrashMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		
		return "mail/trashmail";
	}
	
	/**
	 * 휴지통 필터
	 * @param mailSearch - 필터에 대한 정보
	 * @param session - 로그인 되어 있는 정보
	 * @param model - sendMail(보낸 메일, 받은 메일 정보), pager
	 * @return
	 */
	@RequestMapping(value = "/trashsearch", method = RequestMethod.POST)
	public String trashSearch(@RequestBody MailSearch mailSearch, HttpSession session, Model model) {
		log.info("실행");
		List<Integer> list = mailSearch.getMailList();
		int page = mailSearch.getPage();
		String result = mailSearch.getResult();
		Employee employee = (Employee) session.getAttribute("employee");
		if (result.equals("delete") || result.equals("restore")) {
			mailService.trashMailDeleteRestore(list, employee.getEmpId(), result);
		}
		int totalRows = mailService.trashMailRowsCount(employee.getEmpId());
		Pager pager = new Pager(10, 5, totalRows, page);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getTrashMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/trashmailinfo";
	}

	//제목 검색
	@RequestMapping(value = "/titlesearch/{category}", method = RequestMethod.GET)
	public String sendSearch(String title, @PathVariable String category, HttpSession session, Model model) {
		log.info("실행");
		log.info(category);
		log.info(title);
		Employee employee = (Employee) session.getAttribute("employee");
		List<Integer> titleMail = mailService.titleCount(title);
		int totalRows = titleMail.size();
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			model.addAttribute("pager", pager);
			if(category.equals("received")) {
				List<ReceivedMail> received = mailService.searchTitleReceivedMail(titleMail, employee.getEmpId(), pager);
				model.addAttribute("receivedmail", received);
			}else if(category.equals("send")) {
				List<SendMail> sendMail = mailService.searchTitleSendMail(titleMail, employee.getEmpId(),pager);
				model.addAttribute("sendmail", sendMail);
			}else if(category.equals("temp")) {
				List<SendMail> sendMail = mailService.searchTitleTempMail(titleMail, employee.getEmpId(),pager);
				model.addAttribute("sendmail", sendMail);
			}else if(category.equals("import")) {
				List<SendMail> sendMail = mailService.searchTitleImportMail(titleMail, employee.getEmpId(),pager);
				model.addAttribute("sendmail", sendMail);
			}else {
				List<SendMail> sendMail = mailService.searchTitleTrashMail(titleMail, employee.getEmpId(),pager);
				model.addAttribute("sendmail", sendMail);
			}
		}
		if(category.equals("received")) {
			return "mail/receivemailinfo";
		}else if(category.equals("send")) {
			return "mail/sendmailinfo";
		}else if(category.equals("temp")) {
			return "mail/tempmailinfo";
		}else if(category.equals("import")) {
			return "mail/importmailinfo";
		}else {
			return "mail/trashmailinfo";
		}
	}

	/**
	 * 메일 자세히 보기
	 * @param sessio - 로그인 되어 있는 정보
	 * @param category - 받은메일, 보낸메일, 임시보관함, 중요메일, 휴지통 어디서 보기를 했는지
	 * @param mailid - 해당 메일 ID
	 * @param model - sendMail(보낸사람, 받은 사람에 대한 정보), category
	 * @return 임시보관함일때/그냥 자세히 보기일때
	 */
	@RequestMapping(value = "/detailmail/{category}/{mailid}/{option}", method = RequestMethod.GET)
	public String detailMail(Model model, HttpSession session ,@PathVariable String category ,@PathVariable String option,  @PathVariable int mailid ) {
		log.info("실행");
		Employee employee = (Employee)session.getAttribute("employee");
		//읽음으로 바꿔줘야함
		if(option.equals("send") || category.equals("temp")) {
			SendMail sendMail = mailService.getDetailSendMail(mailid, employee.getEmpId());
			model.addAttribute("sendMail", sendMail);
			if(sendMail.getFileYN().equals("Y")) {
				List<MailFile> mailFile = mailService.getMailFile(mailid);
				model.addAttribute("mailFile", mailFile);
			}
		}else {
			ReceivedMail receivedMail = mailService.getDetailReceivedMail(mailid,employee.getEmpId());
			model.addAttribute("receivedMail", receivedMail);
			if(receivedMail.getFileYN().equals("Y")) {
				List<MailFile> mailFile = mailService.getMailFile(mailid);
				model.addAttribute("mailFile", mailFile);
			}
		}
		model.addAttribute("category", category);
		model.addAttribute("option", option);
		if(category.equals("temp")) {
			return "mail/mailwrite";
		}
		return "mail/detailmail";
	}
	
	//보통 메일들 휴지통 보내기
	@RequestMapping(value = "/trash/{option}/{mailId}", method = RequestMethod.GET)
	public String trash(Model model, HttpSession session, @PathVariable int mailId ,@PathVariable String option) {
		log.info("실행");
		log.info(option);
		log.info(mailId);
		Employee employee = (Employee)session.getAttribute("employee");
		mailService.trashMail(mailId, option, employee.getEmpId());
		return "redirect:/mail/trashmail";
	}
	
	@RequestMapping(value = "/completetrash/{option}/{mailId}", method = RequestMethod.GET)
	public String CompleteTrash(Model model, HttpSession session, @PathVariable int mailId, @PathVariable String option) {
		log.info("실행");
		log.info(option);
		log.info(mailId);
		Employee employee = (Employee)session.getAttribute("employee");
		mailService.completetrashMail(mailId,option, employee.getEmpId());
		return "redirect:/mail/trashmail";
	}
	
	
	/**
	 * 메일 파일 다운로드
	 * @param mfile 파일 이름
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/filedownload/{mfile}")
	public ResponseEntity<byte[]> filedownload(@PathVariable int mfile) throws Exception {
		log.info("실행");
		MailFile mailFile = mailService.getMailFileById(mfile);
		HttpHeaders headers = new HttpHeaders();
		String[] mtypes = mailFile.getMailFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(mailFile.getMailFileLength());
		headers.setContentDispositionFormData("attachment", URLEncoder.encode(mailFile.getMailFileName(), "UTF-8"));
		return new ResponseEntity<byte[]>(mailFile.getMailFileData(), headers, HttpStatus.OK);
	}	

}
