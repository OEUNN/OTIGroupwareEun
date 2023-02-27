package com.oti.groupware.board.dao;

import com.oti.groupware.board.dto.Board;

public interface BoardDAO {
	Board getBoardById(int boardId);
    void insertBoard(Board board);
    void updateBoard(Board board);
    void deleteBoard(int boardId);
}