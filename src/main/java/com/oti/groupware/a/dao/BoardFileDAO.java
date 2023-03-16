package com.oti.groupware.a.dao;

import com.oti.groupware.board.dto.BoardFile;

public interface BoardFileDAO {
	public BoardFile getBoardFileById(int boardFileId);
	public void insertBoardFile(BoardFile boardFile);
	public void updateBoardFile(BoardFile boardFile);
	public void deleteBoardFile(int boardFileId);
}