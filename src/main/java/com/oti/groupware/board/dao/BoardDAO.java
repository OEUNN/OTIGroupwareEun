package com.oti.groupware.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oti.groupware.board.dto.Board;
import com.oti.groupware.common.Pager;

@Repository
public interface BoardDAO {
	public Board getBoardById(int boardId);
	public void insertBoard(Board board);
	public void updateBoard(Board board);
	public int deleteBoard(int boardId);
	
	public int getBoardId();
	public int getBoardCount();
	public List<Board> getBoardList(@Param("pager") Pager pager);
	public List<Board> getBoardListByTitle(@Param("title") String title, @Param("pager") Pager pager);
	public Board getBoard();
}