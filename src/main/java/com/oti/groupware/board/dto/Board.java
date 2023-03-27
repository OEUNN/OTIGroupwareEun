package com.oti.groupware.board.dto;

import java.util.Date;
import java.util.List;

import com.oti.groupware.employee.dto.Employee;

import lombok.Data;

@Data
public class Board {
    private int boardId;
    private String empId;
    private String empName;
    private int boardCategoryId;
    private String boardTitle;
    private String boardContent;
    private Date boardDate;
    private String boardFileYn;
    
    private List<BoardFile> boardFiles;
    private Employee employee;
}