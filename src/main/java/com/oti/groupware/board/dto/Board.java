package com.oti.groupware.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
    private int boardId;
    private String empId;
    private int boardCategoryId;
    private String boardTitle;
    private String boardContent;
    private Date boardDate;
    private char boardFileYn;
}