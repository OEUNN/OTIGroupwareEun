package com.oti.groupware.board.dto;

import lombok.Data;

@Data
public class BoardFileDTO {
    private int boardFileId;
    private int boardId;
    private String boardFileName;
    private byte[] boardFileData;
    private String boardFileType;
    private int boardFileLength;
}