package com.oti.groupware.a.dto;

import lombok.Data;

@Data
public class MailFile {
    private int mailFileId;
    private int sendMailId;
    private String mailFileName;
    private byte[] mailFileData;
    private String mailFileType;
    private long mailFileLength;
}