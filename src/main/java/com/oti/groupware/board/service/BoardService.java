package com.oti.groupware.board.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oti.groupware.board.dto.Board;
import com.oti.groupware.board.dto.BoardFile;
import com.oti.groupware.common.Pager;

public interface BoardService {
	public Board getBoardById(int boardId);
	public List<Board> getBoardList(Pager pager, int pageNo);
	public List<Board> getBoardListByTitle(String title, Pager pager, int pageNo);
	public BoardFile getBoardFile(int boardFileId);
	public List<BoardFile> getBoardFilesByBoardId(int boardId);
	public int writeBoard(Board board);
	public int writeBoard(Board board, MultipartFile[] files) throws IOException;
	public void updateBaord(Board board);
	public void deleteBoard(int boardId);
	public Board getBoard();
}
