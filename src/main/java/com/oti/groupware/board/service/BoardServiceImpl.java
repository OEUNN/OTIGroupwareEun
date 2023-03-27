package com.oti.groupware.board.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.board.dao.BoardDAO;
import com.oti.groupware.board.dao.BoardFileDAO;
import com.oti.groupware.board.dto.Board;
import com.oti.groupware.board.dto.BoardFile;
import com.oti.groupware.common.Pager;

@Service
public class BoardServiceImpl implements BoardService {
	
	Board board;
	
	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	BoardFileDAO boardFileDAO;
	
	@Override
	@Transactional
	public Board getBoardById(int boardId) {
		board = boardDAO.getBoardById(boardId);
		board.setBoardFiles(boardFileDAO.getBoardFilesByBoardId(boardId));
		return board;
	}

	@Override
	@Transactional
	public List<Board> getBoardList(Pager pager, int pageNo) {
		int totalRows = boardDAO.getBoardCount();
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(5);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return boardDAO.getBoardList(pager);
	}

	@Override
	@Transactional
	public List<Board> getBoardListByTitle(String title, Pager pager, int pageNo) {
		int totalRows = boardDAO.getBoardCount();
		pager.setRowsPerPage(10);
		pager.setPagesPerGroup(5);
		pager.setTotalRows(totalRows);
		pager.setPageNo(pageNo);
		return boardDAO.getBoardListByTitle(title, pager);
	}

	@Override
	public BoardFile getBoardFile(int boardFileId) {
		return boardFileDAO.getBoardFileById(boardFileId);
	}
	
	@Override
	public List<BoardFile> getBoardFilesByBoardId(int boardId) {
		return boardFileDAO.getBoardFilesByBoardId(boardId);
	}

	@Override
	public int writeBoard(Board board) {
		boardDAO.insertBoard(board);
		return boardDAO.getBoardId();
	}
	
	@Override
	@Transactional
	public int writeBoard(Board board, MultipartFile[] files) throws IOException {
		if (files != null && files[0].getOriginalFilename() != null && !("".equals(files[0].getOriginalFilename()))) {
			board.setBoardFileYn("Y");
		}
		else {
			board.setBoardFileYn("N");
		}
		boardDAO.insertBoard(board);
		int boardId = boardDAO.getBoardId();
		if ("Y".equals(board.getBoardFileYn())) {
			for (MultipartFile file : files) {
				if (!("".equals(file.getOriginalFilename())) && file.getOriginalFilename() != null) {
					BoardFile boardFile = new BoardFile();
					boardFile.setBoardId(boardId);
					boardFile.setBoardFileData(file.getBytes());
					boardFile.setBoardFileLength(file.getSize());
					boardFile.setBoardFileName(file.getOriginalFilename());
					boardFile.setBoardFileType(file.getContentType());
					boardFileDAO.insertBoardFile(boardFile);
				}
			}
		}
		return boardId;
	}

	@Override
	public void updateBaord(Board board) {
		boardDAO.updateBoard(board);
	}

	@Override
	public int deleteBoard(int boardId) {
		return boardDAO.deleteBoard(boardId);
	}

	@Override
	public Board getBoard() {
		return boardDAO.getBoard();
	}

}
