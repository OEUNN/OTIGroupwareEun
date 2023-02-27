package com.oti.groupware.board.dao;

import com.oti.groupware.board.dto.BoardFile;

public interface BoardFileDAO {
	BoardFile getBoardFileById(int boardFileId);
    void insertBoardFile(BoardFile boardFile);
    void updateBoardFile(BoardFile boardFile);
    void deleteBoardFile(int boardFileId);
}