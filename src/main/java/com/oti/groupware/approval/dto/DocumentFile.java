package com.oti.groupware.approval.dto;

import lombok.Data;

@Data
public class DocumentFile {
    private int docFileId;
    private String docId;
    private String docFileName;
    private byte[] docFileData;
    private String docFileType;
    private long docFileLength;
}