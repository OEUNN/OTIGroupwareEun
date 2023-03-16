package com.oti.groupware.a.dao;

import com.oti.groupware.board.dto.BoardCategory;

public interface BoardCategoryDAO {
	public BoardCategory getBoardCategoryById(int boardCategoryId);
	public void insertBoardCategory(BoardCategory boardCategory);
	public void updateBoardCategory(BoardCategory boardCategory);
	public void deleteBoardCategory(int boardCategoryId);
}