package com.oti.groupware.a.dao;

import com.oti.groupware.board.dto.Board;

public interface BoardDAO {
	public Board getBoardById(int boardId);
	public void insertBoard(Board board);
	public void updateBoard(Board board);
	public void deleteBoard(int boardId);
}