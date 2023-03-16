package com.oti.groupware.a.dto;

import lombok.Data;

@Data
public class BoardFile {
    private int boardFileId;
    private int boardId;
    private String boardFileName;
    private byte[] boardFileData;
    private String boardFileType;
    private int boardFileLength;
}