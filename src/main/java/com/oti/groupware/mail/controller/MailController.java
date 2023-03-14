package com.oti.groupware.mail.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 메일쓰기
	@RequestMapping(value = "/mailwrite", method = RequestMethod.GET)
	public String writeMail() {
		log.info("실행");
		return "mail/mailwrite";
	}

	// 주소록 팝업창
	@RequestMapping(value = "/addresspopup", method = RequestMethod.GET)
	public String addressPopup(Model model) {
		List<Employee> employee = mailService.getEmployee();
		model.addAttribute("emp", employee);
		return "mail/addresspopup";
	}
	// write
	@RequestMapping(value = "/sendmail", method = RequestMethod.POST)
	public String sendMail(@RequestParam("write") String write, SendMail sendMail, String receive,
			@RequestParam("resultString") String resultString) throws Exception {
		log.info("실행");
		sendMail.setSendMailContent(write);
		if (resultString.equals("temp")) {
			mailService.writeTempMail(sendMail);
		} else {
			String[] arr = receive.split(",");
			mailService.writeMail(sendMail, arr);
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
		return "mail/sendmail";
	}

	// 메일 write 보내기 팝업
	@RequestMapping(value = "/mailwritepopup", method = RequestMethod.GET)
	public String mailWritePopup() {
		return "mail/mailwritepopup";
	}

	// 받은메일
	@RequestMapping(value = "/receivedmail", method = RequestMethod.GET)
	public String receivedMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.mailRowsCount(employee.getEmpId());
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<ReceivedMail> receivedMail = mailService.getReceivedMail(employee.getEmpId(), pager);
			model.addAttribute("receivedmail", receivedMail);
			model.addAttribute("pager", pager);
		}
		return "mail/receivedmail";
	}

	// 받은메일 필터
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
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, page);
		if (totalRows != 0) {
			List<ReceivedMail> receivedMail = mailService.getSearchReceivedMail(employee.getEmpId(), pager, search);
			model.addAttribute("receivedmail", receivedMail);
			model.addAttribute("pager", pager);
		}
		return "mail/receivedmailinfo";
	}

	// 보낸 메일
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

	// 보낸메일 필터
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

	// 중요메일
	@RequestMapping(value = "/importmail", method = RequestMethod.GET)
	public String importMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.importMailRowsCount(employee.getEmpId());
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getImportMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/importmail";
	}

	// 중요메일 필터
	@RequestMapping(value = "/importsearch", method = RequestMethod.POST)
	public String importSearch(@RequestBody MailSearch mailSearch, HttpSession session, Model model) {
		log.info("실행");
		List<Integer> list = mailSearch.getMailList();
		int mailId = mailSearch.getMailId();
		int page = mailSearch.getPage();
		String result = mailSearch.getResult();
		log.info(mailSearch);
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

	// 중요메일 팝업창
	@RequestMapping(value = "/importpopup", method = RequestMethod.GET)
	public String importPopup() {
		return "mail/importpopup";
	}

	// 임시 보관함
	@RequestMapping(value = "/tempmail", method = RequestMethod.GET)
	public String tempMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.tempMailRowsCount(employee.getEmpId());
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getTempMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/tempmail";
	}
	
	//임시 보관함 필터
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

	// 임시 보관함 팝업
	@RequestMapping(value = "/temppopup", method = RequestMethod.GET)
	public String tempPopup() {
		return "mail/temppopup";
	}

	// 휴지통
	@RequestMapping(value = "/trashmail", method = RequestMethod.GET)
	public String trashMail(HttpSession session, Model model) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("employee");
		int totalRows = mailService.trashMailRowsCount(employee.getEmpId());
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, 1);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getTrashMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/trashmail";
	}
	
	//휴지통 필터
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
		// 페이저 객체 생성
		Pager pager = new Pager(10, 5, totalRows, page);
		if (totalRows != 0) {
			List<SendMail> sendMail = mailService.getTrashMail(employee.getEmpId(), pager);
			model.addAttribute("sendmail", sendMail);
			model.addAttribute("pager", pager);
		}
		return "mail/trashmailinfo";
	}

	// 휴지통 팝업창
	@RequestMapping(value = "/trashpopup", method = RequestMethod.GET)
	public String trashpopup() {
		return "mail/trashpopup";
	}


	// 메일자세히보기
	@RequestMapping(value = "/detailmail/{category}/{mailid}", method = RequestMethod.GET)
	public String detailMail(Model model, HttpSession sessio,@PathVariable String category ,@PathVariable int mailid ) {
		log.info("실행");
		SendMail sendMail = mailService.getDetailSendMail(mailid);
		
		model.addAttribute("category", category);
		return "mail/detailmail";
	}

}
