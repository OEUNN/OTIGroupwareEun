package com.oti.groupware.mail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
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
		return "redirect:/mail/sendmail";
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
//	@RequestMapping(value = "/titlesearch", method = RequestMethod.POST)
//	public String sendSearch(String search, String category, HttpSession session, Model model) {
//		log.info("실행");
//		Employee employee = (Employee) session.getAttribute("employee");
//		int totalRows = mailService.sendMailSearchRowsCount(employee.getEmpId(), search);
//		// 페이저 객체 생성
//		Pager pager = new Pager(10, 5, totalRows, 1);
//		if (totalRows != 0) {
//			List<SendMail> sendMail = mailService.getSearchSendMail(employee.getEmpId(), pager, search);
//			model.addAttribute("sendmail", sendMail);
//			model.addAttribute("pager", pager);
//		}
//		return "mail/sendmailinfo";
//	}

	/**
	 * 메일 자세히 보기
	 * @param sessio - 로그인 되어 있는 정보
	 * @param category - 받은메일, 보낸메일, 임시보관함, 중요메일, 휴지통 어디서 보기를 했는지
	 * @param mailid - 해당 메일 ID
	 * @param model - sendMail(보낸사람, 받은 사람에 대한 정보), category
	 * @return 임시보관함일때/그냥 자세히 보기일때
	 */
	@RequestMapping(value = "/detailmail/{category}/{mailid}", method = RequestMethod.GET)
	public String detailMail(Model model, HttpSession sessio,@PathVariable String category ,@PathVariable int mailid ) {
		log.info("실행");
		//읽음으로 바꿔줘야함
		SendMail sendMail = mailService.getDetailSendMail(mailid, category);
		if(sendMail.getFileYN().equals("Y")) {
			List<MailFile> mailFile = mailService.getMailFile(mailid);
			model.addAttribute("mailFile", mailFile);
		}
		model.addAttribute("sendMail", sendMail);
		model.addAttribute("category", category);
		if(category.equals("temp")) {
			return "mail/writemail";
		}
		return "mail/detailmail";
	}
	
	/**
	 * 메일 자세히 보기에서 파일 다운로드
	 * @param userAgent
	 * @param mfile
	 * @param response
	 * @throws Exception
	 */
	@GetMapping("/filedownload/{mfile}")
	public void filedownload(@RequestHeader("User-Agent")String userAgent,@PathVariable int mfile, HttpServletResponse response) throws Exception {
		MailFile mailFile = mailService.getMailFileById(mfile);
		if(mailFile != null) {
			String originalName = mailFile.getMailFileName();
			String savedName =  mailFile.getMailFileName();
			String contentType = mailFile.getMailFileType();
			
			if(userAgent.contains("Trident")||userAgent.contains("MSIE")) {
				originalName = URLEncoder.encode(originalName, "UTF-8");
			}else {
				originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setHeader("Content-Disposition","attachment; filename=\""+ originalName +"\"");
			response.setContentType(contentType);
			String filePath = "C:/Temp/uploadfiles/"+savedName;
			File file = new File(filePath);
			if(file.exists()) {
				InputStream is = new FileInputStream(file);
				OutputStream os = response.getOutputStream();
				FileCopyUtils.copy(is, os);
				os.flush();
				os.close();
				is.close();
			}
		}
	}	

}
