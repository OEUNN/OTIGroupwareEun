package com.oti.groupware.board.dao;

import com.oti.groupware.board.dto.BoardCategory;

public interface BoardCategoryDAO {
	BoardCategory getBoardCategoryById(int boardCategoryId);
    void insertBoardCategory(BoardCategory boardCategory);
    void updateBoardCategory(BoardCategory boardCategory);
    void deleteBoardCategory(int boardCategoryId);
}

