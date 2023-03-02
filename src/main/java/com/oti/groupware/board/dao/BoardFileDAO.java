package com.oti.groupware.board.dao;

import com.oti.groupware.board.dto.BoardFile;

public interface BoardFileDAO {
	public BoardFile getBoardFileById(int boardFileId);
	public void insertBoardFile(BoardFile boardFile);
	public void updateBoardFile(BoardFile boardFile);
	public void deleteBoardFile(int boardFileId);
}