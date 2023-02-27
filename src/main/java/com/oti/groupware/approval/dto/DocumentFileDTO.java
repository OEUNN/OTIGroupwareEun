package com.oti.groupware.approval.dto;

import lombok.Data;

@Data
public class DocumentFileDTO {
    private int docFileId;
    private int docId;
    private String docFileName;
    private byte[] docFileData;
    private String docFileType;
    private int docFileLength;
}