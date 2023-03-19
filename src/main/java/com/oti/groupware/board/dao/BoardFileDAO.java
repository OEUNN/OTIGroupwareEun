package com.oti.groupware.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.oti.groupware.board.dto.BoardFile;

@Repository
public interface BoardFileDAO {
	public BoardFile getBoardFileById(int boardFileId);
	public void insertBoardFile(BoardFile boardFile);
	public void updateBoardFile(BoardFile boardFile);
	public void deleteBoardFile(int boardFileId);
	
	public List<BoardFile> getBoardFilesByBoardId(int boardId);
}