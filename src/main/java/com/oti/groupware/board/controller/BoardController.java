package com.oti.groupware.board.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oti.groupware.board.dto.Board;
import com.oti.groupware.board.dto.BoardFile;
import com.oti.groupware.board.service.BoardService;
import com.oti.groupware.common.Pager;
import com.oti.groupware.employee.dto.Employee;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/board")
@Controller
@Log4j2
public class BoardController {
	
	Pager pager;
	
	@Autowired
	BoardService boardService;
	
	//공지게시판
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String getBoardList(Model model) {
		return getBoardList(1, model);
	}
	
	//공지게시판
	@RequestMapping(value = "/notice/{pageNo}", method = RequestMethod.GET)
	public String getBoardList(@PathVariable int pageNo, Model model) {
		pager = new Pager();
		List<Board> boardList = boardService.getBoardList(pager, pageNo);
		Board board = boardService.getBoard();
		Pager returnPager = new Pager(pager.getRowsPerPage(), pager.getPagesPerGroup(), pager.getTotalRows(), pageNo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("board", board);
		model.addAttribute("pager", returnPager);
		return "board/notice";
	}
	
	//게시판쓰기 화면
	@RequestMapping(value = "/boardwrite", method = RequestMethod.GET)
	public String writeBoard(HttpSession session) {
		return "board/boardwrite";
	}
	
	//게시판쓰기
	@RequestMapping(value = "/boardwrite", method = RequestMethod.POST)
	public String writeBoard(Board board, MultipartFile[] files, HttpSession session) throws IOException {
		Employee employee = (Employee) session.getAttribute("employee");
		board.setEmpId(employee.getEmpId());
		board.setEmpName(employee.getEmpName());
		board.setBoardCategoryId(1);
		int boardId = boardService.writeBoard(board, files);
		
		return "redirect:/board/notice";
	}
	
	//게시글 보기
	@RequestMapping(value = "/viewdetail/{boardId}", method = RequestMethod.GET)
	public @ResponseBody Board detailBoard(@PathVariable int boardId, Model model) {
		Board board = boardService.getBoardById(boardId);
		List<BoardFile> boardFileList = boardService.getBoardFilesByBoardId(boardId);
		board.setBoardFiles(boardFileList);
		return board;
	}
	
	//첨부파일 다운로드
	@RequestMapping(value ="/filedownload/{boardFileId}", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getBoardFile(@PathVariable int boardFileId) throws UnsupportedEncodingException {
		BoardFile boardFile = boardService.getBoardFile(boardFileId);
		HttpHeaders headers = new HttpHeaders();
		String[] mtypes = boardFile.getBoardFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(boardFile.getBoardFileLength());
		headers.setContentDispositionFormData("attachment", URLEncoder.encode(boardFile.getBoardFileName(), "UTF-8"));
		return new ResponseEntity<byte[]>(boardFile.getBoardFileData(), headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public String deleteBoard(@RequestParam("boardId") List<String> boardId, RedirectAttributes redirectAttributes) {
		int resultCount = 0;
		String result;
		for(String boardIdElement : boardId) {
			log.info("문서 번호: " + boardIdElement);
			if (boardIdElement != null && !("".equals(boardIdElement))) {
				resultCount += boardService.deleteBoard(Integer.parseInt(boardIdElement));
			}
		}
		
		if (resultCount == 0) {
			result = "unchanged";
		}
		else {
			result = "changed";
		}
		
		redirectAttributes.addFlashAttribute("result", result);
		redirectAttributes.addFlashAttribute("resultCount", resultCount);
		
		return "redirect:/board/notice";
	}
}
